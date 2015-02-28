
void setup() {
  size(700,700);  
  background(0,227,255);
  smooth();
}
void draw() {

int xis1 = round(random(100,600));

int xis2 = round(random(100,600));
int xis3 = round(random(100,600));
int xis4 = round(random(100,600));
int yps1 = round(random(100,600));
int yps2 = round(random(100,600));
int yps3 = round(random(100,600));
int yps4 = round(random(100,600));

fill(0,0,0,5);
noStroke();
 
rect(0,0,900,900);
 
fill(255,255,255);
stroke(0,227,255);
 
quad(xis1,yps1,xis2,yps2,xis3,yps3,xis4,yps4);

}
