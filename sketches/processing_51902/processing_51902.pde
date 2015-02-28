
import processing.video.*;

String apiKey = "88bc874b7eda07379cfb3e6db4c2ba21";
String sharedSecret = "fc6ebf7319cd4e31";

// Variables used in the flickr calls
String groupId = "1508783@N21";  // Trees, trees and more trees
int numPhotos = 9;  // Number of photos to include in the movie
ArrayList photos;  //List of photos
String[] seasons = {"spring", "summer", "fall", "winter"};
int tagCnt = 0;
String tags = seasons[tagCnt];  //Search tag.  You can replace this with something else, but be sure to replace spaces with '+'

PrintWriter output;
PImage img;
int photoCounter;
int denom;



//Pulls out error codes for the given XMLElement
String[] getStatus(XMLElement xml) {
  String[] retVal = {"","",""};
  retVal[0] = xml.getStringAttribute("stat");
  println("XML!!!");
  println(xml);
  println("retVal0 = " + retVal[0]);
  if (retVal[0].equals("fail")) {
     retVal[1] = xml.getChild(0).getStringAttribute("code");
     retVal[2] = xml.getChild(0).getStringAttribute("msg");
  }
  return retVal;
}

//Pulls out the first 100 photos in the flickr pool
void getPhotosByGroup(String _groupId, String _tags) {
  // Set up the call to get the Token, as described here:
  // http://www.flickr.com/services/api/auth.howto.desktop.html
  String url = "http://api.flickr.com/services/rest/?api_key="+apiKey+"&group_id="+_groupId+"&tags="+_tags+"&method=flickr.groups.pools.getPhotos&per_page="+numPhotos;
  String[] results = loadStrings(url); //Load the URL
  writeAFile("data/photosByGroup.xml", join(results, "\n"));
  XMLElement xml = new XMLElement(this, "photosByGroup.xml"); //Collapse array elements into a string
  String[] errCodes = getStatus(xml);  //Pull error codes (if any) from the XML
  if (errCodes[0].equals("ok")) {  
     XMLElement root = xml.getChild(0);
     for (int i=0; i < root.getChildCount(); i++) {
        String id = root.getChild(i).getStringAttribute("id");
        String owner = root.getChild(i).getStringAttribute("owner");
        String title = root.getChild(i).getStringAttribute("title");
        photos.add( new Photo(id, title, owner));
     }
  } else {
    println ("Error! Here are some codes:\n" + errCodes);
  }
}  

/*
|| Flickr stores multiple sizes for an image.  So, to get the URL for one, we need to 
|| scan through and pic out the size we want.  In this case, "Medium"
*/
String getPhotoURL(String id) {
  String retVal = "";
  String url = "http://api.flickr.com/services/rest/?api_key="+apiKey+"&photo_id="+id+"&method=flickr.photos.getSizes";
  String[] results = loadStrings(url); //Load the URL
  writeAFile("data/photoURL.xml", join(results,"\n"));
  XMLElement xml = new XMLElement(this, "photoURL.xml"); //Collapse array elements into a string
  String[] errCodes = getStatus(xml);  //Pull error codes (if any) from the XML
  if (errCodes[0].equals("ok")) {  
     XMLElement root = xml.getChild(0);
     for (int i=0; i < root.getChildCount(); i++) {
        String label = root.getChild(i).getStringAttribute("label");
        if (label.equals("Medium 640")) {
           retVal = root.getChild(i).getStringAttribute("source");
        }
     }
  } else {
    println ("Error! Here are some codes:\n" + errCodes);
  }
  return retVal;
}  


void setup() {
  size(600, 600);
  imageSetup();
}

  
void draw() {
  background(0);
  denom = width/3;
  for (int i = 0; i < width; i+=denom) {
    for (int j = 0; j < height; j+=denom) {
      Photo p = (Photo) photos.get(photoCounter);
      img = loadImage(p.url);
      if (img.width > img.height) img.resize(0, denom);
      else img.resize(denom, 0);
      image(img, i, j);
      photoCounter++;
    }
  }
  photoCounter = 0;
}

void mousePressed() {
  tagCnt++;
  if (tagCnt > 3) tagCnt = 0;
  tags = seasons[tagCnt];
  imageSetup();
}

void imageSetup() {
  photos = new ArrayList();
  getPhotosByGroup(groupId, tags);
  for (int i=0; i < photos.size(); i++) {
    Photo p = (Photo) photos.get(i);
    p.url = getPhotoURL(p.id);
    println(p.title + " -> " + p.url);
  }
  photoCounter = 0;
}


void writeAFile(String filename, String content) {
  output = createWriter(filename);
  output.print(content);
  output.flush();
  output.close();
}


/*
|| Class to hold the photo info from the XML
*/
class Photo {
  String id, title, owner;
  String url;
  
  Photo (String _id, String _title, String _owner) {
    id = _id;
    title = _title;
    owner = _owner;
  }
  
}

