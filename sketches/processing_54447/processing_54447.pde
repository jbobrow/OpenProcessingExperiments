
//Problem Set 1.3 by Nathan Smofsky
/*The mouth duplicated every time you click, you can
also drag it around.*/


void setup () {
  size(400,400);
  background(0);
}

void draw() {
  noStroke();
  fill(0, 65, 0);
  rect(180, 65, 40, 80);
//----------------------------------------------------------
noStroke();
fill(250, 120, 50);
ellipse(100, 200, 125, 200);

noStroke();
fill(250, 120, 50);
ellipse(200, 200, 200, 215);

noStroke();
fill(250, 120, 50);
ellipse(300, 200, 125, 200);
//----------------------------------------------------------
stroke(0);
fill(235, 0, 0);
triangle(150, 180, 165, 145, 180, 180);

stroke(0);
fill(235, 0, 0);
triangle(250, 180, 235, 145, 220, 180);
         

//----------------------------------------------------------
stroke(0);
line(150, 125, 180, 140);

stroke(0);
line(250, 125, 220, 140);
}
//----------------------------------------------------------
//center of triangle: (200, 230);
//original mouth coordinates:(165, 220, 200, 260, 235, 220); 
/*mouse: (mouseX-35, mouseY-30, mouseX, mouseY-30, mouseX+35, 
          mouseY+30); */
void mouseDragged() {
stroke(250, 120, 50);
fill(0);
triangle(mouseX-35, mouseY-20, mouseX, mouseY+20, mouseX+35, 
         mouseY-20);
}

