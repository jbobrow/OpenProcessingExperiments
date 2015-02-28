
float rotate;
boolean clicked = false;

void setup(){
  size (300,300);
  background (166,166,166);
  noStroke();
}

void draw(){
  if (clicked == false){
    
   // rotate = 0.5;
  }
  if (clicked == true){
  // rotate = 0.45;
  }
  translate(150,150);


  //head shape
  fill(209,146,107);
  rect(-100,-100,200,200,0,0,50,50);
  
  //hair
  fill(15,255,231);
  rect(-100,-120,200,50,50,50,0,0);
  
  //hair extra
  triangle(-30,-95,-58,-40,-100,-70);
  
  //hair extra
  triangle(30,-95,58,-40,100,-70);
  
  //eye
  fill(255,255,255);
  ellipse(-30,-5,40,40);
  
  //eye2
  fill(255,255,255);
  ellipse(30,-5,40,40);
  
  //strap
  fill(15,255,231);
  rect(-60,-55.8,120,15);
  
  //pupil
  fill(0,0,0);
  ellipse(-30,-5,10,10);
  
  //pupil2
  fill(0,0,0);
  ellipse(30,-5,10,10);
  
  //eyebrow
  fill(15,255,231);
  rect(-55,-24.8,50,15,10,10,10,10);
  
  //eyebrow2
  fill(15,255,231);
  rect(6,-30,50,15,10,10,10,10);
  
  //nose
  fill(224,175,144);
  ellipse(0,10,40,30);
  
  //top lip
  fill(242,206,203);
  ellipse(0,30,30,5);
  
  //bottom lip
   fill(242,206,203);
   ellipse(0,33,30,5);
   
   
  
  
  

 
  
/*  
  //hair
  fill(79,40,16);
  pushMatrix();
  rotate(PI/rotate);
  arc(0, 0, 250, 200, 0, PI+QUARTER_PI, PIE);
  noStroke();
  popMatrix();
  */
}



