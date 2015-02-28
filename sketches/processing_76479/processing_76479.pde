
float angleH;
float angleV;
int rate;

void setup() {
  rate = 2;
  size(640,480);
}

void draw()  {
  background(0);
  frameRate(rate);
  stroke(255);
  
  float a = (mouseX/ (float) width)* 90f;
  float b = (mouseY/ (float) height)* 90f;
  angleH = radians(a);
  angleV = radians(b);
  translate(width/2,height/2);
  line(0,0,0,-1);
  translate(0,-1);
  
  //Draw each of the 3 random lines.
  for(int i = 0; i < 3; i++)  {
    turn(1);
  }
}

/* On each iteration, increase line length by 20%, choose an
angle dependent on mouse position in a randomly generated 
direction, and draw the line.
*/
void turn(float input)  {
  input *= 1.2;
  if(input < 200)  {
    pushMatrix();
    int r = (int) random(2);
    if(r == 0)  {
      rotate(angleH);
    }
    else {
      rotate(-angleV);
    }
    line(0, 0, 0, -input);
    translate(0, -input);
    turn(input);
    popMatrix();
  }
}

// Change framerate on mouse release
void mouseReleased()  {
  rateChange(rate);
}  
void rateChange(int input)  {
  if(input == 2)  {
    rate = 5;
  } else if(input == 5)  {
    rate = 15;
  } else if(input == 15)  {
    rate = 30;
  } else if(input == 30)  {
    rate = 2;
  }
}

