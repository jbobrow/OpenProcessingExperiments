
int x = 240;
int y = 40;

float easing = 0.02;

void setup() {
 size(540, 340); 
  smooth(); 
  noStroke(); 
  background(103, 191, 169); 
  ellipseMode(RADIUS);
}

void draw() {
  background(103, 191, 169);
  int targetX=mouseX;
  x+= (targetX-x)*easing; 
 
//head
fill(237, 109, 70); 
ellipse(x+40, y+60, 50, 50);
fill(0); 
ellipse(x+20, y+70, 5, 10);
ellipse(x+60, y+70, 5, 10);
fill(255);
ellipse(x+20, y+75, 2, 2);
ellipse(x+60, y+75, 2, 2);
stroke(0);
strokeWeight(4);
line(x+8, y+58, x+20, y+52);
line(x+72, y+58, x+60, y+52);
//antennae
stroke(187, 192, 192);
line(x+14, y+24, x+2, y+8);
line(x+62, y+24, x+72, y+8);
noStroke();
fill(0);
ellipse(x+2, y+8, 4, 4);
ellipse(x+72, y+8, 4, 4);
//body
fill(187, 192, 192);
quad(x-3, y+85, x+83, y+85, x+90, y+110, x-10, y+110);
fill(224, 234, 234);
quad(x+90, y+110, x+72, y+165, x+8, y+165, x-10, y+110);
//arms
rect(x-20, y+110, 10, y-100);
rect(x+90, y+110, 10, y-100);
//legs
rect(x+8, y+165, -10, y);
rect(x+72, y+165, 10, y);
arc(x-12, y+205, 20, 20, PI, TWO_PI);
arc(x+92, y+205, 20, 20, PI, TWO_PI);

}
