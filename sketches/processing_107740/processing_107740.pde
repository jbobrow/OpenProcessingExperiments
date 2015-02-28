
/*
dispays images of face pareidolias from google image search, and applies face detection
 
 some good search terms to play around with are pareidolia, face, faces, little fella, hello litle fella
 
 Daniel Soltis 2013
 
 google image search adapted from GET GOOGLE IMAGE SEARCH URLs by Jeff Thompson | 2013 | www.jeffreythompson.org
 */

import java.net.HttpURLConnection;    // required for HTML download
import java.net.URL;
import java.net.URLEncoder;
import java.io.InputStreamReader;     // used to get our raw HTML source  
import hypermedia.video.*;
import java.awt.*;

String searchTerm = "pareidolia faces";   // term to search for (use spaces to separate terms)
String fileSize = "&tbs=isz:m";             // specify medium file size
//String fileSize = "&tbs=isz:ex%2Ciszw%3A800%2Ciszh%3A600"; //use this to specify exact size: more control but stranger image results
String source = null;                 // string to save raw HTML source code
String[][] m;

OpenCV opencv;
PImage img;

int interval = 3000; //length of time (ms) to view each image
long lastTick;
int imageIndex; //which image in the array of results currenlty being viewed
int offset = 20;  // we can only get 20 results at a time - use this to offset and get more!

void setup() {

  size(800, 600);

  //set up face detection
  opencv = new OpenCV( this );
  opencv.allocate(width, height);
  opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );  // load detection description, here-> front face detection : "haarcascade_frontalface_alt.xml"

  //search for first image
  searchTerm = searchTerm.replaceAll(" ", "%20");
  searchImages(offset);
  nextImage();
}

void draw() {
  background(50);

  //when to load the next image
  long now = millis();
  if (now - lastTick > interval) {
    nextImage();
    lastTick = now;
  }

  //show the image with face detection
  if (img != null && img.width > 0 && img.height > 0) {
    translate(width/2-img.width/2, height/2-img.height/2);
    image(opencv.image(), 0, 0);
    detectFaces();
  }
}

//draws a rectangle around all detected faces
//assumes a valid image is in the opencv buffer
void detectFaces() {
  Rectangle[] faces = opencv.detect();
  fill(255, 127, 255, 100);
  stroke(255, 127, 255);
  strokeWeight(4);
  for ( int i=0; i<faces.length; i++ ) {
    rect( faces[i].x, faces[i].y, faces[i].width, faces[i].height );
  }
}


//queries google images and loads the URLs of found images into array m
void searchImages(int _offset) {

  // get Google image search HTML source code; mostly built from PhyloWidget example:
  // http://code.google.com/p/phylowidget/source/browse/trunk/PhyloWidget/src/org/phylowidget/render/images/ImageSearcher.java
  try {
    URL query = new URL("http://images.google.com/images?gbv=1&start=" + _offset + "&q=" + searchTerm + fileSize);
    HttpURLConnection urlc = (HttpURLConnection) query.openConnection();                                // start connection...
    urlc.setInstanceFollowRedirects(true);
    urlc.setRequestProperty("User-Agent", "");
    urlc.connect();
    BufferedReader in = new BufferedReader(new InputStreamReader(urlc.getInputStream()));               // stream in HTTP source to file
    StringBuffer response = new StringBuffer();
    char[] buffer = new char[1024];
    while (true) {
      int charsRead = in.read(buffer);
      if (charsRead == -1) {
        break;
      }
      response.append(buffer, 0, charsRead);
    }
    in.close();    // close input stream (also closes network connection)
    source = response.toString();
  }
  catch (Exception e) {
    e.printStackTrace();
  }

  if (source != null) {
    // built partially from: http://www.mkyong.com/regular-expressions/how-to-validate-image-file-extension-with-regular-expression
    m = matchAll(source, "imgurl=(.*?\\.(?i)(jpg|jpeg|png|gif))");
  }
}

//loads the next image retreived from google images
void nextImage() {
  if (imageIndex < m.length) {
    println(m[imageIndex][1]);
    img = loadImage(m[imageIndex][1]);
    if (img != null && img.width > 0 && img.height > 0) { //make sure the image returned is valid
      opencv.allocate(img.width, img.height);
      opencv.copy(img);
      imageIndex++;
    }
    //skip over invalid images
    else {
      imageIndex++;
      nextImage();
    }
  }
  //at the end of the results, load the next set of images from google search
  else {
    offset+=20;
    imageIndex = 0;
    searchImages(offset);
    nextImage();
  }
}

public void stop() {
  opencv.stop();
  super.stop();
}



