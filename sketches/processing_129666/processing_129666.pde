
float time = 0; /* This is going to function as a clock. We'll update it with a value every time a frame gets drawn*/
float cycle_sin = 0;
float position = 0;
float cycle_cos = 0;
float carte1 = 0;
float carte2 = 0;

void setup() {
size(720,480);
frameRate(30);
position = 100;
cycle_cos = 50;
}
 
void draw() {/* this does the drawing once per frame */
  background(0); /* clear the screen with white */ 
  translate(width*0.5, height*0.5); /* translate all the drawing to the middle of the screen */
  noFill(); /*stop the computer filling in shapes*/
  
  cycle_sin = sin(cycle_sin) + 0.1;
  cycle_cos = cos(cycle_cos) + 0.1;
  carte1 = sin(carte1) + 0.1;
  carte2 = cos(carte2) + 0.1;
  position = position + 0.1;
  time = time+0.01; /* update the value in the variable 'time'. This means that we add 1 to 'time' every frame */
  
  //indicate the center
  strokeWeight(7);
  ellipse(0,0,50,50);
  strokeWeight(15);
  point(0,0);

  for (int i = 0;i < 20; i++) { /* this for loop organises the drawing. It will do the drawing 20 times (between 0 and 19)  */
  rotate(time); /* rotate the coordinate system a bit */
  translate(map(mouseX, width/2, width, 0,width/2*0.5), map(mouseY, height/2, height, 0, height/2*0.5));
  
  //Colour Sets
      color a = color(map(cycle_sin, 0, 70, 0, 255)*i, map(cycle_sin, 0, 70, 0, 255)*i*2, map(cycle_sin, 0, 70, 0, 255)*i*3);
      color b = color(map(cycle_sin, 0, 30, 0, 255)*i, map(cycle_sin, 0, 30, 0, 255)*i*2, map(cycle_sin, 0, 30, 0, 255)*i*3);
      color c = color(map(cycle_sin, 0, 10, 0, 255)*i, map(cycle_sin, 0, 10, 0, 255)*i*2, map(cycle_sin, 0, 10, 0, 255)*i*3);
      color d = color(map(time, 0, 255, 0, 255)*i,map(time, 0, 255, 0, 255)*i*2,map(time, 0, 255, 0, 255)*i*3);
      color e = color(map(cycle_cos, 0, 100, 0, 255)*i, map(cycle_cos, 0, 100, 0, 255)*i*2, map(cycle_cos, 0, 100, 0, 255)*i*3);
  
  //ellipse
      strokeWeight(5);
      stroke(d, 30-cycle_sin);
      ellipse(carte2*i,position,5*i,5*i);
      stroke(e, 30-cycle_sin); 
      ellipse(0,0, time+i,time+i);
  //lines with adding shade(load multiple line)
      strokeWeight(1);
      stroke(a,100-cycle_sin);
      line(cos((TWO_PI/i)*i)*position, sin((TWO_PI/i)*i)*position, carte1*i, carte2*i);
      stroke(b,70-cycle_sin);
      line(cos((TWO_PI/i)*i)*position, sin((TWO_PI/i)*i)*position, carte1*i+3, carte2*i+3);
      stroke(c,30-cycle_sin);
      line(cos((TWO_PI/i)*i)*position, sin((TWO_PI/i)*i)*position, carte1*i+6, carte2*i+6); 
  //curves
      strokeWeight(1);
      stroke(e);
      bezier(cos((TWO_PI/i)*i)*position, sin((TWO_PI/i)*i)*position, cos((TWO_PI/i)*i)*position+100, sin((TWO_PI/i)*i)*position+100, i+time, i+time, i*5, i*5);
  /*points in center
      strokeWeight(5);
      stroke(a, 100-cycle_sin);
      point(carte2*i, carte2*i);
  */
  
  }
}



