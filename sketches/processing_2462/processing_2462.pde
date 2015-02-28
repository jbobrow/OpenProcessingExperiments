
/*based on a01_efong*/

boolean isDrawing = false;

void setup() {
    size (1000,1000);
    background(234, 204, 117);
    smooth();
}

void draw(){
 if (isDrawing){ 
 
  stroke(255, 0,0);
  fill(0,0,255);  
  ellipse(mouseX, mouseY, mouseX + random(0,1), mouseY + random(0,1));
 
 }
};

void mousePressed() {
  isDrawing = !isDrawing;
};

