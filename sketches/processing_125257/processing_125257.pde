

import ddf.minim.*;

color[]circles={#084C7F,#5CB9FF,#0F99FF,#114EBF,#0C7ACC,#1E2AFF};
color[]palette=circles;
Minim minim;
AudioPlayer cello;
AudioPlayer Haunted;
AudioPlayer nature;

float counter=0;
PImage hauntedhouse;
PImage sad;
PImage butterfly;
PImage ghost;
PImage lobster;
PImage water;
float sizeone;
float sizetwo;
int x=25;
int y=25;
float b;

//setup
void setup() {
  width=100;
  height=800;
  size(1220,720);
  noFill();
  hauntedhouse=loadImage("Picture5revosed.png");
  sad=loadImage("Picture1Brevisedgif.png");
  butterfly=loadImage("Picture0a.png");
  lobster=loadImage("Picture8a.png");
  water=loadImage("water.png");
  minim=new Minim(this);
  cello=minim.loadFile("assignment11Final.mp3");
  Haunted=minim.loadFile("Haunted.mp3");
  nature=minim.loadFile("Birds.mp3");

  float sizeone;
  float sizetwo;
  background(#F4F519);
  image(hauntedhouse,0,400,450,340);
  image(sad,800,0,450,340);
  image(butterfly,0,0,450,340);
  image(lobster,800,400,450,340);
  fill(#000000);
  textSize(32);
  text("What is you mood today?", 410, height/2+5);
  textSize(50);
  fill(#FFFFFF);
  text("a", 5, 330);
  fill(#000000);
  text("b", 5, 448);
  fill(#FFFFFF);
  text("c", 1170, 330);
  fill(#000000);
  text("d", 1170, 438);
  textSize(20);
  text("Select the letter of the picture that represents your mood", 350, height/2+28);
}

void keyReleased(){
  if (key=='b'||key=='B'){
    background(#000000);
    float sizeone=(100);
    float sizetwo=(100);
    Haunted.play();} 
    else if (key=='a'||key=='A'){
      background(#16F22D);
      nature.play();
        while(counter < 260){
        float r=random(1,5);
        stroke(palette[int(r)]);
        strokeWeight(4);
        float b=random(height);
        float a=random(width);  
        float c=(a+32);
        float d=(b+32);
      
        line(a, b,c,d);
        point(a,b);
        counter += random(-1, +2);
      }
    }
        else if(key=='c'||key=='C'){
          background(#322089);
          cello.play();}
            else if(key=='d'||key=='D'){
              background(#1490FA);
              
              float a=random(720);
              float b=random(720);
              textSize(50);
              text("Keep hitting D", 50,50);
              water=loadImage("water.png");
              image(water, a,b,100,100);}
}
             
void draw() {
  if (key=='x'){

 }
    else if (key=='c'||key=='C'){
      textSize(30);
      text("Move mouse to draw. Click mouse to change color.  C to clear screen",30,30);
      float sizeone=(100);
      float sizetwo=(20);
      ellipse(mouseX, mouseY,sizeone,sizetwo);}
      else if (key=='b'||key=='B'){
        image(hauntedhouse,0,0,width,height);
        textSize(45);
        text("Click and move mouse to play with ghost!", 50,50);
        if (mousePressed){
        ghost=loadImage("ghost.png");
        image(ghost, mouseX, mouseY, 100,100);}

      }
       //ellipse(mouseX, mouseY, sizeone, sizetwo);}
  if (mousePressed) {
    pushMatrix();
    fill(palette[int(random(1,6))]);

    popMatrix();
    }

  }

