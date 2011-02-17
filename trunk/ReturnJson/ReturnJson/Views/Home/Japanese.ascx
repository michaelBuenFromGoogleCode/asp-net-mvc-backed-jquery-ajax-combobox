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
		<link rel="stylesheet" type="text/css" href="/acbox/css/jquery.ajaxComboBox.css">

		<script type="text/javascript" src="/jquery.js"></script>
		<script type="text/javascript" src="/acbox/js/jquery.ajaxComboBox.<%:ver%>.js"></script>

		<link rel="stylesheet" type="text/css" href="/sample.css">
		<script type="text/javascript" src="/sample_ja.js"></script>
	</head>
	<body>
		<h2><%:page_title%></h2>
		<p class="date"><%:update_date%></p>

		<a href="/Home/English/">=> English version</a>
		<ul>
			<li>サーバサイド : PHP5</li>
			<li>DB : SQLite2</li>
			<li>文書宣言 : HTML5</li>
            <br />
            <li>Ported to ASP.NET MVC code on February 15, 2011</li>
		</ul>

		<!--**************************************************** -->
		<h4 id="idx_area">目次</h4>
		<ol>
			<li class="big_idx">
				<a href="#sample01">基本的な使い方</a>
				<ol>
					<li><a href="#sample01_01">基本</a></li>
					<li><a href="#sample01_02">候補リスト・隣接ページの表示数を変更</a></li>
					<li><a href="#sample01_03">ページナビをシンプルに</a></li>
				</ol>
			</li>
			<li class="big_idx">
				<a href="#sample02">サブ情報を表示</a>
				<ol>
					<li><a href="#sample02_01">基本</a></li>
					<li><a href="#sample02_02">表の項目名を変更</a></li>
					<li><a href="#sample02_03">サブ情報の表示カラムの設定</a></li>
					<li><a href="#sample02_04">サブ情報の非表示カラムの設定</a></li>
				</ol>
			</li>
			<li class="big_idx"><a href="#sample03">セレクト専用</a>
				<ol>
					<li><a href="#sample03_01">基本</a></li>
					<li><a href="#sample03_02">送信する値のカラムを変更</a></li>
				</ol>
			</li>
			<li class="big_idx">
				<a href="#sample04">ミニサイズ</a>
				<ol>
					<li><a href="#sample04_01">基本</a></li>
					<li><a href="#sample04_02">サブ情報</a></li>
					<li><a href="#sample04_03">セレクト専用</a></li>
				</ol>
			</li>
			<li class="big_idx">
				<a href="#sample05">パッケージ</a>
				<ol>
					<li><a href="#sample05_01">基本</a></li>
					<li><a href="#sample05_02">サブ情報</a></li>
					<li><a href="#sample05_03">セレクト専用</a></li>
					<li><a href="#sample05_04">ミニサイズ</a></li>
				</ol>
			</li>
			<li class="big_idx">
				<a href="#sample06">初期値設定</a>
				<ol>
					<li><a href="#sample06_01">基本</a></li>
					<li><a href="#sample06_02">セレクト専用</a></li>
					<li><a href="#sample06_03">パッケージ</a></li>
				</ol>
			</li>
			<li class="big_idx">
				<a href="#sample07">CakePHP用</a>
				<ol>
					<li><a href="#sample07_01">基本</a></li>
					<li><a href="#sample07_02">外部キーのフィールド用</a></li>
					<li><a href="#sample07_03">パッケージ</a></li>
				</ol>
			</li>
		</ol>
		<!--**************************************************** -->
		<h4 id="sample01">基本的な使い方</h4>

		<h5 id="sample01_01">基本</h5>
		<p>
			第1引数にAjax送信先のファイル名を、<br />
			第2引数にオプションを設定します。
		</p>
		<label for="ac01_01_1">都道府県:</label>
		<div id="ac01_01" class="ac_area"></div>
		<input class="check_btn" type="button" value="送信される値をチェック" onclick="displayResult('ac01_01')" />
