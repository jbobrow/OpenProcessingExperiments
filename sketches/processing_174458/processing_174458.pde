
int value = 0;//This is the starting colour of the circle which is black, Once key pressed the black will never come back

void setup() {
  background(50); // this makes the background black
  size(600,600);//Size is the size you want the screen
}
void draw() {
 
 
  line(300,300, random(300), random(750) );//This is the location of the lines
  stroke(#F71121);//This makes the colour of the lines
  frameRate(30);//This makes the speed of everything

  line(300,300, random(300,600), random(0,600) );//This is the location of the lines, This is the blue line
  stroke(#1B2AC1);//This makes the colour of the lines  
 
 
  if (keyPressed == true) {//This is so when you press a key and hold it the object will fade away but if it's set on "false" then it will fade away by it self and you need to press a button so it fade again by itseft
fill(random(0,255),50);
} else {
fill(value);//Circle in the middle
  ellipse(300,300,50,50);
}
 
  fill(10,10);//fill for rect
  rect(0,0, height, width);//The red ine around the screen

  fill(#F71121);
  ellipse(random(300), random(750), 30, 30);//The random height and width makes it o
  
  
  fill(0, 10);//Fill for the rect
  rect(0, 0, height, width);//The line around the "size"
  
  fill(#1B2AC1);//This is the fill, the fill colours in the circle/ellipse
  ellipse(random(300,600), random(0,600), 30, 30);//This is the tiny circles around the screen
}

void keyPressed() {
  if (value == #1B2AC1) {//This is the first value after any key is pressed and the colour is blue
    value = #F71121;//Once you press any button again it will change to the colour I selected which is red
  } else {
value = #1B2AC1;//Now this is what makes the colour button loop and what I mean by that is that. This button makes the red and blue switch bewteen eachother  
  }
}




