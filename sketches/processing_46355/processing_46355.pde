
int oldMouseX;  int oldMouseY; 
color penStroke; 
int penWeight; int penFill;
int boz;
PFont commands; 




void setup() {
  size(600, 600); smooth();
  boz = 0; 
  commands = loadFont("Commands.vlw");
  oldMouseX = 0; 
  oldMouseY = 0;
  penStroke = color(0, 0, 0); 
  penFill = color(0, 0, 0);
  penWeight = 7; 
  background(250);
  noStroke();
  

  
}



void draw() {
   fill(0);rect(500,55,98,50);
  stroke(penStroke);
  strokeWeight (penWeight);
  fill(penFill);

  //thick stroke maker
  strokeWeight(1);
  fill(205); 
  rect(525, 500, 15, 90);
  if (mousePressed && mouseX < 540 && mouseX > 525 && mouseY > 500 && mouseY < 590) {
    penWeight  ++;
  }
  
   //thin stroke maker
  stroke(1); strokeWeight(5); 
  line(500, 500, 500, 590);
  if (mousePressed && mouseX > 495 && mouseX < 505 && mouseY < 590 && mouseY > 500) {
    if (penWeight > 0) {
      penWeight --;
    }
  }

  //line maker
  stroke(1); strokeWeight(1); 
  fill(#AB30BF); 
  ellipse(30, 570, 30, 30);
  textFont(commands, 12); 
  fill(0); 
  text("line maker", 10, 595);
  if (dist(mouseX, mouseY, 30, 570) < 15 && mousePressed) {
    boz = 0;
  }
  if (boz == 0) {
    if (mousePressed) {
      if (oldMouseX != mouseX || oldMouseY != mouseY) {
        stroke(penStroke); strokeWeight(penWeight); line(mouseX, mouseY, oldMouseX, oldMouseY); 
        
      }
    }
  }  
  oldMouseX = mouseX;
  oldMouseY = mouseY;

  //circle maker
 stroke(1); strokeWeight(1);
  fill(#AB30BF); 
  ellipse(125, 570, 30, 30); 
  textFont(commands, 12); fill(0); text("circle maker", 100, 595);
  if (boz == 2) {
    if (mousePressed) {
      fill(penFill); stroke(penStroke);
      ellipse(mouseX, mouseY, 45, 45);
    }
  }
  if (mousePressed && dist(mouseX, mouseY, 125, 570) < 15) {
    boz = 2;
  }

  //box maker
  fill(#AB30BF); strokeWeight(1); 
  ellipse(215, 570, 30, 30);
  textFont(commands, 12); fill(0); text("box maker", 200, 595);
  if (boz == 1) {
    if (mousePressed) { 
      fill(penFill); stroke(penStroke);
      rect(mouseX, mouseY, 45, 45);
    }
  }
  if (mousePressed &&  dist(mouseX, mouseY, 215, 570) < 15) {
    boz = 1;
  }

  //clear screen
  fill(255);
  stroke(0);
  strokeWeight(1); 
  rect(500, 1, 98, 50);
  if (mousePressed && mouseX > 500 && mouseX < 600 && mouseY < 50 && mouseY > 1) {
    background (255);
  }
 
 //labeling stroke colors
 textFont(commands, 15); fill(0); text("stroke color", 70, 15);
 
  // pink ink 
  /*fill(242, 0, 255); 
  stroke(0); 
  strokeWeight(1); 
  ellipse(15, 15, 15, 15);
  if (mousePressed && dist(15, 15, mouseX, mouseY) < 8.5) {
    penStroke = color(242, 0, 255);*/ 
  if(button (15,15, 242,0,255)){
    penStroke = color(242, 0, 255);
  }
  // bright teal ink
  /*fill(0, 255, 249); 
  stroke(0); 
  strokeWeight(0); 
  ellipse(15, 30, 15, 15);
  if (mousePressed && dist(15, 30, mouseX, mouseY) < 8.5) {
    penStroke = color(0, 255, 249);*/ 
    if(button (15,30,0,255,249)){
  penStroke = color(0, 255, 249);
  }
  // black ink
  /*fill(0); 
  stroke(0);
  strokeWeight(1);  
  ellipse(15, 45, 15, 15);
  if (mousePressed && dist(15, 45, mouseX, mouseY) < 8.5) {
    penStroke = color(0);*/
  if(button (15,45,0,0,0)){
  penStroke = color(0, 0, 0);  
  }
  //red ink
  /*fill(255, 0, 51);
  stroke(0); 
  strokeWeight(1); 
  ellipse(30, 15, 15, 15);
  if (mousePressed && dist(30, 15, mouseX, mouseY) < 8.5) {
    penStroke = color(255, 0, 51);*/
  if(button (30,15,255,0,51)){
  penStroke = color(255, 0, 51);  
  }
  //dark blue ink
  /*fill(4, 12, 147);
  strokeWeight(1); 
  ellipse(30, 30, 15, 15);
  if (mousePressed && dist(30, 30, mouseX, mouseY) < 8.5) {
    penStroke = color(4, 12, 147);*/
  if(button (30,30,4,12,147)){
  penStroke = color(4, 12, 147);  
  }
  //yellow ink
  /*fill(250, 255, 0);
  stroke(0);
  strokeWeight(1); 
  ellipse(30, 45, 15, 15);
  if (mousePressed && dist(30, 45, mouseX, mouseY) < 8.5) {
    penStroke = color(250, 255, 0);*/ 
  if(button (30,45,250,255,0)){
  penStroke = color(250, 255,0);  
  }
  //green ink
  /*fill(50, 201, 49); 
  stroke(0); 
  strokeWeight(1); 
  ellipse(30, 60, 15, 15);
  if (mousePressed && dist(30, 60, mouseX, mouseY) < 8.5) {
    penStroke = color(50, 201, 49);*/ 
  if(button (30,60,50, 201, 49)){
  penStroke = color(50, 201,49);  
  }
  //purple ink
  /*fill(84, 5, 175);
  stroke(0); 
  strokeWeight(1); 
  ellipse(15, 60, 15, 15);
  if (mousePressed && dist(15, 60, mouseX, mouseY) < 8.5) {
    penStroke = color(84, 5, 175);*/ 
 if(button (15,60,84,5,175)){
  penStroke = color(84, 5, 175);   
  }

 //labeling fill colors
 textFont(commands, 15); fill(0); text("fill color", 70, 90);
 
 // pink fill
  /*fill(242, 0, 255); 
  stroke(0); 
  strokeWeight(1); 
  ellipse(15, 90, 15, 15);
  if (mousePressed && dist(15, 90, mouseX, mouseY) < 8.5) {
    penFill = color(242, 0, 255);*/
 if(button (15,90,242,0,255)){
  penFill = color(242, 0, 255);   
  }
  // bright teal fill
  /*fill(0, 255, 249); 
  stroke(0); 
  strokeWeight(0); 
  ellipse(15, 105, 15, 15);
  if (mousePressed && dist(15, 30, mouseX, mouseY) < 8.5) {
    penFill = color(0, 255, 249);*/
 if(button (15,105,0,255,249)){
  penFill = color(0, 255,249);   
    
  }
  // black fill
  /*fill(0); 
  stroke(0);
  strokeWeight(1);  
  ellipse(15, 120, 15, 15);
  if (mousePressed && dist(15, 120, mouseX, mouseY) < 8.5) { 
    penFill = color(0);*/
 if(button (15,120,0,0,0)){
  penFill = color(0);   
  }
  //red fill
  /*fill(255, 0, 51);
  stroke(0); 
  strokeWeight(1); 
  ellipse(30, 90, 15, 15);
  if (mousePressed && dist(30, 15, mouseX, mouseY) < 8.5) {
    penFill = color(255, 0, 51);*/
if(button (30,90,255,0,51)){
  penFill = color(255, 0, 51); 
}  
  
  //dark blue fill
  /*fill(4, 12, 147);
  strokeWeight(1); 
  ellipse(30, 105, 15, 15);
  if (mousePressed && dist(30, 105, mouseX, mouseY) < 8.5) {
    penFill = color(4, 12, 147);*/
    if(button (30,105,4,12,147)){
  penFill = color(4, 12, 147);
  }
  //yellow fill
  //fill(250, 255, 0);
  //stroke(0);
  //strokeWeight(1); 
  //ellipse(30, 120, 15, 15);
  //if (mousePressed && dist(30, 120, mouseX, mouseY) < 8.5) { 
   // penFill = color(250, 255, 0);
   if(button (30,120,250, 255, 0)){
  penFill = color(250, 255, 0); 
  }
  //green fill
  /*fill(50, 201, 49); 
  stroke(0); 
  strokeWeight(1); 
  ellipse(30, 135, 15, 15);
  if (mousePressed && dist(30, 135, mouseX, mouseY) < 8.5) {   
    penFill = color(50, 201, 49);*/
    if(button (30,135,50,201,49)){
    penFill = color(50,201,49);
    }
  
  //purple fill
 /* fill(84, 5, 175);
  stroke(0); 
  strokeWeight(1); 
  ellipse(15, 135, 15, 15);
  if (mousePressed && dist(15, 135, mouseX, mouseY) < 8.5) { 
    penFill = color(84, 5, 175);*/
  if(button (15,135,84,5,175)){
  penFill = color(84, 5, 175);
  }  
  }
  
  boolean button (int buttX,int buttY, int buttR, int buttG, int buttB) {
  fill (buttR, buttG, buttB);
  stroke (0);
  strokeWeight (1);
  ellipse(buttX, buttY, 15, 15);
  boolean hit = false;
  if (mousePressed && dist (buttX, buttY, mouseX, mouseY)  < 10) hit = true;
  return (hit);
  }
  



