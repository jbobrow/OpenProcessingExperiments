
// make sure I break into functions
int r=255;
int g=255;
int b=255;
int a=100;
int dia=50;


void setup() {
  size(800,800);
  background(0);
  smooth();
}

void draw() {
  stroke(r,g,b,a);
  strokeWeight(10);
  line(mouseX, mouseY, pmouseX, pmouseY);
  line(mouseX, height-mouseY, pmouseX, height-pmouseY);
  line(width-mouseX, mouseY, width-pmouseX, pmouseY);
  line(width-mouseX, height-mouseY, width-pmouseX, height-pmouseY);
  
  r=random(50,100);
}

void mouseClicked() { //add on mouse click the stroke weight of the line increases, then when it reaches a certain point, it begins to degrease
  fill(r,g,b,a);
  noStroke();
  ellipse(mouseX,mouseY,dia,dia); 
  ellipse(mouseX, height-mouseY, dia, dia); // these two lines (width-) allow it to be symetrical
  ellipse(width-mouseX,mouseY,dia,dia);
  ellipse(width-mouseX, height-mouseY, dia,dia);
    
  b=random(150,255);
  a=random(75,100);
  dia=random(50,100);
}


