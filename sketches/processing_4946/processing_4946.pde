


Eye myEye;
Eye myOtherEye;
Eye myEye2;
Eye myEye3;



void setup(){
  size(600, 600);
  smooth();
  
  myEye = new Eye(300, 300);
  myOtherEye = new Eye(400, 300);
  myEye2 = new Eye(225, 200);
  myEye3 = new Eye(350, 250);
}

void draw(){
  background(254, 241, 97);
  
  stroke(255, 0, 0);
  strokeWeight(20);
  line(400, 400, 550, 550);
  line(400, 400, 100, 550);
  line(400, 400, 400, 550);
    
  
  strokeWeight(5);
  fill(0, 0, 255);
  ellipse(350, 300, 400, 400);
  
 
  
  myEye.draw();
  myOtherEye.draw();
  myEye2.draw();
  myEye3.draw();
}


class Eye {
  float x;
  float y;
  
  Eye(float init_x, float init_y){
    x = init_x;
    y = init_y;
  }  
  
  void draw(){
    pushMatrix();
    translate(x, y);
    
    stroke(0);
    fill(255);
    ellipse(0, 0, 100, 100);
    
    
    float angle = atan2(mouseY - y, mouseX - x);
    
    rotate(angle);
    translate(25, 0);
    fill(0, 255, 0);
    ellipse(0, 0, 50, 50);
    popMatrix();
    
  }

}








