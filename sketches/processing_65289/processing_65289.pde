
class A
{
float theta = 150;
float yspeed = 1;
float x;
float y;
int done = 0;

 void animate() {
    noStroke();
    int r = 50;
    if(theta >= 145.41) {
      fill(255,10,0);
      x = r * cos(theta);
      y = r * sin(theta);
      theta -= 0.02;
      ellipse(x + width/2, y + height/2, 5, 5);
    }
    if(theta == 145.39902) {
      r = 0;
      done = 1;
      x = 210;
      theta = 145;
      y = 130;
    }
    if(done == 1) {
      y += yspeed;
      fill(255,10,0);
      ellipse(x,y,5,5);
      if(y >= 225) {
        done = 2;
      }
    }
  }
  void drawing(){
    //colorMode(HSB);
      noStroke();
  fill(mouseX ,mouseY ,100);
    
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
    mouseMoved();
  }
  else {

  }
  }
}

