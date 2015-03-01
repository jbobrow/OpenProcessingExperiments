
//variables that will only appear once at the start
void setup(){
  //size of canvas(width, height)
  size(500,500);
}
//Variables tha will loop
void draw(){
  //color of the background(red,green,blue)
  background(255,255,255);
  //color of object(r,g variable is the x coordinate of the mouse divided by 3,
  //b variable is the x coordinate of the mouse divided by 3,transparency)
  fill(245,mouseX/3,mouseX/3,40);
  //color of object's outline(r,g,b)
  stroke(255,255,255);
  //Rectangle shape(x coordinate is the x coordinate of the mouse,y is the y coodinate of the mouse, 
  //the width is the number of mouse on the x-axis, the height is the number of mouse of the x-axis)
  rect(mouseX,mouseY,mouseX,mouseX);
  //color of object(r,g variable is the x coordinate of the mouse divided by 3,
  //b variable is the x coordinate of the mouse divided by 3,transparency)
  fill(245,mouseX/3,mouseX/3,40);
   //color of object's outline(r,g,b)
  stroke(255,255,255);
  //Rectangle shape(x coordinate is the y coordinate of the mouse,y is the x coodinate of the mouse, 
  //the width is the number of mouse on the x-axis, the height is the number of mouse of the x-axis)
  rect(mouseY,mouseX,mouseX,mouseX);
}


