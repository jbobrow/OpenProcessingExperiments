
PImage mint; PImage grink; PImage meow; PImage REDD;
float aspect = 1;
//p is paused
boolean p = false;
void setup(){
  size(600,600);
  background(255);
 mint = loadImage("mint-limpet-motif.png"); grink = loadImage("pink-green.png"); meow = loadImage("everything.png"); REDD =loadImage("faded-fuchsia-1.png");
 aspect = 0.5;
 
}

void draw(){
  if(p == false){
image (REDD, random(-50,600), -2, REDD.width/5, REDD.height/5); 
  image (mint, random(-50,600), 40, mint.width/8, mint.height/8); image (grink, random(-50,600), 75,grink.width/8, grink.height/8); image (meow, random(-50,600), 105, meow.width/5.5, meow.height/5.5);image (REDD, random(-50,600), 150, REDD.width/5, REDD.height/5); 
  image (mint, random(-50,600), 185, mint.width/8, mint.height/8); image (grink, random(-50,600), 210,grink.width/8, grink.height/8); image (meow, random(-50,600), 240, meow.width/5.5, meow.height/5.5);image (REDD, random(-50,600), 280, REDD.width/5, REDD.height/5); 
  image (mint, random(-50,600), 315, mint.width/8, mint.height/8); image (grink, random(-50,600), 350,grink.width/8, grink.height/8); image (meow, random(-50,600), 380, meow.width/5.5, meow.height/5.5); image (REDD, random(-50,600), 420, REDD.width/5, REDD.height/5); 
  image (mint, random(-50,600), 450, mint.width/8, mint.height/8); image (grink, random(-50,600), 480,grink.width/8, grink.height/8); image (meow, random(-50,600), 510, meow.width/5.5, meow.height/5.5); image (REDD, random(-50,600), 540, REDD.width/5, REDD.height/5);image (mint, random(-50,600), 580, mint.width/8, mint.height/8);
  }

  if(p == false){
 
  }}


void mouseMoved(){
imageMode(CENTER)
  image (mint, pmouseX, pmouseY, mint.width/5, mint.height/5);}



void mouseDragged(){
imageMode(CENTER)
  image (grink, pmouseX, pmouseY, grink.width/3, grink.height/3);}

void keyPressed(){
  if(key == ' ' )
  {//if the program is paused (p is true), then unpause it (set p= false)
  if(p == true){
  p = false;}
  
  //else meaning otherwise  p==false, aka the program is running
  else {
  p = true;}
  }

  if( key =='c' ||key == 'C')
  {
    background(255);
  }

if( key =='x'){
  image(REDD, random(width), random(height), REDD.width/2, REDD.height/2);}
}





