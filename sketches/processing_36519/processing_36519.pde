
float d = 0.9  ;
float speed = 0;
float angle = 0;
float x = 0;
float y = 0;
float c = 15;
float centreX, centreY;
float sz = 10;

Boolean left = false;
Boolean right = false;

void  setup () {
  size(700,400);
  smooth();
  noStroke();
  background(5);
}

void draw () {

  fill(random(45), random (73), 255, 90);
  centreX = mouseX;
  centreY = mouseY;

  d = d + speed;
  angle = angle + d;
  x = cos(angle)*c + centreX;
  y = sin(angle)*c + centreY;
  rect (x,y,sz,sz);

  if (mousePressed && mouseButton == LEFT) {
    c = min((c+ 0.7),200);
    d = d++;
    sz = sz++;
    println("left pressed");
  }
  else if(mousePressed && mouseButton == RIGHT) 
  {
  activateg();  
  }
   
  else
  {
    c = max((c - 0.7),20);
    d = d--;
  }
}

void mouseMoved() {
 
}

void activateg(){


}

