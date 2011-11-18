Rake.application['sunspot:reindex'].clear

namespace :sunspot do
  desc "Reindex all solr models that are located in your application's models directory."
  task :reindex, [:batch_size, :models] => :environment do |t, args|
    reindex_options = {:batch_commit => false}
    case args[:batch_size]
    when 'false'
      reindex_options[:batch_size] = nil
    when /^\d+$/
      reindex_options[:batch_size] = args[:batch_size].to_i if args[:batch_size].to_i > 0
    end
    unless args[:models]
      all_files = Dir.glob(Rails.root.join('app', 'models', '*.rb'))
      all_models = all_files.map { |path| File.basename(path, '.rb').camelize.constantize }
      sunspot_models = all_models.select { |m| m.respond_to?(:searchable?) && m.searchable? }
    else
      sunspot_models = args[:models].split('+').map{|m| m.constantize}
    end
    sunspot_models.each do |model|
      model.solr_reindex reindex_options
    end
  end
end
