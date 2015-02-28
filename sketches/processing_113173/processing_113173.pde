
float time = 0; /* This is going to function as a clock. We'll update it with a value every time a frame gets drawn*/
 
void setup() {
size(512,512);/* setup the size */
frameRate(25);/* This sets the current frameRate */
}
 
void draw() {/* this does the drawing once per frame */
  background(255); /* clear the screen with white */
  translate((width*0.5)+tan(time),(height*0.5)+(1/tan(time))); /* translate all the drawing to the middle of the screen */
  noFill(); /*stop the computer filling in shapes*/
  time=time+0.01; /* update the value in the variable 'time'. This means that we add 1 to 'time' every frame */
  //background(abs(sin(time))*255);
  for (int i = 0;i < 20; i++) { /* this for loop organises the drawing. It will do the drawing 20 times (between 0 and 19)  */
  rotate(sin(time)); /* rotate the coordinate system a bit */
  stroke(13*i,13*i,13*i);//extra;decent blue : stroke(10*i,12*i,13*i); 3 colors : stroke(10*tan(i)*i,12*sin(i)*i,13*sin(i)*i);
  //stroke(10*tan(i)*i,12*sin(i)*i,13*cos(i)*i); gives 4 colours;original :13*i,13*i,13*i.using 2 and setting the third to 0,using 1,or 
  //placing a trigonometric function in one (donot know about two.),while keeping the others the same.
  ellipse(i,i,i*5,cos(i*5));//ellipse in place of rect
  ellipse(5*i,5*i,i*5,sin(i*5));//extra line
  ellipse(10*(i),10*(i),i*5,sin(i*5));//this line is extra.sin in place of cos
  /* this is the actual drawing.
  This says 'Draw a line, starting from i,i (x and y location), and being of size i*5 in both width and depth
  because it's in a for loop, it gets 'called' (used) 20 times, with a different value for 'i' each time */
  
  }
}
