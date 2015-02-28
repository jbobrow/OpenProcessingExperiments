
//Pedro Veneziano, February 24th, Creative Computing B, Benjamin Bacon

void setup() {
  size(700, 700);
  smooth();
}

void draw() {
  
  //FUNDO
  color mainColor = color(35);
  background(mainColor);
  strokeWeight(18);
  stroke(255);
  line(75,0,75,height);
  line(width-75,0,width-75,height);
  line(0,75,width,75);
  line(0,height-75,width,height-75);
  strokeWeight(20);
  stroke(random(0,255),random(0,255),random(0,255));
  rect(75, 75, width-150, height-150);
  
  strokeWeight(7);
  noFill();
 
 //LAYER6
 stroke(255,92,169);
 int pos6x = round(map(mouseX, 0, width, 250, 250));
 int pos6y = round(map(mouseY, 0, height, 250, 250));
 for (int layer6x = pos6x; layer6x <= pos6x+200; layer6x += 100) {
   for(int layer6y = pos6y; layer6y <= pos6y+200; layer6y += 100) {
     ellipse(layer6x, layer6y, 80, 80);
   }
 }
 
 //LAYER5
 stroke(131,78,214);
 int pos5x = round(map(mouseX, 0, width, 230, 270));
 int pos5y = round(map(mouseY, 0, height, 230, 270));
 for (int layer5x = pos5x; layer5x <= pos5x+200; layer5x += 100) {
   for(int layer5y = pos5y; layer5y <= pos5y+200; layer5y += 100) {
     ellipse(layer5x, layer5y, 80, 80);
   }
 }
 
 //LAYER4
 stroke(61,105,214);
 int pos4x = round(map(mouseX, 0, width, 210, 290));
 int pos4y = round(map(mouseY, 0, height, 210, 290));
 for (int layer4x = pos4x; layer4x <= pos4x+200; layer4x += 100) {
   for(int layer4y = pos4y; layer4y <= pos4y+200; layer4y += 100) {
     ellipse(layer4x, layer4y, 80, 80);
   }
 }
 
 //LAYER3
 stroke(61,209,213);
 int pos3x = round(map(mouseX, 0, width, 190, 310));
 int pos3y = round(map(mouseY, 0, height, 190, 310));
 for (int layer3x = pos3x; layer3x <= pos3x+200; layer3x += 100) {
   for(int layer3y = pos3y; layer3y <= pos3y+200; layer3y += 100) {
     ellipse(layer3x, layer3y, 80, 80);
   }
 }
 
 //LAYER2
 stroke(255,211,110);
 int pos2x = round(map(mouseX, 0, width, 170, 330));
 int pos2y = round(map(mouseY, 0, height, 170, 330));
 for (int layer2x = pos2x; layer2x <= pos2x+200; layer2x += 100) {
   for(int layer2y = pos2y; layer2y <= pos2y+200; layer2y += 100) {
     ellipse(layer2x, layer2y, 80, 80);
   }
 }
 
 //LAYER1   
 stroke(255,179,110,255);
 int pos1x = round(map(mouseX, 0, width, 150, 350));
 int pos1y = round(map(mouseY, 0, height, 150, 350));
 for (int layer1x = pos1x; layer1x <= pos1x+200; layer1x += 100) {
   for(int layer1y = pos1y; layer1y <= pos1y+200; layer1y += 100) {
     ellipse(layer1x, layer1y, 80, 80);
   }
 }
 
}


