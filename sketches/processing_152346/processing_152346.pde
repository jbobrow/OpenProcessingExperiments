
float x,y;
float speed = 1;
PVector vm, ve, vgo; 

void setup() {
  size(500,500);
  frameRate(60);
  background(0,0,0);
  ellipseMode(CENTER);
  vm = new PVector(250,250);
  ve = new PVector(250,250);
  vgo = new PVector(250,250);
}

void draw() {
    vgo = PVector.sub(vm,ve); //calculate the vector between ellipse and mouse
    vgo.normalize();  //sets the vector length to 1
    vgo.mult(speed);  //sets the vector length to "speed"
    ve.add(vgo);      //add the movement vector to the ellipse position
    fill(ve.x/2, ve.y/2, 100);  //draw ellipse
    background(0,0,0);
    ellipse(ve.x, ve.y, 100, 100);
}

void mousePressed() {
  vm = new PVector (mouseX, mouseY);
}  
 




