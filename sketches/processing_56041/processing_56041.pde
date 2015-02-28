
void setup() { 
  size(500, 500);
  fill(0, 102);
  smooth();
  
}

void draw(){
  background(150, 100, 200);
//feet
int xft=mouseX;
int yft=mouseY;

fill(50);
quad (xft-40, yft+40, xft-30, yft+40, xft-30, yft+50, xft-50, yft+50);//left
quad (xft+50, yft+50, xft+30, yft+50, xft+30, yft+40, xft+40, yft+40);//righ

//shin


line (xft-30, yft+40, xft-25, yft+25);
line (xft+30, yft+40, xft+25, yft+25);
strokeWeight(2.5);

//thigh
strokeWeight(2.5);
line(xft-25, yft+25, xft, yft+5);
line(xft+25, yft+25, xft, yft+5);

//knee
fill(255);
strokeWeight(1);
ellipse(xft-24, yft+25, 10, 10);
ellipse(xft+24, yft+25, 10,10);

//abs
strokeWeight(5);
line(xft, yft+5, xft, yft-5);

//pelvis
strokeWeight(1);
fill(50);
beginShape();
vertex(xft-10, yft+5);
vertex(xft+10, yft+5);
vertex(xft+10, yft+10);
vertex(xft+5, yft+15);
vertex(xft-5, yft+15);
vertex(xft-10, yft+10);
endShape(CLOSE);

//arms
strokeWeight(7);
noFill();
arc(xft-15, yft-2, 50, 50, PI, TWO_PI-PI/2);
arc(xft+15, yft-2, 50, 50, TWO_PI-PI/2, TWO_PI);

//chest
strokeWeight(1);
fill(255);
beginShape();
vertex(xft-5, yft-5);
vertex(xft+5, yft-5);
vertex(xft+20, yft-20);
vertex(xft+20, yft-30);
vertex(xft-20, yft-30);
vertex(xft-20, yft-20);
endShape(CLOSE);


//black band


//star
noStroke();
fill(255, 243, 0);
triangle(xft, yft-29, xft+10, yft-12.5, xft-10, yft-12.5);
triangle(xft, yft-7, xft+10, yft-23, xft-10, yft-23);  

//head
fill(50);
rect(xft-10, yft-40, 20, 10);
//colour red
fill(255,0,0);
quad(xft-10, yft-40, xft-5, yft-50 , xft+5, yft-50 , xft+10, yft-40);  

//eye
//colour yellow
fill(255, 243, 0);
arc(xft-5, yft-39, 10, 10, 0, PI);
arc(xft+5, yft-39, 10, 10, 0, PI);

//mouth 
fill(150);
rect(xft-5, yft-32, 10, 2); 

  
//mouse click
  if (mousePressed == true) {
stroke(255, 243, 0);

  
for (int x = mouseX; x <= height; x += 40) {
for (int y = mouseY; y <= width; y += 40) { 
  line(x, y, mouseX, mouseY);
}
}
}
}













