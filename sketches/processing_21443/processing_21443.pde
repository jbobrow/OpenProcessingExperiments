
//PMM2


void setup(){
  size(500, 100);

}

void draw(){
  background(255);
  smooth();
  for(int i =0; i <500; i= i+100){
    //lower-left
    pushMatrix();
    translate(i+5, 55);
    stroke(0);
    strokeWeight(4);
    beginShape();
    vertex(45, 20); 
    vertex(40, 20);
    vertex(40, 0);
    vertex(0, 0);
    vertex(0, 40);
    vertex(32, 40);
    vertex(32, 10);
    vertex(8, 10);
    vertex(8, 30);
    vertex(24, 30);
    vertex(24, 20);
    vertex(16, 20);   
    endShape();    
    popMatrix();
    
    //lower-right
    pushMatrix();
    translate(i+90, 55);
    stroke(0);
    strokeWeight(4);
    beginShape();
    vertex(-45, 20); 
    vertex(-40, 20);
    vertex(-40, 0);
    vertex(0, 0);
    vertex(0, 40);
    vertex(-32, 40);
    vertex(-32, 10);
    vertex(-8, 10);
    vertex(-8, 30);
    vertex(-24, 30);
    vertex(-24, 20);
    vertex(-16, 20);   
    endShape();    
    popMatrix();
    
    //upper-left
    pushMatrix();
    translate(i+5, 45);
    stroke(0);
    strokeWeight(4);
    beginShape();
    vertex(45, -20); 
    vertex(40, -20);
    vertex(40, 0);
    vertex(0, 0);
    vertex(0, -40);
    vertex(32, -40);
    vertex(32, -10);
    vertex(8, -10);
    vertex(8, -30);
    vertex(24, -30);
    vertex(24, -20);
    vertex(16, -20);   
    endShape();    
    popMatrix();
    
    //upper-left
    pushMatrix();
    translate(i+90, 45);
    stroke(0);
    strokeWeight(4);
    beginShape();
    vertex(-45, -20); 
    vertex(-40, -20);
    vertex(-40, 0);
    vertex(0, 0);
    vertex(0, -40);
    vertex(-32, -40);
    vertex(-32, -10);
    vertex(-8, -10);
    vertex(-8, -30);
    vertex(-24, -30);
    vertex(-24, -20);
    vertex(-16, -20);   
    endShape();    
    popMatrix();

  }
  
}

