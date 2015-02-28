
void setup() {

size(880, 620);
smooth();
background(250, 217, 247);
 
}

void draw() {

strokeWeight(4);
line(mouseX, mouseY, 420, 310);
line(150, 90, 420, 310);
line(170, 90, 420, 310);
line(190, 90, 420, 310);

strokeWeight(4);
line(630, 90, 420, 310);
line(650, 90, 420, 310);
line(670, 90, 420, 310);
line(690, 90, 420, 310);

fill (225, 94, 240);
ellipse(mouseX, mouseY, 90, 90);
strokeWeight(2);  
  
}

