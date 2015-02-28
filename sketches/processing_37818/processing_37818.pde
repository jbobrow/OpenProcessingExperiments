
//variation of rectangles rotating in twice about the origin

void setup(){
  size(400,400);
  background(255);
  stroke(190,0,190,10);
 
}

int f = 100;                       //first variable
int s = 100;                       //second variable

void draw(){
  noFill();
  
  pushMatrix();
    translate(275,height/2);      //move the center to create asymmetry
    rotate(radians(f));           //first rotation    
    translate(100,150);           
    rotate(radians(s + 45));      //second rotation
    fill(0,random(100),random(300), 10);

    rect(10,10,random(100), random(100));  

  popMatrix();
  
  
  s+=8;
  f++;

}




