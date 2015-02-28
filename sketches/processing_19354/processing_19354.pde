
PFont font;

void setup(){
size(250,250);
smooth();
font=loadFont ("Cracked-48.vlw");
textFont (font);

}

void draw(){
  
  background(255);
  
 for(int y=0; y<=height; y+=40) {
  for(int x=0; x<=width; x+=40) {
    fill (0, random(5,60));
    textSize (random (5,40));
    text ("l1c5k8", random (x,y), random(y,x));


if(mousePressed){
stroke(0);
}else{
textSize (90);
fill (random (1, 250), random (10, 50));
text ("L1C5K8", 0, height+8);
}}}}


