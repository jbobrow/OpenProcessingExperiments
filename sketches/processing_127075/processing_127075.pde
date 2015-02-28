
/* @pjs preload="apple_white.png"; */

PFont moji;
PImage img;
int x, y;      



void setup() {
  size(450, 450);
  stroke(130,100,160);
  smooth();
  moji= loadFont("STHeiti-48.vlw");   
 
  
  x = width/2;
  y = height/2;

}
 

 
void draw() {
  background(255); 
img=loadImage("apple_white.png");
  image(img,90,70);
tint(50);
 fill(255,mouseX,mouseY);
 triangle(285.25,200,170,120,120,180);
 fill(mouseX,255,mouseY);
 triangle(285.25,200,150,250,120,190);
  fill(mouseX,mouseY,255);
 triangle(285.25,200,210,300,150,260);
 
 
  for(int x = 40; x <= width; x+=40) {    
  strokeWeight( 1 );
  
  
  stroke(x,10,50,60);    
  line(x, height ,0, 0);
  
  stroke(x,80,100,180);  
  line(x,width,0,x);
  
  stroke(x,80,200,100);   
  line(510,x,x,0);
   
  stroke(x,10,100,50);   
  line(510,510,x,0);
  }
  
fill(0);
 
beginShape();
vertex( 285.25,200);
bezierVertex( 350, 350, 350, 350, 0, 450 );
bezierVertex( 325, 325, 325, 325 ,285.25, 200 );
endShape(); 

 textFont(moji, 32);
  text("apple", 280, 425);
  textFont(moji, 32);
  text("This color is you", 40, 70);
}


void mouseDragged(){
  if( mouseButton == LEFT ){  //hidarikurikku uenosikakutodouka
 tint(255,mouseX,mouseY);
 }else if( mouseButton == CENTER ) {   //mannnakakurikku mannnakatodouka
 tint(mouseX,255,mouseY);
 } else if( mouseButton == RIGHT ) {   //migikurikku sitatodouka
 tint(mouseX,mouseY,255);
 }
 }
 

 
   







