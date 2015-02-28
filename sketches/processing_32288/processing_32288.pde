
//Variables setup:  
 int SepA = 100;
 int SepB =100;
//Variables draw/myFunction:
//int L;
//int E;
   
void setup(){
  
  size(500, 1000);
  background(0);
  
  //stroke(255);
  noStroke();
  smooth();
  strokeWeight(1);
  //noFill();
  fill(73,74,75,150);
  
  for(int D = 0; D < width/SepA; D++){
      for(int F = 0; F < height/SepB; F++){
        pushMatrix();
        translate(D*SepA, F*SepB);
        myFunction();
        popMatrix();
      }
  }
 
}

void myFunction(){


 triangle(10,55, 38, 10, 66, 55);
 triangle(40,85, 68, 30, 96, 85);
 triangle(60,105,88,50,116,105);
 triangle(80,125,108,70,126,125);

 
}

