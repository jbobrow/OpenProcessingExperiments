

// TODO: put all your variable declarations here

void setup() {
  size(800,800);   
  background(0);  
  smooth();
}

void draw() {
  
  
int xis1 = round(random(100,700));
int xis2 = round(random(100,700));
int xis3 = round(random(100,700));
int xis4 = round(random(100,700));
int yps1 = round(random(100,700));
int yps2 = round(random(100,700));
int yps3 = round(random(100,700));
int yps4 = round(random(100,700));

fill(0,0,0,5);
noStroke();

rect(0,0,800,800);

noFill();
stroke(255);

quad(xis1,yps1,xis2,yps2,xis3,yps3,xis4,yps4);
  
}


