<gm:page title="Sample - Tagged Blog Feed" authenticate="true">

  <!--
    The Tagged Blog Feed application demonstrates how to use annotations in
    GME. Annotations allow users to add custom labels and ratings to entries in
    internal or external feeds, and this sample shows you how to get started,
    including how to set up the source URL, how to use the gm:labels tag, and
    where to store the annotated rating in the entry.

    The first tab shows all entries while the second tab displays only those
    with a rating or label.
    @author: GME Team
  -->

  <script>
    function getFeed() { 
      var url = document.getElementById('feedUrl').value;
      if (url) {
        if (url.indexOf("http://") != 0) {
          url = "http://" + url;
        }
        google.mashups.getObjectById('myList').setData(url + '|${annotations}');
        google.mashups.getObjectById('myAnnotatedList').setData(url + '|${annotations}')
      }
    }
  </script>

  <div class="gm-app-header">
    <h1>Tagged Blog Feed</h1>
  </div>

  <input type="text" id="feedUrl" value="http://googlemashupeditor.blogspot.com/atom.xml" size="50"/>
  <button onclick="getFeed()">Get feed</button>
  <hr size="1"/>
  
  <table style="width:100%">
    <tr>
      <td style="width:150px" valign="top">
        <gm:tabs target="myContainer" class="gm-section-tabs-left"/>
      </td>
      <td valign="top">
        <gm:container id="myContainer">
          <gm:section id="section1" title="All entries">
            <gm:list id="myList" pagesize="10" template="myListTemplate"/>
          </gm:section>
          <gm:section id="section2" title="Annotated entries">
            <gm:list id="myAnnotatedList" sort="ratingSort" template="myListTemplate">
              <gm:sort name="ratingSort" ref="gd:entryLink/entry/gd:rating/@value" reverse="true"/>
            </gm:list>
          </gm:section>
        </gm:container>
      </td>
    </tr>
  </table>

  <gm:template id="myListTemplate">
    <table class="blue-theme" style="width:100%">
      <tr repeat="true">
        <td><gm:text ref="atom:title"/></td>
        <td><gm:rating ref="gd:entryLink/entry/gd:rating"/></td>
        <td><gm:labels/></td>
      </tr>
      <tfoot>
        <tr>
          <td colspan="3"><gm:pager/></td>
        </tr>
      </tfoot>
    </table>
  </gm:template>

</gm:page>
