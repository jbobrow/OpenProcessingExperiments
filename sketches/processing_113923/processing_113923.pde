

// An example working with the Flickr API
// If you get a 504 error, just run it again

// You should really get your own key and secret, otherwise my account will get locked out!
String myKey = "37dc35966bbb7bb95c821d32f86853c8";
String searchTerms = "bgiaglobal";  // you can add more terms, separated by commas
ArrayList<PImage> images;
//////////////////////////////////////////////////////////////////////////////
void setup() {
  size(200, 200);   
 images = new ArrayList(); 
  thread("loadImages");
}

//////////////////////////////////////////////////////////////////////////////
void draw() {  
  if (images.size() > 0) {
  int index = (int)map(mouseX,0,width,0,images.size());
  PImage img = images.get(index);
  image(img,0,0,200,200);
}
}

//////////////////////////////////////////////////////////////////////////////
// This runs as a separate Thread 
void loadImages() {
  // Build the URL containing our query  
  String query = "http://api.flickr.com/services/rest/?";
  query += "method=flickr.photos.search";
  query += "&text=" + searchTerms;
  query += "&api_key=" + myKey;
  
  println(query);
  
  // Run the query & load the data
  XML data = loadXML(query); 
  
  // Get all the <photo> tags
  XML[] photos = data.getChildren("photos/photo"); 
  
  // Check them out!  note the Enhanced Loop Syntax
  for (XML photo: photos) {
    // Get attributes out of the each <photo> tag
    String farm = photo.getString("farm");
    String server = photo.getString("server"); 
    String secret = photo.getString("secret");
    String id = photo.getString("id");
   
    // The "_q" in the URL indicates we want 150x150 thumbnails. 
    // See this for more detail: http://www.flickr.com/services/api/misc.urls.html
    String imageUrl = "http://farm"+ farm + ".staticflickr.com/" + server + "/"+ id +"_"+ secret +"_q.jpg";
    println("Loading: " + imageUrl); 
    
    PImage img = loadImage(imageUrl); 
    images.add(img);
  }
}




