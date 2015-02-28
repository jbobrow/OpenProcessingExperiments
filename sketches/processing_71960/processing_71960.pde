
//line drawing 01b
//Ashley Reid
//9/10/12
//Section A

int randomDiameter = 0;
float strokeGray = 0;

void setup() {
  size(1200,600);
  background(98,222,87);
    
      
}

void draw() {
  
    rect(mouseX, mouseY, 100-mouseY, randomDiameter);
  randomDiameter = (int)(random(tan(mouseX), mouseX^7));
  fill(255,10);
  
  if(randomDiameter < 100) { 
    randomDiameter++;
  }
  else{
    randomDiameter = 0;
  }
 

 if (mousePressed) {
      background(226,193,245);
 }
 
 if (keyPressed) {
   fill(250,159,230);
   ellipse(mouseX, mouseY, randomDiameter, randomDiameter);
    }
    

if (keyPressed) {
  beginShape();
  vertex(500,350);
  bezierVertex(mouseX+80, mouseY, mouseX+80, mouseY+75, mouseX+30, mouseY+75);
  bezierVertex(mouseX+50, mouseY+80, mouseX+60, mouseY+25, mouseX+30, mouseY+20);
  fill(244,250,159);
  endShape();
}
  

fill(140, 80);
strokeWeight(2.5);
stroke(strokeGray);
}

 void mouseClicked() {
  if(strokeGray==0){
    strokeGray=255;
  }
  else{
    strokeGray=0;
  }

 }
