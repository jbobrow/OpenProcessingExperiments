
//Name: WOO Eunhye
//ID: 201420091
  

float angle=4;
    
void setup(){
  size(600,600);
  background(255);
  colorMode(RGB);
}
    
void draw(){
  noStroke();
  fill(255);
  rect(0,0,width/1,height/2);
    
 
  angle += 0.008;
    

  translate(width/2,height/2);
  scale(0.1);
  // number of scaled lines, and rect
  for (int i=0; i<width; i+=40){
    for (int j=0; j<height; j+=40){
      
    rotate(+angle);
      
    pushMatrix();
    stroke(0);  
    strokeWeight(i/90);
    fill(0);           
     
   rotate(angle*3);
    scale(1.65);
    stroke(255, 255, 255);
    ellipse(600, 600, 600, 600);  
    noStroke();
    rect(0,0,20,20);
    noFill();
    rect(30, 30 ,30 ,30);
   strokeWeight(10); 
  
  stroke(204,5,245); 
  
  fill(255,230,3); 
 popMatrix();   
    
    }
  }
  }

