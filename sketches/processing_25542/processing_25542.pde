


 
void setup(){
  size(350,700);
  smooth();


  
  
}
 
 
  void draw(){
  background(0);

  stroke(#763E01);

  for(float i = 2; i < 90; i ++){
    pushMatrix();
     
    noFill();
    translate(50, 70);
    scale(5,5);
     rotate(radians(i*4));
    ellipse(0,0,100,50);
    popMatrix();
  }


 stroke(#5F4600);
  for(float i = 2; i < 90; i ++){
    pushMatrix();
     
    noFill();
    translate(50, 70);
    scale(4,4);
     rotate(radians(i*6));
    ellipse(0,0,100,50);
    popMatrix();
  }
      

  
 
stroke(#97EA6B);
  for(float i = 2; i < 90; i ++){
    pushMatrix();
    strokeWeight(0.2); 
    noFill();
    translate(50, 650);
    scale(2,2);
     rotate(radians(i*5));
 
    arc(50, 55, 50, 50, 0, PI/2);
noFill();
arc(50, 55, 60, 60, PI/2, PI);
arc(50, 55, 70, 70, PI, TWO_PI-PI/2);
arc(50, 55, 80, 80, TWO_PI-PI/2, TWO_PI);
    popMatrix();
  
    }
   
   
  
 
stroke(#11902E);
  for(float i = 2; i < 90; i ++){
    pushMatrix();
    strokeWeight(0.2); 
    noFill();
    translate(50, 650);
    scale(1.5,1.5);
     rotate(radians(i*5));
 
    arc(50, 55, 50, 50, 0, PI/2);
noFill();
arc(50, 55, 60, 60, PI/2, PI);
arc(50, 55, 70, 70, PI, TWO_PI-PI/2);
arc(50, 55, 80, 80, TWO_PI-PI/2, TWO_PI);
    popMatrix();
  
    }
   
 stroke(#11902E);
  for(float i = 0; i < 20; i ++){
    pushMatrix();
     
    noFill();
    translate(350,400);
    scale(2.5,2.5);
     rotate(radians(i*12));
    ellipse(0,0,120,20);
    popMatrix();
  
  }



 stroke(#714B21);
  for(float i = 0; i < 20; i ++){
    pushMatrix();
     
    noFill();
    translate(350,400);
    scale(2,2);
     rotate(radians(i*10));
    ellipse(0,0,120,20);
    popMatrix();
  
  }


  }


