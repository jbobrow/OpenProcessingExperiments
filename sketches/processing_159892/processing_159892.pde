
void setup() {
size(500, 500) ;
}

void draw() {
for (int x = 0 ; x < 30 ; x++) {
  for (int y = 0; y <30; y++) {
  fill(#000000);
   ellipse(20*x, 20*y, 10, 10) ;
  }
} 
fill (255, 35, 80);
ellipse(250, 250, 350, 350) ;

fill (#8D39C4);
triangle (18, 18, 18, 360, 81, 280);

fill (#8D39C4);
triangle (280, 81, 360, 18, 18, 18);

fill (#FFFFFF);
ellipse(170, 160, 72, 72);

fill (#000000);
arc(278,300,265,265,PI,TWO_PI);

fill (#FFFFFF);
rect(290, 270, 30, 30);

fill (#B9B6BA);
rect(220, 270, 30, 30);

fill (#000000);
ellipse(170, 160, 52, 72);

}




