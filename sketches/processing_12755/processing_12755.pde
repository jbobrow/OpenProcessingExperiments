
// Assignment #3
// Name: Caitlin Fregoe
// E-mail: cfregoe@brynmawr.edu
// Date: 9/22/2010

float x, y, w, h, i;

void setup () {
  size(500, 500);
  smooth();
  background(255);
}

void draw() {
  if (mousePressed) {
   background(x);
  }
  drawMusicNote(x, y, w, h);
 
}

void drawMusicNote(float x, float y, float w, float h) { 
  noStroke();
  for (i=0; i<width/2; i=i+100) { 
    fill(random(255), random(255), random(255), random(255)); 
    x = 0;
    y = 100;
    w = 30;
    h = 30;
  beginShape(); //music note :P
  vertex(i+125, y+10); //topleftmost point
  vertex(i+200, y+10); //pt. across from first
  vertex(i+200, y+60);
  vertex(i+200, y+110);
  vertex(i+185, y+110); //bottom left
  vertex(i+185, y+110);
  vertex(i+185, y+60);
  vertex(i+185, y+30); //end of left stick part
  vertex(i+140, y+30);
  vertex(i+140, y+40);
  vertex(i+140, y+110);
  vertex(i+125, y+110); //bottom right
  vertex(i+125, y+60);
  vertex(i+125, y+10); //first pt. again
  endShape(CLOSE);
  
  noStroke();
  fill(random(255), random(255), random(255), random(255));
  ellipse(i+187, y+110, w, h);
  
  noStroke();
  fill(random(255), random(255), random(255), random(255));
  ellipse(i+127, y+110, w, h);
  
  } //end of loop

}

