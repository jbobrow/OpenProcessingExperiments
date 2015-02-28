
//transformations
size(400,400);

//translate
//translate(100,100);

//rotate in radians
//rotate(1.0);

//scale
//scale(1.0);

//rect(0,0,200,150);

//pushMatrix();
//From processing website
//http://processing.org.reference.popmatrix_.html

//white rect
fill(255);
rect(0,0,50,50);

//blue rect
pushMatrix();  //the stuff between the pushMatrix and the popMatrix does not apply to the stuff outside
translate(60,60);
fill(0,0,200,60);
rect(0,0,50,50);
popMatrix();

//grey rect
fill(100);
rect(15,10,50,50);
