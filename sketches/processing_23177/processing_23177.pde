
float a = 250;
float b = 100;
float c = 400;

void setup() {
 
 size(500,500);
 background(255);
 smooth();
  
}

void draw() {
  
  //background
  noStroke();
fill(random(0,255),random(0,255),random(0,255),random(0,10));
  triangle(a,b,b,c,c,c);
  
  a = a+random(-50,50);
  b = b+random(-50,50);
c = c+random(-50,50);

}

