# Easy to use file relative paths.
#
#     ( ThisFile / "foo.rb" ).should == File.expand_path("../foo,rb", __FILE__ )
#
class ThisFile

  private
	CALLER_RE = /(.*):([0-9]+)(:in \'(.*)')?/
	def self.parse_backtrace(backtrace)
	  backtrace.collect do |c|
	    CALLER_RE.match(c)[1]
	  end
	end

  public
  def self.__file__(n=0)
    begin
      raise "foo"
    rescue Exception => e
      parse_backtrace(e.backtrace)[n]
    end
  end

  def self.expand_path( path )
    File.expand_path( path, File.dirname(ThisFile.__file__(2)))
  end

  def self./ (path)
    File.expand_path( path, File.dirname(ThisFile.__file__(2)))
  end

end

