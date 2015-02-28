
int patternSeperationX = 15;
int patternSeperationY = 15;

  void setup(){
  size(500,500);
  background(0);
  
       
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
    
}

void yourFunction(){
 
 stroke(255,255,255,random(10));
strokeWeight(0.8);
line(0,7,0,500);
 
  fill(51,114,127,random(128));
 noStroke();
 smooth();
 ellipse(5,5,10,10);
 
 stroke(0,0,0,random(128));
strokeWeight(0.5);
line(0,0,500,0);
 
 fill(90,121,127,random(20));
 noStroke();
 smooth();
 ellipse(20,20,50,50);
 
 fill(0,0,0,random(60));
 noStroke();
 smooth();
 ellipse(20,20,10,10);
 
 fill(255,255,255,random(10));
 noStroke();
 smooth();
 ellipse(5,5,40,40);

stroke(255,255,255,random(10));
strokeWeight(0.5);
line(0,5,0,500);

fill(0,0,0,random(40));
noStroke();
smooth();
ellipse(10,10,20,20);


fill(103,227,255,random(150));
noStroke();
smooth();
ellipse(10,10,15,15);



}

