
int x=340;
int y=220;

float easing= 0.024;

void setup() {
size(780, 540);
smooth();
strokeWeight (1);
background (0);
}

void draw () {
  background(225) ;
  int targetX=mouseX;
  x+= (targetX-x) *easing;
  
  if (mousePressed) {
  y=50;
} else {
  y=100;
}
   
    
fill(0);
ellipse(x+115, y+140, 20, 20); //antenna ball
fill(198, 156, 109);
rect(x+110, y+149, 5, 80); //antenna
fill(198, 156, 109);
rect(x+95, y+200, 150, 180); //body
fill(235, 192, 143);
rect(x+100, y+205, 140, 75); //base
fill(198, 156, 109);
ellipse(x+200, y+240, 50, 50); //eyeball 1
fill(0);
ellipse(x+200, y+240, 35, 35); //eyeball 1
rect(x+120, y+228, 35, 20);  //eyeball 2
 
strokeWeight (2);
ellipse(x+115, y+305, 15, 15); //buttons
fill(255, 0, 0);
ellipse(x+145, y+304, 15, 15);
ellipse(x+175, y+304, 15, 15);
ellipse(x+205, y+304, 15, 15);
fill(255);
ellipse(x+230, y+305, 15, 15); //power button
line(x+247, y+290, x+300, y+280);
line(x+300, y+280, x+305, y+230);
line(x+95, y+290, x+42, y+280);
line(x+42, y+280, x+22, y+230);
fill(2);
stroke(1);
strokeJoin(BEVEL);
rect(x+122, y+382, 100, 30); //base
ellipse(x+152, y+424, 20, 20); //wheels
ellipse(x+192, y+424, 20, 20);

}

