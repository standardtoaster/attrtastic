require 'helper'

class TestAttrtastic < Test::Unit::TestCase

  def setup
    setup_fixtures
  end

  def test_attrtastic_m
    expected = html <<-EOHTML
      <div class="attrtastic user">
        <div class="attributes">
          <div class="legend">User</div>
          <ol>
            <li>
              <span class="label">First name</span>
              <span class="value">John</span>
            </li>
            <li>
              <span class="label">Last name</span>
              <span class="value">Doe</span>
            </li>
          </ol>
        </div>

        <div class="attributes">
          <div class="legend">Contact</div>
          <ol>
            <li>
              <span class="label">Email</span>
              <span class="value">john@doe.com</span>
            </li>
          </ol>
        </div>
      </div>
    EOHTML

    @template.semantic_attributes_for(@user) do |attr|
      attr.attributes "User" do
        @template.output_buffer << (attr.attribute :first_name)
        @template.output_buffer << (attr.attribute :last_name)
      end
      attr.attributes "Contact" do
        @template.output_buffer << (attr.attribute :email)
      end
    end

    actual = @template.output_buffer.to_s
    assert_equal expected, actual
  end

end
