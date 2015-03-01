
//cos2PI//
int num=100;
float theta;

void setup() {
  size(900, 600);
  background(0);
  stroke(255,50);
  strokeWeight(1);
  fill(255, 50);

}

void draw() {
  background(0);
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    pushMatrix();
    float offSet = TWO_PI/num*i;
    rotate(sin(offSet));
    float x1 = map(sin(theta+offSet*1),-1,1,-90,600);
    float x4 = map(cos(theta+offSet*2),-1,1,0,80);
    float x2 = x1 -50 +sin(7) ;
    float x3 = 100;
    float x5 =  map(sin(theta+offSet*5),-1,1,0,80);
    
  rect(3*x1/2, 10/2, x5/2, 5/1.7, -9/2);
  rect(5*x4/2, 10/2, x5/2, 5/1.7, -9/2);
  rect(x1/2, 100/2, sin(x3)/2, sin(50)/2, -100/2);
    
    popMatrix();
  }
  theta -= 0.023987;

}


