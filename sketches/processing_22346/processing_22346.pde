
//Week 5 coded by Chen^2
//1337399


void setup(){
  
  size(500,500);
  smooth();
  
  strokeWeight(.8);

}
 
void draw(){
  
  background(0);
  translate(width/2, height/2);
    
    for(int i = 0; i < 6; i++){
     
      rotate(radians(60));
      
      pushMatrix();
      
      for(int j = 0; j < 120; j+= 20){
      
      fill(255, 80 , 80);
      ellipse(30, 30, 10, 10);
      ellipse(50, 50, 10, 10);
      ellipse(70, 70, 10, 10);
      ellipse(90, 90, 10, 10);
      
      }
       
      for(int k = 0; k < 340; k += 40){
      
      fill(80, 80, 255);
      
      beginShape();
      curveVertex(0,0);
      curveVertex(10, 50);
      curveVertex(50, 80);
      curveVertex(80, 100);
      endShape();
      
      beginShape();
      curveVertex(0,0);
      curveVertex(10, 20);
      curveVertex(48, 80);
      curveVertex(80, 100);
      endShape();
      
      beginShape();
      curveVertex(0,0);
      curveVertex(10, 52);
      curveVertex(0, 10);
      curveVertex(100, 100);

      endShape();
        
      }
      
      popMatrix();
      
      fill(133, 739, 9);
      arc(0, 0, 50,50, 0, TWO_PI);
      
    }
  
  println(mouseX);
  println(mouseY);
}


