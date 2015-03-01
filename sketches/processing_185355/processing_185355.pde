
int frames=100, num=200, sz=2, c=12;
float theta, r;
 
void setup() {
  size(540, 540);
  noStroke();
}
 
void draw() {

  background(0);

  noStroke();
  fill(255);
   for (int j=0; j<c; j++) {
    r=TWO_PI/c*j;
  for (int i=0; i<=num; i++) {
  
    pushMatrix();
    translate(width/2, height/2);
    rotate(r);
     float offSet=TWO_PI/num*i;
     
     
    float d =  map(sin(theta-offSet*2), -1, 1, 20, 40);
    float d2 =  map(sin(theta-offSet), -1, 1, 0, d);
     
     
      float x = 25 + d2*2 + map(sin(theta+offSet*10), -1, 1, 0, d2);
 
      float x2 = map(d2,-1,1,0,x)-map(d,-1,1,0,x);

        ellipse(x2+d2, 0, sz, sz);
   
    r+=TWO_PI/num;
    popMatrix();
  } }
  theta += TWO_PI/frames;
}
