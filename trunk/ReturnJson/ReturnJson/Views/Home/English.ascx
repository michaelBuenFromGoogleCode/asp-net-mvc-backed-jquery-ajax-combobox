<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<% 
	string update_date = "2011/01/25";
	string ver         = "3.6";
	string page_title  = "(Demo)jquery.ajaxComboBox." + ver + ".js";
%>
<!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
		<title><%:page_title%></title>
		<link rel="stylesheet" type="text/css" href="../../acbox/css/jquery.ajaxComboBox.css">

		<script type="text/javascript" src="../../jquery.js"></script>
		<script type="text/javascript" src="../../acbox/js/jquery.ajaxComboBox.<%:ver%>.js"></script>

		<link rel="stylesheet" type="text/css" href="../../sample.css">
		<script type="text/javascript" src="../../sample_en.js"></script>
	</head>
<body>
<h2><%:page_title%></h2>
<p class="date"><%:update_date%></p>

<a href="/Home/Japanese/">=> 日本語版</a>

<ul>
	<li>Server Side : ASP.NET MVC 2</li>
	<li>DB : SQLite2</li>
	<li>DOCTYPE : HTML5</li>
    <br />
    <li>Ported to ASP.NET MVC code on February 15, 2011</li>
</ul>

<!--**************************************************** -->
<h4 id="idx_area">Contents</h4>
<ol>
	<li class="big_idx">
		<a href="#sample01">Basic usage</a>
		<ol>
			<li><a href="#sample01_01">Basic</a></li>
			<li><a href="#sample01_02">The number of displays of the list and page is changed.</a></li>
			<li><a href="#sample01_03">Simple Page-navi</a></li>
		</ol>
	</li>
	<li class="big_idx">
		<a href="#sample02">Display Sub-info</a>
		<ol>
			<li><a href="#sample02_01">Basic</a></li>
			<li><a href="#sample02_02">The item name of the table is changed.</a></li>
			<li><a href="#sample02_03">Setting of display field of Sub-info.</a></li>
			<li><a href="#sample02_04">Setting of hidden field of Sub-info.</a></li>
		</ol>
	</li>
	<li class="big_idx"><a href="#sample03">Select-only</a>
		<ol>
			<li><a href="#sample03_01">Basic</a></li>
			<li><a href="#sample03_02">Setting of Primary key.</a></li>
		</ol>
	</li>
	<li class="big_idx">
		<a href="#sample04">Mini-size</a>
		<ol>
			<li><a href="#sample04_01">Basic</a></li>
			<li><a href="#sample04_02">Sub-info</a></li>
			<li><a href="#sample04_03">Select-only</a></li>
		</ol>
	</li>
	<li class="big_idx">
		<a href="#sample05">Package</a>
		<ol>
			<li><a href="#sample05_01">Basic</a></li>
			<li><a href="#sample05_02">Sub-info</a></li>
			<li><a href="#sample05_03">Select-only</a></li>
			<li><a href="#sample05_04">Mini-size</a></li>
		</ol>
	</li>
	<li class="big_idx">
		<a href="#sample06">Initial Value</a>
		<ol>
			<li><a href="#sample06_01">Basic</a></li>
			<li><a href="#sample06_02">Select-only</a></li>
			<li><a href="#sample06_03">Package</a></li>
		</ol>
	</li>
	<li class="big_idx">
		<a href="#sample07">for CakePHP</a>
		<ol>
			<li><a href="#sample07_01">Basic</a></li>
			<li><a href="#sample07_02">for the field of foreign-key</a></li>
			<li><a href="#sample07_03">Package</a></li>
		</ol>
	</li>
</ol>
<!--**************************************************** -->
<h4 id="sample01">Basic usage</h4>

<h5 id="sample01_01">Basic</h5>
<p>
	First parameter => File name transmitted by Ajax<br />
	Second parameter => Options
</p>
<label for="ac01_01_1">Nation:</label>
<div id="ac01_01" class="ac_area"></div>
<input class="check_btn" type="button" value="Check the value." onclick="displayResult('ac01_01')" />
<code>
  $('#ac01_01').ajaxComboBox(
    '/TheJson/List/',
    {
      <span class="green">'lang'        : 'en',</span>
      'db_table'    : 'nation',
      'order_field' : 'id'
    }
  );

