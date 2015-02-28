
float angle = 0;
 
void setup(){
  size(720,480);
  background(0);
  smooth();
}
 
void draw() {
  if (keyPressed){
    if (key == 'b'){
    background(0);
    }
  } else {
    translate(mouseX,mouseY);
    rotate(angle);
    rect(-15,-15,30,30);
    if (key == 's'){
      noFill();
      stroke(255*abs(cos(angle/20)), 255*abs(cos(angle/30)), 255*abs(cos(angle/2)));
    } else if (key == 'f'){
      noStroke();
      fill(255*abs(cos(angle/20)), 255*abs(cos(angle/30)), 255*abs(cos(angle/2)));
    }
    if (mousePressed != true){
      angle += 2*PI/30;
    }
   
  }
}



