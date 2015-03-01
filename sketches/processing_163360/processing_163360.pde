
int butX = 25;
int butY = 875;
int butX2 = 125;
int butY2 = 975;
boolean on = false;
 
void setup() {
  size(1000,1000);
  background(79,68,9);
  fill(175);
  rect(50,50,900,800);
  noStroke();
  
}
 
void draw() {
  if (on) {
    {
   smooth();
   if (mousePressed) {
     fill(255); 
     rect(50,50,112.5,800);
     
     fill(234,255,0); 
     rect(162.5,50,112.5,800);
     
     fill(0,255,242);
     rect(275,50,112.5,800);
     
     fill(0,255,51);
     rect(387.5,50,112.5,800);
     
     fill(255,0,204);
     rect(500,50,112.5,800);
     
     fill(255,0,0);
     rect(612.5,50,112.5,800);
     
     fill(0,0,255);
     rect(725,50,112.5,800);
     
     fill(0);
     rect(837.5,50,112.5,800);
   }
    }
    
  } else {
    fill(175);
  rect(50,50,900,800);
  }
  fill(0);
  rect(25,875,100,100);
  
}
 
void mousePressed() {
  if (mouseX > butX && mouseX < butX + butX2 && mouseY > butY && mouseY < butY + butY2) {
    on= !on;
    fill(0);
  }
}
 
void mouseReleased() {
  fill(0);
}

