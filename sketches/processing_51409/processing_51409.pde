
void setup(){
  size(500,500);
  background(10,170,255);
}

void draw(){smooth();ellipseMode(CENTER);strokeWeight(25);

//topleft
stroke(pmouseX+100,pmouseY,pmouseX);
ellipse(125,125,abs(mouseX-300),abs(mouseY-300));
ellipse(125,125,abs(mouseY-300),abs(mouseX-300));
//topright
stroke(pmouseX,pmouseY+100,pmouseX);
ellipse(375,125,abs(mouseX-300),abs(mouseY-300));
ellipse(375,125,abs(mouseY-300),abs(mouseX-300));
//bottomleft
stroke(pmouseX,pmouseY+100,pmouseX);
ellipse(125,375,abs(mouseX-300),abs(mouseY-300));
ellipse(125,375,abs(mouseY-300),abs(mouseX-300));
//bottomright
stroke(pmouseX+100,pmouseY,pmouseX);
ellipse(375,375,abs(mouseX-300),abs(mouseY-300));
ellipse(375,375,abs(mouseY-300),abs(mouseX-300));
//center
stroke(pmouseX,pmouseY,pmouseX+100);
ellipse(250,250,abs(mouseX-pmouseX/75),abs(mouseY-pmouseY/75));
ellipse(250,250,abs(mouseY-pmouseY/75),abs(mouseX-pmouseX/75));
//8Corners
//1
stroke(mouseX-100,mouseY,mouseX*mouseY);
ellipse(62,62,abs(mouseY-pmouseY),abs(mouseX-pmouseX));
ellipse(62,62,abs(mouseX-pmouseX),abs(mouseY-pmouseY));
//1
stroke(mouseX-100,mouseY,mouseX*mouseY);
ellipse(250,62,abs(mouseY-pmouseY),abs(mouseX-pmouseX));
ellipse(250,62,abs(mouseX-pmouseX),abs(mouseY-pmouseY));
//3
stroke(mouseX-100,mouseY,mouseX*mouseY);
ellipse(438,62,abs(mouseY-pmouseY),abs(mouseX-pmouseX));
ellipse(438,62,abs(mouseX-pmouseX),abs(mouseY-pmouseY));
//4
stroke(mouseX-100,mouseY,mouseX*mouseY);
ellipse(62,250,abs(mouseY-pmouseY),abs(mouseX-pmouseX));
ellipse(62,250,abs(mouseX-pmouseX),abs(mouseY-pmouseY));
//5
stroke(mouseX-100,mouseY,mouseX*mouseY);
ellipse(62,438,abs(mouseY-pmouseY),abs(mouseX-pmouseX));
ellipse(62,438,abs(mouseX-pmouseX),abs(mouseY-pmouseY));
//6
stroke(mouseX-100,mouseY,mouseX*mouseY);
ellipse(250,438,abs(mouseY-pmouseY),abs(mouseX-pmouseX));
ellipse(250,438,abs(mouseX-pmouseX),abs(mouseY-pmouseY));
//7
stroke(mouseX-100,mouseY,mouseX*mouseY);
ellipse(438,250,abs(mouseY-pmouseY),abs(mouseX-pmouseX));
ellipse(438,250,abs(mouseX-pmouseX),abs(mouseY-pmouseY));
//8
stroke(mouseX-100,mouseY,mouseX*mouseY);
ellipse(438,438,abs(mouseY-pmouseY),abs(mouseX-pmouseX));
ellipse(438,438,abs(mouseX-pmouseX),abs(mouseY-pmouseY));
}

void mousePressed(){
  background(10,170,255);  
}

void keyPressed(){
  background(255,170,10);
}


