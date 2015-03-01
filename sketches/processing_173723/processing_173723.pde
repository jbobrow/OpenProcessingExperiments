
//sin2PI//
int num=120;
float theta;

void setup() {
  size(900, 600);
  background(0);
  stroke(255,50);
  strokeWeight(0.8);
  fill(255, 50);


}

void draw() {
  background(0);
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    pushMatrix();
    float offSet = TWO_PI/num*i;
    rotate(sin(offSet*2));
    float x1 = map(sin(theta+offSet*1),-1,1,-90,400);
    float x4 = map(cos(theta+offSet*2),-1,1,0,80);
    float x2 = x1 -50 +sin(7) ;
    float x3 = 100;
    float x5 =  map(sin(theta+offSet*5),-1,1,0,80);
    
  rect(3*x1/1.5, 10/1.5, x5/1.5, 5/1.5, -9/1.5);
  rect(5*x4/1.5, 10/1.5, x5/1.5, 5/1.5, -9/1.5);
  rect(x1/1.5, 100/1.5, sin(x3)/1.5, sin(50)/1.5, -100/1.5);
    
  popMatrix();
    
  }
  theta -= 0.033987;
}


