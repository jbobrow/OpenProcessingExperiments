
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/155982*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

//UPDATE: I downloaded my own openprocessing sketch and tweaked it into its final composition
//this code combines several codes on openprocessing. I tweaked them a bit (invisibility by mouse dragging, etc.)and combined them in different order.

int click = 0;
float num = 5;
boolean doOnce = true;
 
void setup(){
  size(1000, 1000);
  noStroke();
}
 
void draw(){
  background(0, 0, 0);
  //changes into random colours
  stroke(mouseX, 80, mouseY);
  strokeWeight(1);
  fill(mouseX, mouseY, mouseY);
  for(int i = 0; i < 360; i++){
    float angle = cos(radians(i*click+num))*900;
     
    float x = width/5+sin(radians(i))*angle;
    float y = height/5+cos(radians(i))*angle;
     

    line(y, x, 2, 2);

    
//code below determines change of object by clicking
  }
  num += 0.10;
}
 

 void mousePressed(){
  if(doOnce){
    doOnce = false;
    click++;
  }
}
void mouseReleased(){
  doOnce = true;
}



