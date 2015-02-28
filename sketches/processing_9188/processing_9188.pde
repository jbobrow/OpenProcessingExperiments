
void setup () {
  size(500,500);
}



void draw () {
  //background(255);
  //println(mouseX + "," + mouseY);
  //ellipse(mouseX, mouseY, 10, 10);
  stroke(mouseX, mouseY, 0);
  strokeWeight(abs(mouseX+pmouseY));
  arc(mouseY, mouseX, pmouseY, pmouseX, 0, PI/2) ;
  
}

/*void mousePressed() {
  point(210, 200);
  point(200, 210);
}*/

void mouseDragged () {
stroke(10);
fill(0,255,0,125);
arc(40,45,40,40,0, PI/2);
noFill();

stroke(10);
fill(0,255,0,125);
arc(40,45,0,0,0, PI/2);
noFill();

stroke(10);
fill(0,255,0,125);
arc(240,245,140,140,0, PI/2);
noFill();

stroke(10);
fill(0,255,0,125);
arc(240,245,100,100,0, PI/2);
noFill();

stroke(10);
fill(0,255,0,125);
arc(240,245,50,50,0, PI/2);
noFill();

stroke(10);
fill(0,255,0,125);
arc(240,245,0,0,0, PI/2);
noFill();

stroke(10);
fill(0,255,0,125);
arc(240,245,50,50,0, PI/2);
noFill();

}

