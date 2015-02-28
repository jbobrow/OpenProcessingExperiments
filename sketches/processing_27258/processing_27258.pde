
void setup() {
  size(200,200);
  background(255);
  smooth();
}

void draw() {
 background(255);
 
 //skeleton points
 stroke(0);
 //ellipse(0,0,5,5);
 ellipse(mouseX,mouseY,5,5);
 //ellipse(200,200,5,5);
 ellipse(100,100,5,5);
 
 //control points 
  float Xvalue = 180;
 float a = atan2(mouseY-height/2, mouseX-width/2); //mobile point for testing
  float b = a + 2*PI; //reverse the angle
  float opp = tan(b)*80; //find Y value as X is supplied (one value must be supplied, or hypotenuse)
  if(degrees(a) > -90 && degrees(a) < 90) { //deal with flipping
    Xvalue = 200 - Xvalue; //flip x value through the midpoint
    opp *= -1; //flip Y value negative
  }
  stroke(255,0,0);
  ellipse(Xvalue,opp+100,5,5); //Y value from centrepoint, end points of bezier
  
  bezier(0,0,50,10,mouseX,mouseY,100,100);
  stroke(0,255,0);
  bezier(100,100,Xvalue,opp+100,50,180,200,200);

 stroke(240);
 line(mouseX,mouseY,Xvalue,opp+100); //connector between control points
}

                
