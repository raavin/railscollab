=begin
RailsCollab
-----------

Copyright (C) 2007 - 2008 James S Urquhart (jamesu at gmail.com)

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
=end

class AdministrationTool < ActiveRecord::Base
  include ActionController::UrlWriter

  def self.admin_list
    AdministrationTool.all(:order => "#{self.connection.quote_column_name 'order'}")
  end

  def display_name
    "administration_tool_#{self.name}".to_sym.l
  end

  def display_description
    "administration_tool_#{self.name}_description".to_sym.l
  end

  def object_url
    url_for :only_path => true, :controller => self.controller, :action => self.action
  end
end
