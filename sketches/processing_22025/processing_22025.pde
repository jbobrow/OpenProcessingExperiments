
float r = PI/6; // initial rotation
void setup () {
size (800, 800);
smooth();
background (255);
}
void draw () {
}

void mouseDragged (){
  
pushMatrix ();
translate (mouseX, mouseY); //move the origin point according to mouse value
rotate (r);
noStroke();
rectMode(CENTER);
fill (200, random(20,100),0,random(2,70));
rect (0, 0, random(40,10), random(10,40)); // use 0,0 to position where mouse is
fill (random(100,255),0,40,50);
ellipse (20, 0, random(2,20), random(20,2)); // use 0,0 to position where mouse is
popMatrix ();
r += PI/90; //increment angle – make smaller to slow rotation
}




