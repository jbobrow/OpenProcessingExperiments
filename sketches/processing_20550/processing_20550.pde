
PImage lightCycle;
 
void setup(){
  size(300,300);
  lightCycle =loadImage("light_cycle.jpg");
  noStroke();
  smooth();
}
int x=0;
int cell= 5;
void draw(){
  rect(x,0,x,height);
  background(0);
   
  for(int y=cell; y<=299; y+=cell){
    for(int x=cell; x<=299; x+=cell){
       
      color myFill= color(lightCycle.pixels[x+(y*300)]);
      fill(myFill);
      float radius= cell *(brightness(lightCycle.pixels[x+(y*300)])/280);
      rect(x,y,width/25,height/50);
      x++;
   
      }
    }
  }


