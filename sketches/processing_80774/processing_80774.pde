
float change = 1.8;
void setup() {
  size(400, 400);
  //background (155);
  //noLoop();
int value = 0;
} 
void draw() {
  background(150);
  strokeWeight(1);
  smooth();
  noFill();
  for (int i = 1; i<mouseY ;i += 20) {
  ellipseMode(CORNER);
    ellipse(-100,-100,600,i*change+20);
    
  }
  
  
    for (int d = 1; d<mouseX ;d += 20) {
  ellipseMode(CORNER);
    ellipse(-100,-150,d*change+20,700);
    
  }
  /*for (int b = 40; b<mouseY ; b *= -change){
     ellipse(200,300,b,100); */
    }
  //fill(0);
  /*for (int u = 0; u<mouseY; u += 20) {
   
   ellipse(0,u,mouseX,u); 
   }*/




