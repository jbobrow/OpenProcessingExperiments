
float time = 200;

void setup() {
  size (700,400);
  smooth();
  frameRate(20);
}

void hole (float y) {
  ellipse (50,50,50,50);
}

void smoke (float x) {
  fill(255,1); 
  rect(0,0,width,height);
  frameRate(100);
  fill (0,0,0,30);
 noStroke ();
// rotate(mouseY);
  ellipse (pmouseX+random(40,60),pmouseY+random(40,60),random(20,30),random(20,30));
  loop();
}

void draw (){
  smoke(240);
}
                
                                
