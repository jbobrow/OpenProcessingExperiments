
float xmag, ymag = 0;
float newXmag, newYmag = 0; 

void setup(){
  
size(640, 360, P3D);
background(0); 
noStroke(); 
smooth();
lights();

}

void draw(){
background(0);
drawBoxes();
}

void drawBoxes(){
int gridSize = 40;

for (int x = gridSize; x <= width - gridSize; x += gridSize) {
  for (int y = gridSize; y <= height - gridSize; y += gridSize) {
    /*noStroke();
    fill(255);
    rect(x-1, y-1, 3, 3);
    stroke(255, 50);
    line(x, y, width/2, height/2);*/
    
   
    
    
/*pushMatrix();
fill(random(0,255),random(0,255), random(0,255));
translate(x-1, y-1, 3);
rotateY(1.25);
rotateX(-0.4);
box(20);
stroke(255, 50);
popMatrix();*/


/*pushMatrix();
noFill();
stroke(255, 50);
translate(x-1, y-1, 3);
rotateY(1.25);
rotateX(-0.4);
sphere(20);
popMatrix();*/

pushMatrix();

fill(random(0,255),random(0,255), random(0,255));
translate(x-1, y-1, 3);

float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { 
    xmag -= diff/4.0; 
  }
  
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { 
    ymag -= diff/4.0; 
  }

newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;
  
  rotateX(-ymag); 
  rotateY(-xmag); 
  
  //rotateX(-ymag *random(255)); 
 // rotateY(-xmag * random(255)); 
  
//rotate(frameCount / 100.0);
//rotateY(frameCount / 100.0);
//rotateX(frameCount / 100.0);
box(20);
stroke(255, 50);
popMatrix();

     
   }
 }
}
