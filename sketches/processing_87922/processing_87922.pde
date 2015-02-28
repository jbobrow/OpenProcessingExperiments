
float counter = 0;

void setup () {
  size(400,400);
  smooth();
  frameRate(30);
}

void draw() {
  
  background(0);
  
  translate(0,height*0.5);
  int max = 15;
  
  for ( int i =0 ; i < max ; i++ ) {
    
    translate(30,0);
    rotate(i*(cos(counter)*0.05));
    float h = map(i,0,max-1,30,1);
    pushMatrix();
    translate(0,-0.5*h);
    rect(0,0,25,h);
    popMatrix();
    
  }
  
  counter += 0.1;
}
