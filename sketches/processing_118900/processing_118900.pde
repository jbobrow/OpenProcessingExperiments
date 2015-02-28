

PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
int number;
float x=random(255);
import ddf.minim.*;

AudioPlayer player;
Minim minim;

void setup(){
  size(500,275);
  smooth();
  img1=loadImage("jiggles.png");
  img2=loadImage("backies.jpg");
  img3=loadImage("backiesglitch.png");
  img4=loadImage("backsies.jpg");
  img5=loadImage("over.png");
  background(img2);
  alpha(255);
  frameRate(8);
   minim = new Minim(this);
  player = minim.loadFile("song1.wav");
  player.loop();
}

void draw(){

  image(img1,mouseX,mouseY);

}

void keyPressed(){
  if(key=='a'){
    print("You shouldn't have done that! ");
    String a="screen" +nf(number,4) +".jpg";
    save(a);
    number++;
    print("LAVENDER TOWN SYNDROME! ");
    background(img3);
    img1=loadImage("jigglesglitch.png");
    player = minim.loadFile("song2.wav");
    player.loop();
  }
  
  if(key=='b'){
      println("That was a bad idea! ");
    String b="screen" +nf(number,4) +".jpg";
    save(b);
    number++;
    print("LEAVE NOW! ");
    background(img4);
    img1=loadImage("over.png");
   
    }
    
      if(key==' '){
      print("You're stuck with the sound that haunted hundreds... ");
    background(img2);
    img1=loadImage("jiggles.png");

  }  
}



