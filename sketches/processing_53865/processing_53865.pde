
float angle = 0;
float radius = 80;

 
int dragX, dragY, moveX, moveY, pressX, pressY;

int colorValue;
int value = 0;

void setup(){
  size(600,600);
  colorValue=0;
}

void draw(){

  
  fill(value);
  rect(25,25,50,50);


  background(colorValue);
  colorValue++;
  if(colorValue >20){
    colorValue=0;
  }

    angle += random(-.3,.3);
 for(int i = 0; i < 100; i++){
   
  float sinval = sin(angle);
  float cosval = cos(angle);
   
  float x = 250 + (cosval * radius);
  float y = 250 + (sinval * radius);
  stroke(#ffffff);
  ellipse(x,y,180,180);
 quad(x,y,moveX,moveY,mouseX,mouseY,pmouseX,pmouseY);
 line(mouseX,mouseY,pmouseX,pmouseY);
 translate(dragX,dragY);
 }
}
 void mouseMoved() {
    moveX = mouseX;
    moveY = mouseY;
}
  void mouseDragged() {
    dragX = mouseX;
    dragY = mouseY;
 
}
  void mousePressed() {
    pressX = mouseX;
    pressY = mouseY;
    
}

