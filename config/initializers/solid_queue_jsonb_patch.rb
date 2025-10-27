module SolidQueue
  class Job
    undef_method :arguments if method_defined?(:arguments)
  end
end
