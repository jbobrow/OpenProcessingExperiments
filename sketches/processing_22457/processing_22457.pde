
//Week 5 coded by Chen^2
//1337399


void setup(){
  
  size(500,500);
  smooth();
  
  noStroke();

}
 
void draw(){
  
  background(0);
  translate(width/2, height/2);
    
    for(int i = 0; i < 10; i++){
     
      rotate(radians(36));
      
      pushMatrix();
      
       
      for(int k = 0; k < 340; k += 40){
      
      fill(80, 80, 255);
      
      beginShape();
      
      curveVertex(100,100);
      curveVertex(150, 110);
      curveVertex(110, 110);
//      curveVertex(10, 10);
      curveVertex(100, 100);
      
      endShape();
      
      beginShape();
      
      curveVertex(1100,1100);
      curveVertex(110, 110);
      curveVertex(110, 150);
      curveVertex(100, 100);
      
      endShape();
        
      }
      
      popMatrix();
      
      pushMatrix();
      
      for(int k = 0; k < 340; k += 40){
      
      fill(80, 80, 255);
      
      beginShape();
      
      fill(random(255), random(255), random(255));
      curveVertex(1100,1100);
      curveVertex(150, 110);
      curveVertex(110, 110);
      curveVertex(1100, 1100);
      
      endShape();
      
      beginShape();
      
      fill(random(255), random(255), random(255));
      curveVertex(1100,1100);
      curveVertex(110, 110);
      curveVertex(110, 150);
      curveVertex(1100, 1100);
      
      endShape();
        
      }
      
      popMatrix();
      
      fill(133, 739, 9, 80);
      arc(0, 0, 50, 50, 0, TWO_PI);
      
    }
  
  println(mouseX);
  println(mouseY);
}


