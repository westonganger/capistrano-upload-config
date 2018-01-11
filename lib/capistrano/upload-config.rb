load File.expand_path('../tasks/upload-config.rake', __FILE__)

module CapistranoUploadConfig
  class Helpers
    class << self

      def get_config_name(config, stage, local_base_dir)
        path = File.dirname(File.join(local_base_dir, config))
        extension = File.extname(config)
        filename = File.basename(config, extension)
        extension.sub!(/^\./, '')
        local_file = [filename, stage].join('.')
        local_file = [local_file, extension].join('.') unless extension.empty?
        
        file = File.join(path, local_file)
        
        unless File.exist?(file)
          fallback_file = File.join(path, local_file.sub(".#{stage}", ''))
          if File.exist?(fallback_file)
            file = fallback_file
          end
        end
        
        return file
      end

    end
  end
end
