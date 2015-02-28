
//this is a game can be played by two
//one control the cowboy by keyboard
//the other control the aim by mouse
//when the aim get the cowboy
//click the mouse
//if the cowboy can not escape, he lose
//but there is only one bullet in the gun




import ddf.minim.*;
Minim minim;
AudioSample event;
AudioPlayer background;

PImage image;
PImage image2;//set the image
float x=300;
float y=300;//set the vari

void setup(){
  size(600,600);
  background(255);
  image = loadImage("1.png");
  image2 = loadImage("2.png");
  // load the image
  
  minim = new Minim(this);
  event = minim.loadSample("gun.mp3");
  background = minim.loadFile("bg.mp3");//load the music
  background.loop();//play the bg music

  textSize(60);//set the size of the text
}


void keyPressed(){
  if (key ==CODED){
  if(keyCode == UP){
    y = y-20;
  }
  else if(keyCode ==DOWN){
    y=y+20;
  }
  else if(keyCode ==LEFT){
    x=x-20;
  }
  else if(keyCode ==RIGHT){
    x=x+20;
  }
  }//these control the movement of the cowboy
loop();}

  void draw(){
    background(255);
    imageMode(CENTER);
    image(image,x,y,58,75);
    
    
  image(image2,mouseX,mouseY,50,50);//this controls the movement of the aim
  loop();
  }
  
 void mouseClicked(){
   event.trigger();
   noLoop();//fire
   if(dist(x,y,mouseX,mouseY)<13){
 background(0);
     text("Police Win!",100,300);
     fill(0);//the cowboy is shot
     } 
 else {
       background(0);
     text("Cowboy Win!",100,300);
     fill(0);//the cowboy escape
     
     }}
       
   
   
  

  

