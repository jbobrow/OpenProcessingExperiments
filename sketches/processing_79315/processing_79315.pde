
//javascript necessary image preload//
 /* @pjs preload="map2.png,spot1.png,spot2.png,spot3.png"; */
 
 
//input setup variables//
PImage img;
PFont font;
float radius = 6;
float GpsBorderLat1;
float GpsBorderLat2;
float GpsBorderLon1;
float GpsBorderLon2;
float D;


//call all GPSGraff Spots//
GPSGraff spot1;
GPSGraff spot2;
GPSGraff spot3;

//void setup includes the latitude and longitude limits of the background image, followed by a list of inputs spot* which includes latitude and longitude information of the photo coinciding that spot.//


void setup(){
  
  //load background image//
  img = loadImage("map2.png");
  
  //Background Image img.width and img.height replaced for Javascript//
  size(1200,806);
  smooth();
  
  //load text font//
  font = loadFont("URWGothicL-Book-24.vlw");
  textFont(font);
  
  //Background image limits//
  GpsBorderLat1 = 47.65330736;
  GpsBorderLat2 = 47.55738103;
  GpsBorderLon1 = -122.45811046;
  GpsBorderLon2 = -122.25579806;
  
  //input GPSGraff Information//
  spot1 = new GPSGraff(1,47.59979738,-122.3304016,"spot1.png","Loose Cannon","12.11.05");
  spot2 = new GPSGraff(2,47.613799,-122.329132,"spot2.png","Loose Cannon","12.11.05");
  spot3 = new GPSGraff(3,47.601624,-122.331889,"spot3.png","Loose Cannon", "12.11.05");
}


//Draw background, map, and then a series of spots numbered sequentially, matching graffitti locations and filenames.//

void draw(){
  background(200);
  tint(255,255,255);
  image(img,0,0);
  
  fill(0);
  textSize(24);
  text("GRAFF v.01", 5,30);
  textSize(12);
  text("A presentation of the graffiti landscape within downtown seattle.", 10, 45);
  
  fill(255);
  //run the marker behavior for every GPSGraff Object//
  spot1.marker();
  spot2.marker();
  spot3.marker();
  
}




//DEFINE GPSGraff as object containing index, gps latitude, gps longitude, image, photographer, and date file inputs.//

class GPSGraff {
  int index;
  float gpslat;
  float gpslon;
  String imagefile;
  String photographer;
  String date;
  
//DEFINE GPSGraff Constructor.//

  GPSGraff(int tempindex, float tempgpslat, float tempgpslon, String tempimagefile, String tempphotographer, String tempdate){
    gpslat=tempgpslat;
    gpslon=tempgpslon;
    index=tempindex;
    imagefile=tempimagefile;
    photographer=tempphotographer;
    date=tempdate;
    
       
  }
  
  //Create Circular Marker of Radius at GPS location for Spot.//
  void marker(){
    float locx= map(gpslon, GpsBorderLon1, GpsBorderLon2, 0, width); 
    float locy= map(gpslat, GpsBorderLat1, GpsBorderLat2, 0, height);
    D = dist(mouseX, mouseY, locx, locy);
    
    ellipse(locx,locy,radius,radius);
    
    //Load Image with image center at mouse if Mouse is pressed over the marker ellipse.//
    if (mousePressed){
      if (D<radius){
        PImage showimage;
        showimage = loadImage(imagefile);
        image(showimage, mouseX-showimage.width/2,mouseY-showimage.height/2);
        
        //Display text information of photogrpaher,date,lat/lon if shift key pressed while clicking on image.//
        if (keyPressed && (key== CODED)){
          if (keyCode ==SHIFT){
            
            //lower tint of image for legibilit of text//
            tint(120,120,120);
            
            //show image centered on mouse location//
            image(showimage, mouseX-showimage.width/2,mouseY-showimage.height/2);
            
            //text information//
            textSize(12);
            text("Photographer: "+photographer+".", mouseX-(showimage.width/2)+15, mouseY);
            text("Date: "+date, mouseX-(showimage.width/2)+15, mouseY+15);
            text("Latitude/Longitude: "+gpslat+ ", "+gpslon+".", mouseX-(showimage.width/2)+15, mouseY+30);
          }
          else{
            //if not, return the original tint to image.//
            tint(0,0,0);
          }
        }
      }
    }
  }
}


