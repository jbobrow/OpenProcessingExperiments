
float boxStartX;
float boxStartY;
int boxSize = 25;
boolean overBox = false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 

PFont f;

void setup() 
{
  size(700, 700);
  boxStartX = width/2.0;
  boxStartY = height/2.0;
  rectMode(RADIUS); 
  
  //Create Font
  println(PFont.list());
  f = createFont("Halvetica", 18);
  textFont(f);
   
}

void draw() 
{ 
  background(#F4FAC7);
  stroke(#7BAD8D);
  //line(height/2,0, height/2, width);
  line(0,width/2, height,width/2); 
  fill(#C2454E);
  text("Mentor", 50, 370);
  text("Writer", 330, 370);
  text("Tech savvy", 550, 370);
  fill(#F77F45);
  text("Elaine Main", 370, 650);
  text("Mentor Girls Write Now", 370, 670);
  
  // Test if the cursor is over the box 
  if (mouseX > boxStartX-boxSize && mouseX < boxStartX+boxSize && 
      mouseY > boxStartY-boxSize && mouseY < boxStartY+boxSize) {
    overBox = true;  
    if(!locked) { 
      stroke(255); 
      fill(153);
    } 
  } else {
    stroke(153);
    fill(153);
    overBox = false;
  }
  // Draw the box
  //rect(boxStartX, boxStartY, boxSize, boxSize);
  
  // Test if the cursor is over the titels Writer
  if (mouseX > 233 && mouseX < 466 && 
      mouseY > 233 && mouseY <466) { 
    if(!overBox) { 
      fill(#F77F45);
      rect(140,80,30,30);
      text("Narrative Badge", 80, 130);
      fill(#C2454E);
      ellipse(390,90,50,50);
      text("Editor Badge", 340, 130);
    } 
  } else {
    stroke(153);
    fill(153);
}
// Test if the cursor is over the titels Mentor
  if (mouseX > 0 && mouseX < 233 && 
      mouseY > 233 && mouseY <466) { 
    if(!overBox) { 
      fill(#7BAD8D);
      ellipse(220,150,50,50);
      text("Mega Mentor Badge", 140, 200);
      fill(#FFB158);
      rect(420,150,50,50);
      text("Smart Learner Badge", 330, 230);
    } 
  } else {
    stroke(153);
    fill(153);
}
// Test if the cursor is over the titels TechSavvy
  if (mouseX > 466 && mouseX < 700 && 
      mouseY > 233 && mouseY <466) { 
    if(!overBox) { 
      fill(#F77F45);
      rect(600,250,30,30);
      text("E - Book Advanced", 520, 300);
      fill(#7BAD8D);
      ellipse(300,200,40,50);
      text("Indesign", 270, 250);
    } 
  } else {
    stroke(153);
    fill(153);
}
}
void mousePressed() {
  if(overBox) { 
    locked = true; 
    fill(255, 255, 255);
  } else {
    locked = false;
  }
  xOffset = mouseX-boxStartX; 
  yOffset = mouseY-boxStartY; 
  
}

void mouseDragged() {
  if(locked) {
    boxStartX = mouseX-xOffset; 
    boxStartY = mouseY-yOffset; 
  }
}

void mouseReleased() {
  locked = false;
}
