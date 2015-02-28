
PImage troll;

void setup(){
  size(300,300);
  smooth();

}


  float i=0.0;

void draw(){
  frameRate(30);
  background(0);
stroke(255,120);
translate(40,40);
if( i<200){
  i++;
  strokeWeight(i);
  troll = loadImage("troll.png");
  image(troll,random(i),random(i),i ,i);
}
}

