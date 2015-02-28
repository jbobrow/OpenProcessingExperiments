
//NOTE
//
//THIS DOESN'T WORK ON THE WEBSITE.
//PLEASE PASTE INTO PROCESSING
//


String apiBase = "http://api.flickr.com/services/rest/?method=";
String apiKey = "46153c5676961ef77c46ed73700e7230";

int numberOfImages = 20;
PImage[] images = new PImage[numberOfImages];

float currentFrameRate = 1.0f;

void setup(){
  size(800,450);
  background(255);
  frameRate(currentFrameRate);
  
  int page = (int)random(1,4);
  XMLElement xml = photosSearch(numberOfImages, page, "arduino");
  
  XMLElement[] photos = xml.getChildren("photos/photo");
  //println(xml);
  
  for (int i = 0; i < numberOfImages; i++) {
     //println(photos[i]);
     //println(photos[i].getString("url_s"));
     
     if(photos[i].getString("url_s") != null){
       images[i] = loadImage( photos[i].getString("url_s") );
     }
     
     //PImage photo = loadImage( photos[i].getString("url_o") );
     //image(photo, random(0,width), random(0,height));
  }
}
 
void draw(){
  //int num = (int)random(1,numberOfImages-1);
  //int start = (int)random(0,numberOfImages-num);
  
  //for(int i=start; i<num+start; i++){
    int i = (int)random(0,numberOfImages-1);
  
  
    tint(255,(1/currentFrameRate)*4000);
    //image(images[i], random(0,550), random(0,450));    
    float rotation = random(0,2*PI);
    float x = mouseX;
    float y = mouseY;
    float sizeMod = random(1,4) * currentFrameRate/100;
    float sizeX = images[i].width * sizeMod;
    float sizeY = images[i].height * sizeMod;
    
    
    pushMatrix();

    translate(x,y);    
    rotate(rotation);

    image(images[i], 0,0,sizeX,sizeY);
    rotate(-rotation);
    translate(-x,-y);
    
    popMatrix();
  //}
  
  currentFrameRate += 0.2f;
  frameRate((int)currentFrameRate);
}
    
XMLElement photosSearch(int per_page, int page, String searchText){
  String query = apiBase + "flickr.photos.search&" + "text=" + searchText + "&per_page=" + per_page + "&page=" + page + "&format=rest&extras=url_s&sort=relevance&api_key=" + apiKey;
  return new XMLElement(this, query);
}                               
