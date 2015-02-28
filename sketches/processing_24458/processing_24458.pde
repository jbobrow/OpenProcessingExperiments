
float lineOne = random(0,80);
float lineOneA = random(0,80);
 
 void setup(){
  
  size (500,500);
  strokeWeight(1);
  background(255);
  smooth();
 }

void draw(){


line(lineOne,0,lineOneA,height);
line(lineOne+random(-10,10),0,lineOneA+random(-10,10),height);

lineOne = lineOne+100;
lineOneA = lineOneA+100;
    

}


