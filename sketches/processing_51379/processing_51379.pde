
// PS1 - 6 
//Ryanne Hollies

void setup() {
size (400, 400);
smooth();
noStroke();
background(255, 5, 139);

  }
  
void draw() {


  for (int i=0; i<1; i+=1) {

    strokeWeight(5);
    stroke(255);
    line(mouseX+i, mouseY, pmouseX+i, pmouseY);
    line(mouseX+i, height-mouseY, pmouseX+i, height-pmouseY); 
  }
  
}

void mousePressed() {
  fill(255, 5, 139);
  noStroke();
  rect(0,0,width, height);
}

