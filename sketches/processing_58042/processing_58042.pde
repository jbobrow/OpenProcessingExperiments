
// simple class for WP posts, containing only
// post ID, title and content
class WPPost implements Comparable<WPPost> {
  int id;
  String title,content;
  
  WPPost(XMLElement post) {
    String type=post.getChild("wp:post_type").getContent();

    // reject post if type is not "post" or "page"
    if(type.indexOf("post")==-1 && type.indexOf("page")==-1) {
      id=-1;
      return;
    }

    id=int(post.getChild("wp:post_id").getContent());
    title = post.getChild("title").getContent();
    title=title.replaceAll("\\<.*?\\>", ""); // strip HTML
 
    XMLElement theContent = post.getChild("content:encoded");
    content = theContent.getContent();
    
    // strip HTML
    content = content.replaceAll("\\<.*?\\>", ""); 
    
    // strip empty lines at start of post
    while(content.startsWith("\n")) content = content.substring(1);
    
    // replace triple line breaks with a single line break
    content=content.replaceAll("\n\n\n","\n");
  }
  
  void saveToTextfile() {
    String dat[]=new String[4];
    dat[0]="id="+id;
    dat[1]=title;
    dat[2]="---";
    dat[3]=content;
    
    saveStrings("posts/post_"+id+".txt",dat);
  }
  
  // comparator used to sort arraylist
  public int compareTo(WPPost o) {  
    return id-o.id;
  }  
}

