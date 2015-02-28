



PImage rock;
PImage rockbkg;

void setup(){
  size(250,250);
  rockbkg=loadImage("rockbkg.png");
  background(rockbkg);
  
  smooth();
  
}
void draw (){
   if (mousePressed){
    rock=loadImage("rock.png");
    image(rock,pmouseX,pmouseY,50,50);
  
 

}

}


