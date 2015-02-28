
float theta = radians(60);

void setup() {
  size(600, 600);
  smooth();
  //noLoop();
}

void draw() {
 // frameRate(2);
 
  stroke(250,100,250);
   
  
  background(0);
  
  strokeWeight(2);
 translate(300,600);
  
  
  branch(100,13);

}


void branch(float len, float len2) {
  
  

  len *= 0.55 +random(.25);
  len2 *= 0.66;
    
     stroke(0,200,250);
  strokeWeight(len2);
  //rotate(180);
  line(0,0,0,-len);
  translate(0,-len);
 
  if (len > 1 && len2 >0) {
    strokeWeight(len2);
    pushMatrix();   
    rotate(0.6);
    strokeWeight(len2);
    stroke(162,104,76);
    line(0, 0, 0, -len);  
    translate(0, -len); 
    branch(len,len2);      
    popMatrix();    
       
    
 
    pushMatrix();
    rotate(-0.6-random(0.35));
    strokeWeight(len2);
    stroke(162,104,76);
    line(0, 0, 0, -len);
    translate(0, -len);
    branch(len,len2);
    popMatrix();
    
   
  

   

    pushMatrix();
    rotate(theta/2);
    branch(len*.75,len2);
    popMatrix();
    
     pushMatrix();
    rotate(20);
    stroke(len,200,200);
    branch(len*.50,len2);
    popMatrix();
    
    pushMatrix();
    rotate(-theta);
    stroke(len,2,2);
    branch(len*.20,len2);
    popMatrix();
    
  }
}
