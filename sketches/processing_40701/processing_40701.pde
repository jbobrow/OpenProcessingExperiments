
PFont font;
PImage online;
int value = 0;


void setup() 
{
  String[] fontList = PFont.list();
  println(fontList);
  size(800,600);
  smooth(); 
  noStroke();
  ellipseMode(CENTER);
  font = createFont("Agency FB Bold",30);
  String url = "http://profile.ak.fbcdn.net/hprofile-ak-snc4/27522_363524747290_4927_n.jpg";
  online = loadImage(url, "jpg");

  
}

void draw() 

{   
  background(190); 
  
  if(mousePressed==true){
image(online,random(0,100),random(400,600));
 }else{
   image(online,0,0,0,0);
 }
  image(online,0,0,0,0);
  

 
  fill(value);
  textFont(font);
  textSize(180);
  text("Keep Looking", 0,height/2,150);
  
   fill(255, 180);
  ellipse(mouseX, height/2, mouseY/2+10, mouseY/2+10);   //white eye
  fill(127,200,279, 180);
  ellipse(mouseX-15, height/2, mouseY/3+10, mouseY/3+10);   //blue eye
  
  fill(255, 180);
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  ellipse(inverseX, height/2, (inverseY/2)+10, (inverseY/2)+10);   //white eye
  fill(127,200,279, 180);
  ellipse(inverseX+15, (height/2), (inverseY/3)+10, (inverseY/3)+10);  //blue eye
   
}
  
 void mouseMoved() {
  value = value + 5;
  if (value > 255) {
    value = 0;

 
}
  
}  

