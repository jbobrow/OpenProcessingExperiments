
float speed=80;
PImage before;
PImage after;
String quote= "R draws after, T draws before,";
String quote2= "press A(fter) or B(efore) to see full images";
int time2=4000;
int x=width/2;
int y=width/2;
void setup(){
  size(969,619);
  after= loadImage("After Tornado New Art.jpg");
  before= loadImage("Before Tornado New Art.jpg");
  image(before,0,0);
  //after.resize(displayWidth,displayHeight);
  //before.resize(displayWidth,displayHeight);
  image(before,0,0);
  frameRate(40);
}
void draw(){
  x += random(-speed,speed);
  y += random(-speed,speed);
  x=constrain(x,0,width);
  y=constrain(y,0,height);
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
  float h= random(20,75);
  if (key=='r'){
    color p=after.get(x,y);
    stroke(p,150);
    fill (p,150);
    rect(x,y,h,h);}
  else if (key=='t'){
     color p=before.get(x,y);
     stroke(p,150);
     fill (p,150);
     rect(x,y,h,h);}



if (key=='a' && keyPressed==true){
  image(after,0,0);
}
if (key=='b' && keyPressed==true){
  image(before,0,0);
}
  if (key=='s'){
    save("randomBandA.tif");
  }
  }




