
int x=20;
int y=20;
void setup() {
  smooth();
  strokeWeight(4);
  size( 80, 90);
}

void draw() {

  background( 182, 255, 0);


beginShape();
fill( 255, 255, 255);
ellipse( x, y, x, x);
vertex( x, y+10); 
vertex( x, y+40);
vertex( x-10, y+60);
vertex( x, y+40);
vertex( x+10, y+60);  
vertex( x, y+40);
vertex( x, y+20);
vertex( x+10, y+20);
vertex( x+20, y+30);
vertex( x+10, y+20);
vertex( x+20, y+30);
vertex( x, y+20);
vertex( x+20, y+30);
vertex( x+10, y+40);
vertex( x+20, y+30);
vertex( x+30, y+40);
vertex( x+20, y+30);
vertex( x+50, y);
vertex( x+20, y+30);
vertex( x+10, y+20);
vertex( x, y+20);
vertex( x, y+10);
endShape();

save("swordup.jpg");
}


