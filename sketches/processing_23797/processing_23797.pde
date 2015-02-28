
int x = 100;
int y = 70;

float r;
float g;
float b;
float a;
 
 void setup(){
  
  size (200,200);
  background(255);
  smooth();
}
void draw(){

  rectMode(CENTER);
ellipseMode (CENTER);

int x = mouseX;
int y = mouseY;


background(x,y,200);


r = random (255);
g = random (255);
b = random (255);
a = random (255);   


fill(255);

// Body
strokeWeight(1);
stroke(20,150,90);
fill(234,38,38);
rect(mouseX,mouseY,60,60);

line( 125,140,175,120);
line (125,170,160,190);
line(75,140,50,125);
line(74,170,50,190);
fill(r,g,b,a);
ellipse(100,90,100,90);
fill (0);
ellipse(81,70,45,32);
ellipse(119,70,45,32);
fill(255);
ellipse(81,70,16,15);
ellipse(119,70,16,15);
fill(234,38,38);
strokeWeight(3);
ellipse(100,90,16,15);

}




void keyPressed(){
  background(255);
}

