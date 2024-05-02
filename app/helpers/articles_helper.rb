

module ArticlesHelper
    def status_color_class(status)
      case status
      when 'public'
        'text-success' # Green color for public status
      when 'private'
        'text-warning' # Yellow color for private status
      when 'archived'
        'text-danger'  # Red color for archived status
      else
        'text-muted'   # Default color for other statuses
      end
    end
  end
  