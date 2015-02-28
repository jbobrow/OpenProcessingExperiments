
//PMG2

void setup(){
  size(500, 100);
 
}
 
void draw(){
  background(255);
  stroke(0);
  strokeWeight(5);
  //line(0, 48, 500, 48);
  //line(0, 98, 500, 98);
  for(int i =0; i <500; i= i+200){
    //upper-left
    pushMatrix();
    translate(i+5, 30);
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
    
    //lower-left
    pushMatrix();
    translate(i+105, 70);
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
    
    //upper-right 
    pushMatrix();
    translate(i+93, 30);
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
    
    //lower-right
    pushMatrix();
    translate(i+195, 70);
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


