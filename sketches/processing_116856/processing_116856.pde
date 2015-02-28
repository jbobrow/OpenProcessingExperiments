
//float starSize = mouseX;
float[] starFill = {0, 50, 100};
float starScale = 1;
void setup() {
 size (500, 500); 
 background (51);
 
}


void draw() {
 
// star(50,50);
// star(200,200); 
scale(starScale);
 if (mousePressed) {
  star(mouseX, mouseY);
}
else {
  starScale = 1;
  background(51);
}
 
 for(int i = 0; i < width; i++ ) {
   
   star(i*100+50, 250);
  }
 

}

void star(float x, float y) {
fill(starFill[0], starFill[1], starFill[2]);
stroke(255);
strokeWeight(2);


beginShape();
vertex(x, y-50);
vertex(x+14, y-20);
vertex(x+47, y-15);
vertex(x+23, y+7);
vertex(x+29, y+40);
vertex(x, y+25);
vertex(x-29, y+40);
vertex(x-23, y+7);
vertex(x-47, y-15);
vertex(x-14, y-20);
endShape(CLOSE);
}

void mouseDragged(){
 starFill[0] = random(0, 255);
 starFill[1] = random(0, 255);
 starFill[2] = random(0, 255);
 starScale = starScale*1.001; 
}






