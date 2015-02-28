
int cols = 6;
int rows = 6;
Flower[][] flowers = new Flower[cols][rows];

void setup(){
  size(500, 500);
  
  for  (int i = 0; i < cols; i++) { 
    for  (int j = 0; j < rows; j++) { 
      flowers[i][j] = new Flower(i * 100, j * 100); 
    }
  } 
}


void draw(){
  //scale((float) mouseY / 400 );
  background(255);
 
 
  for  (int i = 0; i < cols; i++) { 
    for  (int j = 0; j < rows; j++) { 
      flowers[i][j].display();
      fill(0, 0, 255, 128);
      stroke(213, 23, 245, 128);
      //ellipse(50 + 100 * i, 50 + 100 * j, random(5, 10), random(5, 10));
      ellipse(50 + 100 * i, 50 + 100 * j, mouseX/10, mouseY/10);

    }
  }
}

class Flower {
  
  float xPos;
  float yPos;
  
  Flower(float x, float y) {
    xPos = x;
    yPos = y;
  }
 
  void display() {
    pushMatrix();
    translate(xPos, yPos);
     
    //translate(width/2,height/2);
    rotate( (float) mouseX / 400 * PI * 2 );
    //scale(0.5 + (float)  mouseY / 1000 );
     scale((float) (0.2 +  50 / sqrt(sq(xPos - mouseX) + sq(yPos - mouseY))));
  
    stroke(240, 7, 131, 100);
    strokeWeight(random(2, 5)); 
     fill(mouseX/2, 43, mouseY/2, mouseX/2 - 30);
    
    for(int i = 0; i < 8 ; i++) { 
        rotate(i * 3*PI/4); 
         pushMatrix();  
         beginShape();
         curveVertex(mouseX/2, -50);
         
         curveVertex(0, 0);
         curveVertex(0, 80);
         curveVertex(100, mouseX/2);
         endShape();
        
         beginShape();
         curveVertex(-(mouseY/2), -50);
         curveVertex(0, 0);
         curveVertex(0, 80);
         curveVertex(-100, mouseY/2);
         endShape();
         popMatrix();
    }
    popMatrix();
  } 
  
  void keyPressed() {
  if (key == 's') {
    save("frame" + frameCount + ".png");
  }
}
}

