
//variables that will only appear once at the start
void setup(){
    //size of canvas(width, height)
  size(500,500);
}
//Variables tha will loop
void draw(){
  if(key=='q'){
 figure();
}else if(key=='w'){
  symmetry();
}else if(key=='e'){
closure();
}else{
}
}

void closure(){
  //color of background(red,green,blue)
  background(159,232,188);
 //color of object's outline (r,g,b variable changes with the mouse's movement along the x-axis)
  stroke(216,219,mouseX);
  //color of object(r,g,b variable changes with the mouse's movement along the x-axis)
  fill(216,219,mouseX);
  //creates a filled angle(x of center,y of center,width,height,0_arc up,radian,how to close the cirle)
  arc(250, 255, 200, 200,0,PI);
  //color of object's outline(r,g,b variable changes with the mouse's movement along the x-axis)
  stroke(216,219,mouseY);
  //color of object(r,g,b variable changes with the mouse's movement along the x-axis)
  fill(216,219,mouseY);
  //creates a filled angle(x of center,y of center,width,height,PI_arc down,radian,how to close the cirle)
  arc(250, 255, 200, 200,PI, TWO_PI);
//conditional statement for it mouse is pressed
if(mousePressed==true){
 //exception for whem the mouse is not pressed
}else{
  //color of object's outline(r,g,b)
  stroke(159,232,188);
  //color of object(r,g,b)
  fill(159,232,188);
  //Rectangle shape(x of top left corner, y of top left corner, width,height)
  rect(0,245,500,20);
}
}

  
void symmetry(){
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

  
void figure(){
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


