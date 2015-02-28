
import ddf.minim.*;

Minim minim;
AudioPlayer bm;
AudioSample gun;

PImage cheongba;//declare image


void setup(){
  cheongba= loadImage("cheongba.png");//load image
  size(610,510);//set the size
  
  minim = new Minim(this);
  gun= minim.loadSample("gun.mp3",1024);//load shooting sound
  bm=minim.loadFile("sorbare.mp3",1024);//loud background music
  bm.loop();//set loop bm
 
     
  background(220);
  stroke(150);
  for (int crossX =10; crossX<width;crossX+=20){//use "for" to make a cross background
    for (int crossY =10; crossY<height; crossY+=20){
      line(crossX,crossY,crossX+10,crossY+10);
      line(crossX,crossY+10,crossX+10,crossY);
  }
  }
  imageMode(CENTER);//set image at the center place
  image(cheongba,width/2,height/2,255,500);
  
 
  

}

void draw(){
  if (mousePressed)//set the shoot sound when mouse is pressed
  gun.trigger();
}



void mousePressed(){// set the shoot track after mouse is pressed
if (mousePressed==true){
    fill(255);
    noStroke();
    ellipse(mouseX+random(1,5),mouseY+random(1,5),10,10);
}
}