<code>
  $('#ac01_01').ajaxComboBox(
    '/TheJson/List/',
    {
      'db_table'    : 'prefectures',
      'order_field' : 'id'
    }
  );

</code>
		<p>
			出力されるテキストボックスのname,id属性は、デフォルトでは<br />
			ComboBoxを設置する要素のid属性から決定されます。
		</p>
<code>
&lt;div id=&quot;<span class="green">ac01</span>&quot;&gt;&lt;/div&gt;
  ↓
&lt;input id=&quot;<span class="green">ac01_1</span>&quot; name=&quot;<span class="green">ac01_1</span>&quot; /&gt;

</code>
		<!--------------------------------------------------------->
		<h5 id="sample01_02">候補リスト・隣接ページの表示数を変更</h5>
		<p>
			"per_page"オプションで、候補リストの表示数を、<br />
			"navi_num"オプションで、隣接ページの表示数を変更できます。
		</p>
		<label for="ac01_02_1">人名:</label>
		<div id="ac01_02" style="width:400px"></div>
		<input class="check_btn" type="button" value="送信される値をチェック" onclick="displayResult('ac01_02')" />
<code>
  $('#ac01_02').ajaxComboBox(
    '/TheJson/List/',
    {
      'db_table'    : 'users',
      <span class="green">'per_page'    : 20,</span>
      <span class="green">'navi_num'    : 10,</span>
    }

</code>
		<!--------------------------------------------------------->
		<h5 id="sample01_03">ページナビをシンプルに</h5>
		<p>
			ComBoxの幅をできるだけ狭くしたい場合、"navi_simple"オプションで<br />
			先頭・末尾のページへのリンクを非表示にできます。<br />
			なお、キーボードのショートカットは有効のままです。(Shift + 右・左)
		</p>
		<label for="ac01_03_1">人名:</label>
		<div id="ac01_03" style="width:160px"></div>
		<input class="check_btn" type="button" value="送信される値をチェック" onclick="displayResult('ac01_03')" />
<code>
  $('#ac01_03').ajaxComboBox(
    '/TheJson/List/',
    {
      'db_table'    : 'users',
      'navi_num'    : 1,
      <span class="green">'navi_simple' : true</span>
    }

</code>

		<div class="top_navi"><a href="#idx_area"> ▲ 目次へ </a></div>
		<!--**************************************************** -->
		<h4 id="sample02">サブ情報を表示</h4>
		<p>
			同一名の候補がある場合、右側にサブ情報を表示させて<br />
			それぞれを区別することができます。
		</p>
		<h5 id="sample02_01">基本</h5>
		<p>
			"sub_info"オプションを真にするだけです。
		</p>
		<label for="ac02_01_1">社員名:</label>
		<div id="ac02_01" class="ac_area"></div>
		<input class="check_btn" type="button" value="送信される値をチェック" onclick="displayResult('ac02_01')" />
<code>
  $('#ac02_01').ajaxComboBox(
    '/TheJson/List/',
    {
      'db_table'    : 'employee_ja',
      <span class="green">'sub_info'    : true</span>
    }
  );

</code>
		<!--------------------------------------------------------->
		<h5 id="sample02_02">表の項目名を変更</h5>
		<p>
			何も設定しないと、サブ情報の表の項目名は、データベースの<br />
			カラム名が表示されてしまいます。<br />
			"sub_as"オプションで、表示名を変更できます。
		</p>
		<label for="ac02_02_1">社員名:</label>
		<div id="ac02_02" class="ac_area"></div>
		<input class="check_btn" type="button" value="送信される値をチェック" onclick="displayResult('ac02_02')" />
<code>
  $('#ac02_02').ajaxComboBox(
    '/TheJson/List/',
    {
      'db_table'    : 'employee_ja',
      'sub_info'    : true,
      <span class="green">'sub_as'      : {</span>
        <span class="green">'id'       : '社員番号',</span>
        <span class="green">'post'     : '部署',</span>
        <span class="green">'position' : '役職'</span>
      <span class="green">}</span>
    }
  );

</code>
		<!--------------------------------------------------------->
		<h5 id="sample02_03">サブ情報の表示カラムの設定</h5>
		<p>
			"show_field"オプションで設定します。<br />
			カンマ区切りで、複数のカラム名を指定します。<br />
			オプションでの記述の順番でカラムを取得します。<br />
		</p>
		<label for="ac02_03_1">社員名:</label>
		<div id="ac02_03" class="ac_area"></div>
		<input class="check_btn" type="button" value="送信される値をチェック" onclick="displayResult('ac02_03')" />
<code>
  $('#ac02_03').ajaxComboBox(
    '/TheJson/List/',
    {
      'db_table'    : 'employee_ja',
      'sub_info'    : true,
      'sub_as'      : {
        'post'     : '部署',
        'position' : '役職'
      },
      <span class="green">'show_field'  : 'position,post'</span>
    }
  );

</code>
		<!--------------------------------------------------------->
		<h5 id="sample02_04">サブ情報の非表示カラムの設定</h5>
		<p>
			"hide_field"オプションで設定します。<br />
			複数のカラムを取得する場合の記述のルールは<br />
			"show_field"オプションと同じです。<br />
		</p>
		<label for="ac02_04_1">社員名:</label>
		<div id="ac02_04" class="ac_area"></div>
		<input class="check_btn" type="button" value="送信される値をチェック" onclick="displayResult('ac02_04')" />
<code>
  $('#ac02_04').ajaxComboBox(
    '/TheJson/List/',
    {
      'db_table'    : 'employee_ja',
      'sub_info'    : true,
      'sub_as'      : {
        'id'       : '社員番号'
      },
      <span class="green">'hide_field'  : 'position,post'</span>
    }
  );

</code>
		<div class="top_navi"><a href="#idx_area"> ▲ 目次へ </a></div>
		<!--**************************************************** -->
		<h4 id="sample03">セレクト専用</h4>
		<h5 id="sample03_01">基本</h5>
		<p>
			リストからの選択しか受け付けません。<br />
			リストにない値を入力した場合、また、選択後に<br />
			文字列を削除・追加した場合、警告画像が表示されます。
		</p>
		<label for="ac03_01_1">社員名:</label>
		<div id="ac03_01" class="ac_area"></div>
		<input class="check_btn" type="button" value="送信される値をチェック" onclick="displayResult('ac03_01')" />
<code>
  $('#ac03_01').ajaxComboBox(
    '/TheJson/List/',
    {
      'db_table'    : 'employee_ja',
      'sub_info'    : true,
      <span class="green">'select_only' : true</span>
    }
  );

</code>
		<p>
			なお、このオプションを設定すると、フォームで送信されるのは<br />
			"primary_key"オプションで設定したカラムの値になります。
			この値は、候補リストの&lt;li&gt;要素のid属性にもなります。<br />
		</p>
		<p>
			テキストボックスと同じname属性を持つ隠しフィールド(hidden)を<br />
			生成し、リストから選択した場合のみ、"primary_key"の値を<br />
			hiddenのvalue属性に設定しています。
		</p>
		<code>
		<span class="gray">//テキストボックス</span>
		&lt;input id=&quot;ac03_01_1&quot; name=&quot;<span class="green">ac03_01_1</span>&quot; type=&quot;text&quot; /&gt;

		<span class="gray">//候補リスト</span>
		...
		&lt;li id=&quot;A014&quot; class=&quot;&quot;&gt;佐藤&lt;/li&gt;
		&lt;li id=&quot;<span class="red">A011</span>&quot; class=&quot;ac_over&quot;&gt;佐藤&lt;/li&gt;
		&lt;li id=&quot;A008&quot; class=&quot;&quot;&gt;佐藤&lt;/li&gt;
		...

		<span class="gray">//隠しフィールド</span>
		&lt;input type=&quot;hidden&quot; name=&quot;<span class="green">ac03_01_1</span>&quot; value=&quot;<span class="red">A011</span>&quot;/&gt;

		</code>
		<!--------------------------------------------------------->
		<h5 id="sample03_02">送信する値のカラムを変更</h5>
		<p>
			セレクト専用時のデフォルトでは、データベースのテーブルの<br />
			"id"カラムを探し、その値をフォーム送信に用います。<br />
			これを、"primary_key"オプションで変更することができます。
		</p>
		<label for="ac03_02_1">都道府県:</label>
		<div id="ac03_02" class="ac_area"></div>
		<input class="check_btn" type="button" value="送信される値をチェック" onclick="displayResult('ac03_02')" />
<code>
  $('#ac03_02').ajaxComboBox(
    '/TheJson/List/',
    {
      'db_table'    : 'prefectures',
      'order_field' : 'id',
      'show_field'  : 'id',
      'sub_info'    : true,
      'select_only' : true,
      <span class="green">'primary_key' : 'name'</span>
    }
  );

</code>
		<div class="top_navi"><a href="#idx_area"> ▲ 目次へ </a></div>
		<!--**************************************************** -->
		<h4 id="sample04">ミニサイズ</h4>
		<p>
			オプションをひとつ追加するだけで、ミニサイズのComboBoxを<br />
			簡単に作れます。<br />
			サイズが異なるだけで、設定できるオプションは共通です。<br />
			また、通常サイズとの併用も可能です。
		</p>
		<h5 id="sample04_01">基本</h5>
		<label for="ac04_01_1">都道府県:</label>
		<div id="ac04_01" class="ac_area_mini"></div>
		<input class="check_btn" type="button" value="送信される値をチェック" onclick="displayResult('ac04_01')" />
<code>
  $('#ac04_01').ajaxComboBox(
    '/TheJson/List/',
    {
      'db_table'    : 'prefectures',
      'order_field' : 'id',
      <span class="green">'mini'        : true</span>
    }
  );

</code>

		<!--------------------------------------------------------->
		<h5 id="sample04_02">サブ情報</h5>
		<label for="ac04_02_1">社員情報:</label>
		<div id="ac04_02" class="ac_area_mini"></div>
		<input class="check_btn" type="button" value="送信される値をチェック" onclick="displayResult('ac04_02')" />

		<!--------------------------------------------------------->
		<h5 id="sample04_03">セレクト専用</h5>
		<label for="ac04_03_1">都道府県:</label>
		<div id="ac04_03" class="ac_area_mini"></div>
		<input class="check_btn" type="button" value="送信される値をチェック" onclick="displayResult('ac04_03')" />


		<div class="top_navi"><a href="#idx_area"> ▲ 目次へ </a></div>
		<!--**************************************************** -->
		<h4 id="sample05">パッケージ</h4>
		<p>
			追加・削除ボタンを備えた、複数選択可能なパッケージとして<br />
			表示します。
		</p>
		<h5 id="sample05_01">基本</h5>
		<label for="ac05_01_1">都道府県:</label>
		<div id="ac05_01" class="ac_area"></div>
		<input class="check_btn" type="button" value="送信される値をチェック" onclick="displayResult('ac05_01')" />

<code>
  $('#ac05_01').ajaxComboBox(
    '/TheJson/List/',
    {
      'db_table'    : 'prefectures',
      'order_field' : 'id',
      <span class="green">'package'     : true</span>
    }
  );

</code>

		<p>
			なお、最初に表示されていた先頭のComboBoxを削除した場合、<br />
			&lt;label&gt;のfor属性は、新たな先頭のComboBoxのid属性に<br />
			書き換えられ、&lt;label&gt;をクリックした場合、必ず先頭の<br />
			ComboBoxにフォーカスされるようにします。
		</p>

		<!--------------------------------------------------------->
		<h5 id="sample05_02">サブ情報</h5>
		<label for="ac05_02_1">社員名:</label>
		<div id="ac05_02" class="ac_area"></div>
		<input class="check_btn" type="button" value="送信される値をチェック" onclick="displayResult('ac05_02')" />

		<!--------------------------------------------------------->
		<h5 id="sample05_03">セレクト専用</h5>
		<label for="ac05_03_1">都道府県:</label>
		<div id="ac05_03" class="ac_area"></div>
		<input class="check_btn" type="button" value="送信される値をチェック" onclick="displayResult('ac05_03')" />

		<!--------------------------------------------------------->
		<h5 id="sample05_04">ミニサイズ</h5>
		<label for="ac05_04_1">都道府県:</label>
		<div id="ac05_04" class="ac_area_mini"></div>
		<input class="check_btn" type="button" value="送信される値をチェック" onclick="displayResult('ac05_04')" />

		<div class="top_navi"><a href="#idx_area"> ▲ 目次へ </a></div>
		<!--**************************************************** -->
		<h4 id="sample06">初期値設定</h4>
		<p>
			ComboBoxに初期値を設定します。<br />
			初期値は、ひとつの場合でも<span class="red bold">配列</span>の形式で渡さなくてはなりません。
		</p>
		<h5 id="sample06_01">基本</h5>
		<label for="ac06_01_1">都道府県:</label>
		<div id="ac06_01" class="ac_area"></div>
		<input class="check_btn" type="button" value="送信される値をチェック" onclick="displayResult('ac06_01')" />

<code>
  $('#ac06_01').ajaxComboBox(
    '/TheJson/List/',
    {
      'db_table'    : 'prefectures',
      'order_field' : 'id',
      <span class="green">'init_val'    : <span class="red">[</span>'東京都'<span class="red">]</span></span>
    }
  );

</code>
		<!--------------------------------------------------------->
		<h5 id="sample06_02">セレクト専用</h5>
		<label for="ac06_02_1">都道府県:</label>
		<div id="ac06_02" class="ac_area"></div>
		<input class="check_btn" type="button" value="送信される値をチェック" onclick="displayResult('ac06_02')" />

<code>
  $('#ac06_02').ajaxComboBox(
    '/TheJson/List/',
    {
      'db_table'    : 'prefectures',
      'order_field' : 'id',
      <span class="green">'select_only' : true,</span>
      <span class="green">'primary_key' : 'id',</span>
      <span class="green">'init_val'    : <span class="red">[</span>13<span class="red">]</span></span>
    }
  );

</code>
		<!--------------------------------------------------------->
		<h5 id="sample06_03">パッケージ</h5>
		<label for="ac06_03_1">都道府県:</label>
		<div id="ac06_03" class="ac_area"></div>
		<input class="check_btn" type="button" value="送信される値をチェック" onclick="displayResult('ac06_03')" />

<code>
  $('#ac06_03').ajaxComboBox(
    '/TheJson/List/',
    {
      'db_table'    : 'prefectures',
      'order_field' : 'id',
      <span class="green">'select_only' : true,</span>
      <span class="green">'primary_key' : 'id',</span>
      <span class="green">'init_val'    : <span class="red">[</span>13,14,15<span class="red">]</span>,</span>
      <span class="green">'package'     : true</span>
    }
  );

</code>
		<div class="top_navi"><a href="#idx_area"> ▲ 目次へ </a></div>
		<!--**************************************************** -->
		<h4 id="sample07">CakePHP用</h4>
		<p>
			ComboBoxのid,name属性名をCakePHP用に出力します。
		</p>
		<h5 id="sample07_01">基本</h5>
		<p>
			"cake_rule"オプションを真にすると、<br />
			"db_table"と"field"を元にしてid,name属性名が決められます。
		</p>
		<label for="prefecturesName">都道府県:</label>
		<div id="ac07_01" class="ac_area"></div>
		<input class="check_btn" type="button" value="送信される値をチェック" onclick="displayResult('ac07_01')" />

<code>
<span class="bold">jQuery:</span>
  $('#ac07_01').ajaxComboBox(
    '/TheJson/List/',
    {
      'db_table'    : <span class="underline">'prefectures'</span>,
      'field'       : <span class="underline">'name'</span>,
      'order_field' : 'id',
      <span class="green">'cake_rule'   : true</span>
    }
  );

<span class="bold">HTML:</span>
&lt;input type=&quot;text&quot; id=&quot;<span class="underline">prefecturesName</span>&quot; name=&quot;data[<span class="underline">prefectures</span>][<span class="underline">name</span>]&quot; /&gt;

</code>

		<!--------------------------------------------------------->
		<h5 id="sample07_02">外部キーのフィールド用</h5>
		<p>
			対象のフィールドが外部キーを格納している場合、<br />
			候補リストに表示するためにアクセスするカラムと<br />
			送信後に保存するカラムは異なります。
		</p>
		<p>
			そのため、候補リスト用には従来どおり"db_table"と"field"を<br />
			元にしてDBにアクセスし、保存用には、新設の"cake_model"と<br />
			"cake_field"に設定された値からid,name属性名を決めます。<br />
		</p>
		<label for="UserPrefectureId">都道府県:</label>
		<div id="ac07_02" class="ac_area"></div>
		<input class="check_btn" type="button" value="送信される値をチェック" onclick="displayResult('ac07_02')" />

<code>
<span class="bold">jQuery:</span>
  $('#ac07_02').ajaxComboBox(
    '/TheJson/List/',
    {
      'db_table'    : 'prefectures',
      'field'       : 'name',
      'order_field' : 'id',
      'select_only' : true,
      'cake_rule'   : true,
      <span class="green">'cake_model'</span>  : '<span class="underline">User</span>',
      <span class="green">'cake_field'</span>  : '<span class="underline">prefecture_id</span>'
    }
  );

<span class="bold">HTML:</span>
&lt;input type=&quot;text&quot; id=&quot;<span class="underline">UserPrefectureId</span>&quot; name=&quot;data[<span class="underline">User</span>][<span class="underline">prefecture_id</span>]&quot; /&gt;

</code>

		<!--------------------------------------------------------->
		<h5 id="sample07_03">パッケージ</h5>
		<p>
			selectタグにmultipleを設定した場合のように、<br />
			連番が付加されます。<br />
		</p>
		<label for="UserPrefectureId0">都道府県:</label>
		<div id="ac07_03" class="ac_area"></div>
		<input class="check_btn" type="button" value="送信される値をチェック" onclick="displayResult('ac07_03')" />

<code>
<span class="bold">jQuery:</span>
  $('#ac07_02').ajaxComboBox(
    '/TheJson/List/',
    {
      'db_table'    : 'prefectures',
      'field'       : 'name',
      'order_field' : 'id',
      'select_only' : true,
      'cake_rule'   : true,
      'cake_model'  : '<span class="underline">User</span>',
      'cake_field'  : '<span class="underline">prefecture_id</span>',
      <span class="green">'package'     : true</span>
    }
  );

<span class="bold">HTML:</span>
&lt;input type=&quot;text&quot; id=&quot;<span class="underline">UserPrefectureId0</span>&quot; name=&quot;data[<span class="underline">User</span>][<span class="underline">prefecture_id</span>][<span class="underline">0</span>]&quot; /&gt;

</code>

		<div class="top_navi"><a href="#idx_area"> ▲ 目次へ </a></div>
		<!--**************************************************** -->
		<hr />
		<address>
			Author : sutara_lumpur /
			<a href="http://d.hatena.ne.jp/sutara_lumpur/20090124/1232781879">Blog</a> /
			<a href="http://twitter.com/sutara_lumpur">Twitter</a> /
			<img src="mail_image.png" alt="mail address" />
		</address>
	</body>
</html>
