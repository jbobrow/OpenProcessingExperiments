
PImage img1;
PImage img2;
PImage img3;
PImage img4;




float y = 50.0;
float x = 0.0;

float px;
float py;
float easing = 0.3;
float angle = 0.0;

int b= 40;
int  n = 50;

int diameter = 60;
//tween
int radius = 40;
float x2 = -radius;
float speed = 0.5;


void setup () {
 
 
  size (1000,750);
  
 // background(255);
  smooth ();
  noFill ();
  cursor (1);
    img1 = loadImage ("dnk_grafik_03-01.png");
     img2 = loadImage ("dnk_grafik_12-02.png");
         img3 = loadImage ("dnk_grafik_07-02.png");
        img4 = loadImage ("dnk_leiste_01.png");

     

 background(255);
 image(img4,5,25,68,700); 
}

void draw () {
  

   
 if(keyPressed){
 
  if (key == 'n'){
noFill();
noTint();

scale (2.3);
translate (mouseX, mouseY);
float scalar = cos(angle)+2.3;
scale(scalar);
rotate(angle) ;
strokeWeight(0.2/scalar);
image(img1,-20,-20,8,8);
angle += 0.05;

  
 }else{
   
if (key == 'a'){
tint(0,40);
image(img2,400,mouseY-50, 200, 200);
 }else{
   
if (key == 'c'){
fill(0,260);
noStroke();
  rect(180, mouseY, 10,10);
  rect(mouseX, 315, 10,10);

}else{
   
if (key == 'h'){

  noFill();
  fill(0);
smooth();
ellipse(mouseX, mouseY, 13,13);
 }else{
   
if (key == 't'){

smooth();
noFill();
strokeWeight(32);
stroke(0,10);
float mx =map(mouseX,mouseY,width,20,100);
  ellipse(mouseX, mouseY, mx,mx);
 
}else{
   if (key == 'T'){

smooth();
fill(255,80);
noStroke();
float diameter =map(mouseX,mouseY,width,5,80);
  ellipse(mouseX, mouseY, diameter,diameter);
  
  }else{
   if (key == 'A'){

smooth();
noStroke();
fill(255,80);

rect(mouseX, mouseY, x,y);
rect(mouseX, 40, 10,10);
   rect(40, mouseY, 10,10);
   
   rect(mouseX, 80, 10,10);
   rect(80, mouseY, 10,10);
   
   rect(mouseX, 120, 10,10);
   rect(120, mouseY, 10,10);
   
   rect(mouseX, 140, 10,10);
   rect(140, mouseY, 10,10);
   
    rect(mouseX, 180, 10,10);
   rect(180, mouseY, 10,10);
   
    rect(mouseX, 240, 10,10);
   rect(240, mouseY, 10,10);
   
     rect(mouseX, 280, 10,10);
   rect(280, mouseY, 10,10);
   
   
    rect(mouseX, 320, 10,10);
   rect(320, mouseY, 10,10);
   
   rect(mouseX, 520, 10,10);
   rect(520, mouseY, 10,10);
   
    rect(mouseX, 360, 10,10);
   rect(360, mouseY, 10,10);
   
   
    rect(mouseX, 420, 10,10);
   rect(420, mouseY, 10,10);
   
    rect(mouseX, 560, 10,10);
   rect(560, mouseY, 10,10);
   
 rect(mouseX, 660, 10,10);
   rect(660, mouseY, 10,10);
   
   rect(mouseX, 700, 10,10);
   rect(700, mouseY, 10,10);
   
   rect(mouseX, 780, 10,10);
   rect(780, mouseY, 10,10);
   
   
    rect(mouseX, 820, 10,10);
   rect(820, mouseY, 10,10);
   
    rect(mouseX, 880, 10,10);
   rect(880, mouseY, 10,10);
   
   
    rect(mouseX, 920, 10,10);
   rect(920, mouseY, 10,10);
   
      rect(mouseX, 960, 10,10);
   rect(960, mouseY, 10,10);
   
   }else{
   if (key == 'G'){

smooth();
tint(0,20);
translate (mouseX, mouseY);
rotate(angle);

image(img3,-15, -15, 100,100);
 angle+= 0.01;
 
    } 

 if(keyPressed){
  if (key == 'o'){
 tint(0);
 image(img4,5,25,68,700);

 }

 else if (key == 'q'){
   noStroke();
   fill(255);
 rect (5,25,68,700);
tint(0,0);
 image(img4,5,25,68,700);

   } else{

   }}}}
}}

}
}
}
 }}




