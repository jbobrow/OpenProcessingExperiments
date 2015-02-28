
float time = 0; /* This is going to function as a clock. We'll update it with a value every time a frame gets drawn*/
 
void setup() {
size(512,512);/* setup the size */
frameRate(25);/* This sets the current frameRate */
}
 
void draw() {/* this does the drawing once per frame */
  background(255); /* clear the screen with white */
  translate((width*0.5)+tan(time),(height*0.5)+(1/tan(time))); 
  noFill(); /*stop the computer filling in shapes*/
  time=time+0.01; /* update the value in the variable 'time'. This means that we add 1 to 'time' every frame */
  background(abs(sin(time))*255);
  for (int i = 0;i < 20; i++) { /* this for loop organises the drawing. It will do the drawing 20 times (between 0 and 19)  */
  rotate(sin(time)); /* rotate the coordinate system a bit */
  rect(i,i,i*5,cos(i*5)); /* this is the actual drawing.*/
  }
}


