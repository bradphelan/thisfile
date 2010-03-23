require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'thisfile'

describe ThisFile do
  it "should be able to get the caller file" do
    ThisFile.__file__ == __FILE__
  end

  it "should be able to find a file relative to this one" do
    ThisFile.expand_path("foo.rb").should == File.expand_path("../foo.rb", __FILE__)

    # An operator version of this for happiness
    (ThisFile / "foo.rb").should == File.expand_path("../foo.rb", __FILE__)
  end
end

