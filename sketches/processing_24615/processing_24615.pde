

int patternSeperationX = 100;  

int patternSeperationY = 100;  
  
   

void setup(){  

  size(500,500);  

     background(0,0,0);

 

     

  for(int i = 0; i < width/patternSeperationX; i++){  

      for(int j = 0; j < height/patternSeperationY; j++){  

        pushMatrix();  

        translate(i*patternSeperationX, j*patternSeperationY);  

        yourFunction();  

        popMatrix();  

      }  

  }  

     

}  

   

   

void draw()  

{  

  //This is here so the program keeps running and the screengrab will work  

}  

   

   

void yourFunction(){  

     

  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------  

  //try making pleasant designs :-)  
  
  smooth();
  noStroke();


  for(int x = 0; x < 600; x = x + 50){

    color from = color(24,5,247);
  color to = color(81,98,237);
  color intA = lerpColor(from,to,.2);
  color intB = lerpColor(from,to,.4);
  color intC = lerpColor(from,to,.6);
  color intD = lerpColor(from,to,.8);
  color intE = lerpColor(from,to,1);
  color intF = lerpColor(from,to,1.2);
  color intG = lerpColor(from,to,1.4);
  color intH = lerpColor(from,to,1.6);
  color intI = lerpColor(from,to,1.8);
  color intJ = lerpColor(from,to,2);

  noFill();





    
  fill(intA);
  triangle(x,x,x,50,50,50);
  fill(intB);
  triangle(x,50,0,100,50,50);
  fill(intC);
  triangle(x,100,50,50,50,100);
  fill(intD);
  triangle(50,50,50,100,100,100);
  fill(intE);
  triangle(50,50,100,50,100,100);
  fill(intF);
  triangle(50,50,100,0,100,50);
  fill(intG);
  triangle(50,0,50,50,100,0);
  fill(intH);
  triangle(0,0,50,0,50,50);
  
  colorMode(RGB, 100);
for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 100; j++) {
    stroke(i, j, 100);
    point(i, j);
  }
}
  }




}

