
PImage b;
PImage c;
int i;
void setup(){
  size(500,500); //size of view box
  background(0); //set color to white
  frameRate(5);
  strokeWeight(2);
}

void draw(){
  if(random(0,1) <0.5){
    stroke(255,226,5);
  } else{
    stroke(255,0,0);
  }
  for(i=0; i<10; i++) {
    line(270,350,random(1,499),random(1,499));
  }
  b=loadImage("fire.gif"); //image of fire
  image(b,100,50);  
  c=loadImage("firepig.gif"); //image of emboar
  image(c,220,330);
  
}

