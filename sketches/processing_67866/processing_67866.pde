
void setup(){
  size(400,400);  
  noFill();
  smooth();
}

void draw(){
  int rx = 120;
  int ry = 40;
int r = 0;
int r2 = 0;
 background(255,255,255);
stroke(0,0,255);
strokeWeight(3);
ellipse(20, 40, 40, 40);

noFill();
stroke(0,0,0);
strokeWeight(3);
ellipse(70, 40, 40, 40);

noFill();
stroke(255,0,0);
strokeWeight(3);
if(r!=rx && r2!=ry)
  {
    r = int ( random(0,399));
    r2 = int (random(0,399));  
   }
else 
 { 
   r = rx;
   r2=ry;
 }
 ellipse(r, r2, 40, 40);
  
noFill();
stroke(255,255,0);
strokeWeight(3);
ellipse(45, 60, 40, 40);

noFill();
stroke(0,255,0);
strokeWeight(3);
ellipse(95, 60, 40, 40);
}

