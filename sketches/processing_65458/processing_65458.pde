
/*****************************

* Processing Illustration
*
* This sketch is an exercise in illustrating in processing
* + header _ description of the sketch
* + global variables - main variables of the sketch
* + setup - initialize sketch
* + draw - main function of sketch
*
* Sougwen Chung 06/2012

********************************/

void setup(){ 
  size (800,800);
  smooth();  


}

void draw( ){
//  background(255);

if (mousePressed){
  point(mouseX, mouseY);

  noFill();
  
  //testShape
  stroke(18,67,90, 50);
  bezier(mouseX, mouseY, 600, 400, 300, 300, 600 ,300);
  bezier(mouseX, mouseY,  580, 380, 280, 280, 600 ,300);
  stroke(255);
  ellipse(mouseX, mouseY, 10,10); 
}

/*  
  // first shape
  bezier(width/2, height/2, 600, 400, 300, 300, 600 ,300);
  bezier(width/2, height/2, 580, 380, 280, 280, 600 ,300);
  ellipse(width/2, width/2, 15, 15); 
  
  // 2nd shape
  bezier(width/2, height/2-40, 600, 400, 300, 300, 600 ,300);
  bezier(width/2, height/2-40, 580, 380, 280, 280, 600 ,300);
  ellipse(width/2, width/2-40, 15, 15); 

  // 3rd shape
  bezier(width/2, height/2-80, 600, 400, 300, 300, 600 ,300);
  bezier(width/2, height/2-80, 580, 380, 280, 280, 600 ,300);
  ellipse(width/2, width/2-80, 15, 15); 


  // 4rd shape
  bezier(width/2, height/2-100, 600, 400, 300, 300, 600 ,300);
  bezier(width/2, height/2-100, 580, 380, 280, 280, 600 ,300);
  ellipse(width/2, width/2-100, 15, 15); 

  // 5th shape
  bezier(width/2, height/2-120, 600, 400, 300, 300, 600 ,300);
  bezier(width/2, height/2-120, 580, 380, 280, 280, 600 ,300);
  ellipse(width/2, width/2-120, 15, 15);  
 
  // 6th shape
  bezier(width/2, height/2-140, 600, 400, 300, 300, 600 ,300);
  bezier(width/2, height/2-140, 580, 380, 280, 280, 600 ,300);
  ellipse(width/2, width/2-140, 15, 15); 

  // 7th shape
  bezier(width/2, height/2-160, 600, 400, 300, 300, 600 ,300);
  bezier(width/2, height/2-160, 580, 380, 280, 280, 600 ,300);
  ellipse(width/2, width/2-160, 15, 15);    
 
 */ 
  
}

