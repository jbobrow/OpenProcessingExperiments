
PImage before;
PImage after;
String quote= "Left click draws after, Right click draws before,";
String quote2= "press A(fter) or B(efore) to see full images";
int time1=2000;
int time2=4000;
void setup(){
  size(640,480);
  after= loadImage("1.jpg");
  before = loadImage("3.jpg");
  image(before,0,0);
  frameRate(40);

 
}
void draw(){
  int currentTime=millis();
       if (currentTime<time2){
      strokeWeight(30);
      textSize(20);
      fill(255);
      text(quote, width/6,height/2);
      strokeWeight(30);
      textSize(20);
      fill(255);
      text(quote2, width/6,height/2+20);
    }
    if (currentTime>=time2 && currentTime<=time2+10){
      image(before,0,0);}
  float h= random(50,75);
  if (mousePressed && mouseButton==LEFT){
    color p=after.get(mouseX, mouseY);
    stroke(p,150);
    fill (p,150);
    rect(mouseX, mouseY,h,h);}
      
   if (mousePressed && mouseButton==RIGHT){
     color p=before.get(mouseX, mouseY);
     stroke(p,150);
     fill (p,150);
     rect(mouseX,mouseY,h,h);}


if (key=='a' && keyPressed==true){
  image(after,0,0);
}
if (key=='b' && keyPressed==true){
  image(before,0,0);
}
if (key=='s' && keyPressed ==true){
  saveFrame("image/export-"+"-#####.tiff");
  if (frameCount >=6000){
  exit();
}
  }
}



