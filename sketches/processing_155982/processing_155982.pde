
//this code combines several codes on openprocessing. I tweaked them a bit (invisibility by mouse dragging, etc.)and combined them in different order.

int click = 0;
float num = 0;
boolean doOnce = true;
 
void setup(){
  size(800, 800);
  noStroke();
}
 
void draw(){
  background(255);
  //stroke with mouse changes the object to black(left) to white/invisible(right)
  stroke(mouseY, mouseX, mouseY);
  strokeWeight(5);
  fill(mouseX, mouseY, mouseX);
  for(int i = 0; i < 360; i++){
    float angle = cos(radians(i*click+num))*200;
     
    float x = width/2+sin(radians(i))*angle;
    float y = height/2+cos(radians(i))*angle;
     

    ellipse(y, x, 2, 2);

//code below determines change of object by clicking
  }
  num += 0.8;
  text("Click: " + click, 5, 1);
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



