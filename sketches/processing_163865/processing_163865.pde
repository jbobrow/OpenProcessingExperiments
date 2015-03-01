
//variables that will only appear once at the start
void setup(){
    //size of canvas(width, height)
  size(500,500);
}
//Variables tha will loop
void draw(){
  //color of the background(red,green,blue)
  background(19,219,229);
 //Rectangle shape(x coordinate of top left corner is the x coordinate of the mouse,y coordinate of top left corner, 
  //width,height)
  rect(mouseX,0,500,100);
   //Rectangle shape(x coordinate of top left corner is the x coordinate of the mouse,y coordinate of top left corner, 
  //width,height)
  rect(mouseX,200,500,100);
   //Rectangle shape(x coordinate of top left corner is the x coordinate of the mouse,y coordinate of top left corner, 
  //width,height)
  rect(mouseX,400,500,100);
  //color of object's outline(r,g,b)
  stroke(211,55,84);
  //color of object(r,g,b)
  fill(211,55,84);
  //Rectangle shape(x coordinate of top left corner is the x coordinate of the mouse minus 500,y coordinate of top left corner, 
  //width,height)
  rect(mouseX-500,100,500,100);
  //color of object's outline(r,g,b)
  stroke(211,55,84);
  //color of object(r,g,b)
  fill(211,55,84);
   //Rectangle shape(x coordinate of top left corner is the x coordinate of the mouse minus 500,y coordinate of top left corner, 
  //width,height)
  rect(mouseX-500,300,500,100);
}