</code>
<p>
	In the default state,"name" and "id" attribute of Text-box outputted<br />
	is decided from "id" attribute of Element where ComboBox is set up.
</p>
<code>
&lt;div id=&quot;<span class="green">ac01</span>&quot;&gt;&lt;/div&gt;
  ↓
&lt;input id=&quot;<span class="green">ac01_1</span>&quot; name=&quot;<span class="green">ac01_1</span>&quot; /&gt;

</code>
<!--------------------------------------------------------->
<h5 id="sample01_02">The number of displays of the list and page is changed. </h5>
<p>
	"per_page" option => The number of displays of lists is changed.<br />
	"navi_num" option => The number of page is changed.
</p>
<label for="ac01_02_1">Name:</label>
<div id="ac01_02" style="width:400px"></div>
<input class="check_btn" type="button" value="Check the value." onclick="displayResult('ac01_02')" />
<code>
  $('#ac01_02').ajaxComboBox(
    '/TheJson/List/',
    {
      'lang'        : 'en',
      'db_table'    : 'name_en',
      <span class="green">'per_page'    : 20,</span>
      <span class="green">'navi_num'    : 10,</span>
    }

</code>
<!--------------------------------------------------------->
<h5 id="sample01_03">Simple Page-navi</h5>
<p>
	Please set "navi_simple" option when you want to narrow<br />
	the width of the ComboBox as much as possible.
</p>
<label for="ac01_03_1">Name:</label>
<div id="ac01_03" style="width:160px"></div>
<input class="check_btn" type="button" value="Check the value." onclick="displayResult('ac01_03')" />
<code>
  $('#ac01_03').ajaxComboBox(
    '/TheJson/List/',
    {
      'lang'        : 'en',
      'db_table'    : 'name_en',
      'navi_num'    : 1,
      <span class="green">'navi_simple' : true</span>
    }

</code>

<div class="top_navi"><a href="#idx_area"> To contents </a></div>
<!--**************************************************** -->
<h4 id="sample02">Display Sub-info</h4>
<p>
	Each candidate can be distinguished when there is a candidate of the same name.
</p>
<h5 id="sample02_01">Basic</h5>
<p>
	Only "sub_info" option set "true".
</p>
<label for="ac02_01_1">Employee:</label>
<div id="ac02_01" class="ac_area"></div>
<input class="check_btn" type="button" value="Check the value." onclick="displayResult('ac02_01')" />
<code>
  $('#ac02_01').ajaxComboBox(
    '/TheJson/List/',
    {
      'lang'        : 'en',
      'db_table'    : 'employee_en',
      <span class="green">'sub_info'    : true</span>
    }
  );

</code>
<!--------------------------------------------------------->
<h5 id="sample02_02">The item name of the table is changed.</h5>
<p>
	"sub_as" option can change the field-name.
</p>
<label for="ac02_02_1">Employee:</label>
<div id="ac02_02" class="ac_area"></div>
<input class="check_btn" type="button" value="Check the value." onclick="displayResult('ac02_02')" />
<code>
  $('#ac02_02').ajaxComboBox(
    '/TheJson/List/',
    {
      'lang'        : 'en',
      'db_table'    : 'employee_en',
      'sub_info'    : true,
      <span class="green">'sub_as'      : {</span>
        <span class="green">'id'       : 'Employer ID',</span>
        <span class="green">'post'     : 'Post',</span>
        <span class="green">'position' : 'Position'</span>
      <span class="green">}</span>
    }
  );

</code>
<!--------------------------------------------------------->
<h5 id="sample02_03">Setting of display field of Sub-info.</h5>
<p>
	"show_field" option choose the displayed field-name.
</p>
<label for="ac02_03_1">Employee:</label>
<div id="ac02_03" class="ac_area"></div>
<input class="check_btn" type="button" value="Check the value." onclick="displayResult('ac02_03')" />
<code>
  $('#ac02_03').ajaxComboBox(
    '/TheJson/List/',
    {
      'lang'        : 'en',
      'db_table'    : 'employee_en',
      'sub_info'    : true,
      'sub_as'      : {
        'post'     : 'Post',
        'position' : 'Position'
      },
      <span class="green">'show_field'  : 'position,post'</span>
    }
  );

</code>
<!--------------------------------------------------------->
<h5 id="sample02_04">Setting of hidden field of Sub-info.</h5>
<p>
	"hide_field" option choose the hidden field-name.
</p>
<label for="ac02_04_1">Employee:</label>
<div id="ac02_04" class="ac_area"></div>
<input class="check_btn" type="button" value="Check the value." onclick="displayResult('ac02_04')" />
<code>
  $('#ac02_04').ajaxComboBox(
    '/TheJson/List/',
    {
      'lang'        : 'en',
      'db_table'    : 'employee_en',
      'sub_info'    : true,
      'sub_as'      : {
        'id'       : 'Employer ID'
      },
      <span class="green">'hide_field'  : 'position,post'</span>
    }
  );

</code>
<div class="top_navi"><a href="#idx_area"> To contents </a></div>
<!--**************************************************** -->
<h4 id="sample03">Select-only</h4>
<h5 id="sample03_01">Basic</h5>
<p>
	When the value that doesn't exist in the list is input, warning is received.
</p>
<label for="ac03_01_1">Employee:</label>
<div id="ac03_01" class="ac_area"></div>
<input class="check_btn" type="button" value="Check the value." onclick="displayResult('ac03_01')" />
<code>
  $('#ac03_01').ajaxComboBox(
    '/TheJson/List/',
    {
      'lang'        : 'en',
      'db_table'    : 'employee_en',
      'sub_info'    : true,
      <span class="green">'select_only' : true</span>
    }
  );

</code>
<p>
	If this option is set, the value of "Primary_key" field transmit by the form.
</p>
<code>
<span class="gray">//Text-box</span>
&lt;input id=&quot;ac03_01_1&quot; name=&quot;<span class="green">ac03_01_1</span>&quot; type=&quot;text&quot; /&gt;

<span class="gray">//List</span>
...
&lt;li id=&quot;A010&quot; class=&quot;&quot;&gt;Adams&lt;/li&gt;
&lt;li id=&quot;<span class="red">A009</span>&quot; class=&quot;ac_over&quot;&gt;Adams&lt;/li&gt;
&lt;li id=&quot;A005&quot; class=&quot;&quot;&gt;Adams&lt;/li&gt;
...

<span class="gray">//Hidden field</span>
&lt;input type=&quot;hidden&quot; name=&quot;<span class="green">ac03_01_1</span>&quot; value=&quot;<span class="red">A011</span>&quot;/&gt;

</code>
<!--------------------------------------------------------->
<h5 id="sample03_02">Setting of Primary key.</h5>
<label for="ac03_02_1">Nation:</label>
<div id="ac03_02" class="ac_area"></div>
<input class="check_btn" type="button" value="Check the value." onclick="displayResult('ac03_02')" />
<code>
  $('#ac03_02').ajaxComboBox(
    '/TheJson/List/',
    {
      'lang'        : 'en',
      'db_table'    : 'nation',
      'order_field' : 'id',
      'show_field'  : 'id',
      'sub_info'    : true,
      'select_only' : true,
      <span class="green">'primary_key' : 'name'</span>
    }
  );

</code>
<div class="top_navi"><a href="#idx_area"> To contents </a></div>
<!--**************************************************** -->
<h4 id="sample04">Mini-size</h4>
<h5 id="sample04_01">Basic</h5>
<label for="ac04_01_1">Nation:</label>
<div id="ac04_01" class="ac_area_mini"></div>
<input class="check_btn" type="button" value="Check the value." onclick="displayResult('ac04_01')" />
<code>
  $('#ac04_01').ajaxComboBox(
    '/TheJson/List/',
    {
      'lang'        : 'en',
      'db_table'    : 'nation',
      'order_field' : 'id',
      <span class="green">'mini'        : true</span>
    }
  );

</code>

<!--------------------------------------------------------->
<h5 id="sample04_02">Sub-info</h5>
<label for="ac04_02_1">社員情報:</label>
<div id="ac04_02" class="ac_area_mini"></div>
<input class="check_btn" type="button" value="Check the value." onclick="displayResult('ac04_02')" />

<!--------------------------------------------------------->
<h5 id="sample04_03">Select-only</h5>
<label for="ac04_03_1">Nation:</label>
<div id="ac04_03" class="ac_area_mini"></div>
<input class="check_btn" type="button" value="Check the value." onclick="displayResult('ac04_03')" />


<div class="top_navi"><a href="#idx_area"> To contents </a></div>
<!--**************************************************** -->
<h4 id="sample05">Package</h4>
<h5 id="sample05_01">Basic</h5>
<label for="ac05_01_1">Nation:</label>
<div id="ac05_01" class="ac_area"></div>
<input class="check_btn" type="button" value="Check the value." onclick="displayResult('ac05_01')" />

<code>
  $('#ac05_01').ajaxComboBox(
    '/TheJson/List/',
    {
      'lang'        : 'en',
      'db_table'    : 'nation',
      'order_field' : 'id',
      <span class="green">'package'     : true</span>
    }
  );

</code>

<!--------------------------------------------------------->
<h5 id="sample05_02">Sub-info</h5>
<label for="ac05_02_1">Employee:</label>
<div id="ac05_02" class="ac_area"></div>
<input class="check_btn" type="button" value="Check the value." onclick="displayResult('ac05_02')" />

<!--------------------------------------------------------->
<h5 id="sample05_03">Select-only</h5>
<label for="ac05_03_1">Nation:</label>
<div id="ac05_03" class="ac_area"></div>
<input class="check_btn" type="button" value="Check the value." onclick="displayResult('ac05_03')" />

<!--------------------------------------------------------->
<h5 id="sample05_04">Mini-size</h5>
<label for="ac05_04_1">Nation:</label>
<div id="ac05_04" class="ac_area_mini"></div>
<input class="check_btn" type="button" value="Check the value." onclick="displayResult('ac05_04')" />

<div class="top_navi"><a href="#idx_area"> To contents </a></div>
<!--**************************************************** -->
<h4 id="sample06">Initial Value</h4>
<p>
	Setting Initial Value.<br />
	It is necessary to pass an Initial Value in the <span class="red bold">Array</span>.
</p>
<h5 id="sample06_01">Basic</h5>
<label for="ac06_01_1">Nation:</label>
<div id="ac06_01" class="ac_area"></div>
<input class="check_btn" type="button" value="Check the value." onclick="displayResult('ac06_01')" />

<code>
  $('#ac06_01').ajaxComboBox(
    '/TheJson/List/',
    {
      'lang'        : 'en',
      'db_table'    : 'prefectures',
      'order_field' : 'id',
      <span class="green">'init_val'    : <span class="red">[</span>'Japan'<span class="red">]</span></span>
    }
  );

</code>
<!--------------------------------------------------------->
<h5 id="sample06_02">Select-only</h5>
<label for="ac06_02_1">Nation:</label>
<div id="ac06_02" class="ac_area"></div>
<input class="check_btn" type="button" value="Check the value." onclick="displayResult('ac06_02')" />

<code>
  $('#ac06_02').ajaxComboBox(
    '/TheJson/List/',
    {
      'lang'        : 'en',
      'db_table'    : 'prefectures',
      'order_field' : 'id',
      <span class="green">'select_only' : true,</span>
      <span class="green">'primary_key' : 'id',</span>
      <span class="green">'init_val'    : <span class="red">[</span>28<span class="red">]</span></span>
    }
  );

</code>
<!--------------------------------------------------------->
<h5 id="sample06_03">Package</h5>
<label for="ac06_03_1">Nation:</label>
<div id="ac06_03" class="ac_area"></div>
<input class="check_btn" type="button" value="Check the value." onclick="displayResult('ac06_03')" />

<code>
  $('#ac06_03').ajaxComboBox(
    '/TheJson/List/',
    {
      'lang'        : 'en',
      'db_table'    : 'prefectures',
      'order_field' : 'id',
      <span class="green">'select_only' : true,</span>
      <span class="green">'primary_key' : 'id',</span>
      <span class="green">'init_val'    : <span class="red">[</span>28,29,30<span class="red">]</span>,</span>
      <span class="green">'package'     : true</span>
    }
  );

</code>

<div class="top_navi"><a href="#idx_area"> To contents </a></div>
<!--**************************************************** -->
<h4 id="sample07">for CakePHP</h4>
<p>
	Outputting "id" and "name" attributes of ComboBox for CakePHP.
</p>
<h5 id="sample07_01">Basic</h5>
<p>
	If "cake_rule" option is "true", "id" and "name" attributes output<br />
	from "db_table" and "field" options.
</p>
<label for="nationName">Nation:</label>
<div id="ac07_01" class="ac_area"></div>
<input class="check_btn" type="button" value="Check the value." onclick="displayResult('ac07_01')" />

<code>
<span class="bold">jQuery:</span>
  $('#ac07_01').ajaxComboBox(
    '/TheJson/List/',
    {
      'lang'        : 'en',
      'db_table'    : <span class="underline">'nation'</span>,
      'field'       : <span class="underline">'name'</span>,
      'order_field' : 'id',
      <span class="green">'cake_rule'   : true</span>
    }
  );


<span class="bold">HTML:</span>
&lt;input type=&quot;text&quot; id=&quot;<span class="underline">nationName</span>&quot; name=&quot;data[<span class="underline">nation</span>][<span class="underline">name</span>]&quot; /&gt;

</code>

<!--------------------------------------------------------->
<h5 id="sample07_02">for the field of foreign-key</h5>
<p>
	For suggest-list : "db_table" and "field" options<br />
	For preservation to database : "cake_model" and "cake_field" options
</p>
<label for="UserNationId">Nation:</label>
<div id="ac07_02" class="ac_area"></div>
<input class="check_btn" type="button" value="Check the value." onclick="displayResult('ac07_02')" />

<code>
<span class="bold">jQuery:</span>
  $('#ac07_02').ajaxComboBox(
    '/TheJson/List/',
    {
      'lang'        : 'en',
      'db_table'    : 'nation',
      'field'       : 'name',
      'order_field' : 'id',
      'select_only' : true,
      'cake_rule'   : true,
      <span class="green">'cake_model'</span>  : '<span class="underline">User</span>',
      <span class="green">'cake_field'</span>  : '<span class="underline">nation_id</span>'
    }
  );

<span class="bold">HTML:</span>
&lt;input type=&quot;text&quot; id=&quot;<span class="underline">UserNationId</span>&quot; name=&quot;data[<span class="underline">User</span>][<span class="underline">nation_id</span>]&quot; /&gt;

</code>

<!--------------------------------------------------------->
<h5 id="sample07_03">Package</h5>
<p>
	The sequential number is added like multiple-select-box.
</p>
<label for="UserNationId0">Nation:</label>
<div id="ac07_03" class="ac_area"></div>
<input class="check_btn" type="button" value="Check the value." onclick="displayResult('ac07_03')" />

<code>
<span class="bold">jQuery:</span>
  $('#ac07_02').ajaxComboBox(
    '/TheJson/List/',
    {
      'lang'        : 'en',
      'db_table'    : 'nation',
      'field'       : 'name',
      'order_field' : 'id',
      'select_only' : true,
      'cake_rule'   : true,
      'cake_model'  : '<span class="underline">User</span>',
      'cake_field'  : '<span class="underline">nation_id</span>',
      <span class="green">'package'     : true</span>
    }
  );

<span class="bold">HTML:</span>
&lt;input type=&quot;text&quot; id=&quot;<span class="underline">UserNationId0</span>&quot; name=&quot;data[<span class="underline">User</span>][<span class="underline">nation_id</span>][<span class="underline">0</span>]&quot; /&gt;

</code>

<div class="top_navi"><a href="#idx_area"> To contents </a></div>
<!--**************************************************** -->
<hr />
<address>
Author : sutara_lumpur /
<a href="http://d.hatena.ne.jp/sutara_lumpur/20090124/1232781879">Blog</a> /
<a href="http://twitter.com/sutara_lumpur">Twitter</a> /
<img src="mail_image.png" alt="mail address" />
</address>

<address>
PHP ported to ASP.NET MVC by Michael Buen | <a href="http://ienablemuch.com/">Blog</a> | <a href="http://twitter.com/ienablemuch/">Twitter</a>
</address>
</body>
</html>
