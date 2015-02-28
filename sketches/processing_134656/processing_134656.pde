

/*@pjs preload="funny-pictures-Deadpool-auto-397380.jpeg, demonmask.png, HUD.png, colorwheel.png";*/


float r; //brush rotate
float s; //brush scale
color brushColor;
float counter; //rotation thing, (counter*TWO_PI/360)
PImage CW;
PImage DP;
PImage demonmask;
float xe = 1.0;
PImage HUD;

float time = 1.0;
float increment = 0.1;



 
 
 
 
 
 
void setup()
{
  size(1250,900);
  background(255,255,255,255);
  colorMode(RGB);
frameRate(30);
 
 DP = loadImage("funny-pictures-Deadpool-auto-397380.jpeg");
 demonmask = loadImage("demonmask.png");

HUD = loadImage("HUD.png");


s = 0.5;
r = 0;
xe = xe+s;

CW = loadImage("colorwheel.png");
}
 
 
 
void draw()
{

  
  imageMode(CORNER);
 image(HUD,0,0,1250,900);
image (CW, 0,0,140,140);

 colorMode(HSB);
 if(mousePressed==true){
  if (mouseButton == RIGHT)
  {
       float noise1 = noise(time)*width;
   time+=increment;
    
  pushMatrix();
    noFill();
    stroke(random(255),random(255),random(255));
  strokeWeight(random(4));
stroke(random(255),random(255),random(255));

translate(mouseX,mouseY);
scale(s);
ellipseMode(CENTER);
ellipse(0,0,noise1,noise1);    
  popMatrix();  
}
 
if(mouseButton ==LEFT)
{
 noStroke(); 
  fill(brushColor);
  pushMatrix();
  translate(mouseX,mouseY);
  scale(s);
  ellipse(0,0,30,30);
  popMatrix();
}//Right RB command end
 
if(mouseButton ==CENTER)
{
tint(random(255),random(255),random(255),random(255));

  
 pushMatrix();
  translate(mouseX,mouseY);
  scale(s);
   rotate(r);
  imageMode(CENTER);
image(demonmask,0,0);
//  time+=increment;
  


 
popMatrix();
 
 
}//Center MB command end
 }//true statement end
}//void draw end
 
 
void keyPressed(){
 if(keyPressed==true){
   if(keyCode ==UP){
     s = s+0.1;
   }
 }
if(keyCode ==DOWN){
  s = s-0.1;
}
if(keyCode ==RIGHT){
  r = r+0.1;
}
if (keyCode==LEFT){
  r = r-0.1;
}
 

if(keyCode ==CONTROL)
{
filter(INVERT);
}


if (keyCode == SHIFT)
{
  tint(#FFFFFF);
brushColor = get(mouseX,mouseY);
}

  if(key==ENTER){
   tint(#FFFFFF);
    imageMode(CORNERS);
    image(DP,140,140,1250,900);
}

if(key== '1'){
filter(BLUR, 2*xe);
}

if(key=='2'){
filter(POSTERIZE,2+xe);
}

if(key=='3'){
filter(ERODE);

}
if(key=='4'){
filter(DILATE);

}
if(key=='5'){
filter(THRESHOLD);
}
 
if(key=='6'){
filter(GRAY); 
}

if(key=='7'){

}
if(key=='8'){
  
}
if(key=='9'){
  
}

if(key=='0'){

}



else if (keyPressed)
{
  if(key == BACKSPACE)
  {
   colorMode(RGB);
   tint(#FFFFFF);
    background(255,255,255);
  }




}
}



