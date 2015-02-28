
//P1M1


void setup(){
  size(500, 100);

}

void draw(){
  background(255);
  for(int i =0; i <500; i= i+100){
    pushMatrix();
    translate(i+5, 30);
    //shape
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
    
    pushMatrix();
    translate(i+93, 30);
    //rotate(radians(180));
    //shape
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
  }
  
}

