
ArrayList <particle> pars = new ArrayList <particle> ();
boolean tf;
void setup() {
size(400, 400);
stroke(0);
background(0);
}
void draw() {
  if(keyCode == UP) {
  tf = true;
  }
  if(keyCode == DOWN) {
    tf = false;
  }
  if(tf == true) {
    background(0);
text(pars.size(), 200, 100);
  }
 if(mousePressed) {
   pars.add(new particle(mouseX, mouseY));
 }
 for(int i = 0; i < pars.size(); i++) {
   pars.get(i).draw();
   if(pars.get(i).x<0 || pars.get(i).x>height) {
   pars.remove(i);
   }
 }
}
class particle {
  float x;
  float y;
  float xvel = random(-1 , 1);
  float yvel=random(-1, 1);;
  particle(float xvar, float yvar) {
    x=xvar;
    y=yvar;
  }
  void draw() {
    if(y<390) {
    yvel+=0.03;
    }
    else {
      yvel = 0.001;
      if(x<width && x>0){
        xvel*=1.07;
      }
    }
          if(x<width && x>0 && y > 300){
        xvel*=1.1;
      }
    y+=yvel;
    x+=xvel;
    ellipse(x, y, 3, 3);

  }
}
