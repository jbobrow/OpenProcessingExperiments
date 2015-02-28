
//As spring approaches, I was inspired to create a nature-inspired,
//colorful sketch :) I have used both mouse and key input, sounds and
//an image(for the background).
//Instructions: - press mouse to draw as many "flowers" as you want
//-press 'g' to make the grass grow!
import ddf.minim.*;

Minim minim;
AudioSample flowers;
AudioSample nature;

PImage tree;
color[]palette={#FF453C,#E84991,#CA49FF,#D295FF,#E85760,#FFD65D,#733CFF};
color[] grass={#09BF58,#067F3A,#0CFF75,#03401D,#0BE569};
int counter=0;
float x,y,x1,y1,g;

void setup(){minim=new Minim(this);
flowers=minim.loadSample("flowers.mp3");
nature=minim.loadSample("nature.mp3");
size(800,600);
tree=loadImage("tree.jpg");
background(tree);}

void draw(){
if (mousePressed==true)
{flowers.trigger();
  float r = random(7);
stroke(palette[int(r)]);
fill(palette[int(r)]);
ellipse(mouseX,mouseY,100,100);
}
}


void keyPressed(){
if(key=='g'||key=='G'){nature.trigger();
while(counter<700){
  float g=random(5);
  float x=random(0,800);
  float y=random(570,600);
  float x1=random(0,800);
  float y1=random(570,600);
  strokeWeight(random(2,5));
  stroke(grass[int(g)]);
  line(x,y,x1,y1);
  counter++;}
}
}



