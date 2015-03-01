
//variables that will only appear once at the start
void setup(){
  //Size of canvas(width,height)
  size(500,500);
}
//variables that will loop 
void draw(){
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


