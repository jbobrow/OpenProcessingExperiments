
float theta = 0;
int MaxDepth = 3;




void setup(){
    frameRate(800);
    size(600,600);
    background(0);
   
}
void draw(){
  theta += 1.5;

     
  
  stroke(255);
  strokeWeight(4);
   fill(255,0,0,63);
  triangle(100, 60, 500, 60, 299, 500);
  fill(250, 218, 237, 200);
  triangle(230, 500, 370, 500, 299, 600);
  pushMatrix();
  popMatrix();
  strokeCap(ROUND);
  stroke(128);
  line(500, 60, 100, 550);//right line
  stroke(128);
  line(100, 60, 500, 550);//left line
  stroke(0);
  

  pushMatrix();
  fill(159,241, 250);
  translate(100, 550);
  stroke(0);
  strokeWeight(2);
  rotate(radians(theta));
  rect(0,0,40,40);
  popMatrix();
  
  pushMatrix();
  fill(159,241, 250);
  translate(500, 550);
  rotate(radians(theta));
  rect(0,0,40,40);
  //theta+= (0.1);
  popMatrix();  
  
  pushMatrix();
  fill(143, 98, 222, 210);
  translate(400,300);
  rotate(radians(theta));
  ellipse(200, 200, 400, 400);
  popMatrix();
  
  
  pushMatrix();
  fill(230, 234, 234,200);
  translate(300,200);
  rotate(radians(theta*80));
  ellipse(100, 100, 300, 300);
  popMatrix();
  
  
  
  pushMatrix();
  fill(52, 234, 175);
  stroke(255);
  translate(300, 300);
  rotate(PI*theta);
  ellipse(50, 50, 100, 100);
  popMatrix();
  
  
  
}


//pushMatrix();
//translate();
//rotate();
//drawShape();
//popMatrix();
  





  

 
 

  


  
  



  
  


  





