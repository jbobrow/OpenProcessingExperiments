
	//---Define class variables here---
class StreetLight {
  float x1,y1,x2,y2,x3,y3,x4,y4,h1;	

boolean on;

 // constructor
   StreetLight(float tx, float ty, float th) {
		//---define your constructor and initial values here---   
x1 = tx;
y1 = ty;
h1=th;

		on = false;
   }

 boolean isOn() {
   return on;
   }

 void turnOn() {
   on = true;
   
   }

 void turnOff() {
   on = false;
   }

 void display() {
   drawLight();
   }

 void drawLight() {

 	// draw the street light here
 smooth ();
noStroke ();
 //lampost
 fill (62,58,58);
 rect (x1,y1+12,15,h1/-2);
  //lampshade
  if (on==true) {
  fill (255);
  ellipse (x1+5,(y1+12)+(h1/-2),40,h1/-10);
 
  } else { 
    fill (0);
 ellipse (x1+5,(y1+12)+(h1/-2),40,h1/-10);
 
  }
 }

} // end of class StreetLight
 

