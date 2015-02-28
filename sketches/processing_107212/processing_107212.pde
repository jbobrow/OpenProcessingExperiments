
import hypermedia.video.*;
OpenCV opencv;
PImage img1;
void setup(){
  size(1280,720);
  opencv=new OpenCV(this);
  opencv.capture(width/2,height/2);
  //img1=loadImage("mango_tree_logo_1280x720.png");
}
void draw(){
  opencv.read();
  
  image(opencv.image(),0,0,width,height);
  image(img1,0,0);
  
}
String startTime;
void keyPressed(){
  int n=0;
  if(key==' '){
    startTime=year()+nf(month(),2)+nf(day(),2)+"_"+nf(hour(),2)+nf(minute(),2)+nf(second(),2);
    saveFrame(startTime +" .jpg");
  }
}
    


