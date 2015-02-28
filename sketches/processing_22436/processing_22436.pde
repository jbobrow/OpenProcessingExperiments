
//Problem Set 2
//Question 6
//Matthew Iannacci
Alien a;
Alien b;

void setup() {
  size(1000,1000);
 
  a = new Alien(100,100);
  b = new Alien(500,100);
}

void draw() {
  background(255);
  a.display();
  b.display();
}

class Alien {
  float x;
  float y;
  
  Alien(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
void display() {
  pushMatrix();
  translate(x,y);
  
  fill(250,0,0);
rect(150,200,200,200);

fill(mouseX,mouseY,0,255);
ellipse(250,150,200,200);

fill(255,0,0);
ellipse(200,125,50,50);
ellipse(300,125,50,50);

line(200,200,300,200);
line(200,75,250,125);
line(250,125,300,75);

fill(0,0,0);
rect(150,400,50,100);
rect(300,400,50,100);

rect(100,250,50,75);
rect(350,250,50,75);
popMatrix();

}
}
    

