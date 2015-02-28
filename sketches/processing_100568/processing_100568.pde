
float counter = 0;

void setup () {
  size(400,400);
  smooth();
  frameRate(30);
  noStroke();
}

void draw() {
  
  background(0);
  
  translate(0,height*0.5);
  int max = 25;
  
  for ( int i =0 ; i < max ; i++ ) {
    
    translate(22,0);
    rotate(i*(cos(counter)*0.05));
    float h = map(i,0,max-1,30,3);
  
    fill( map(i,0,max-1,h,120) );
    float h_next = map(i+1,0,max-1,30,3);
    quad(0,-0.5*h,25,-0.5*h_next,25,0.5*h_next,0,0.5*h);
 
    
  }
  
  counter += 0.1;
}
