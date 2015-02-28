
void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{

  //Ziffern (= Wimpern)
  translate(width/2, height/2); 
  for (int i=0; i<360; i+=6) {  
    pushMatrix();
    stroke(0);
    rotate(radians(i));
    line(0, 0, 0, 110);
    popMatrix();

    
    // Augapfel
    fill(0);
    ellipse(0, 0, 50, 50);
    background(255);
    stroke(0);
    fill(255);
    ellipse(0, 0, 150, 150);
    
    
    //Iris & Pupille
    float sec = map(second(), 0, 60, 0, 360);
    pushMatrix();
    rotate(radians(sec));
    fill(#1F49C1);
    ellipse(0, -30, 60, 60);
    fill(0);
    ellipse(0, -45, 20, 20);
    popMatrix();
  }

//Körper
{int h = hour()*4; 
  fill(#6A100C); 
  stroke(0);
  triangle(-240,135,-100,135,-230,0); 
  ellipse(-115, 135, 250, -h);
  
 

//Schnabel
  {int min = minute()*4; 
  fill(#F2E22C); 
  stroke(0); 
  triangle(0,90,min,140,0,140);
  triangle(0,140,min,140,0,175); 
  } 



  
 
  
}
  //Fliege (= Sekundenzeiger)
  float sec = map(second(), 0, 60, 0, 360);
  pushMatrix();
  rotate(radians(sec));
  stroke(0);
  fill(0);
  ellipse(0, -170, 40, 40);
  stroke(0);
  fill(255);
  ellipse(0, -200, 20, 40);
  ellipse(0, -140, 20, 40);
  popMatrix();
 
  




 }



