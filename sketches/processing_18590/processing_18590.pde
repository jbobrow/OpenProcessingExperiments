
void setup() {
  size(250, 250);
  background(255);
  smooth();
}

float x = 0;
float y = 0;

void draw() {
  float r = (random(255));  ///random height for lines
  x = x + 1;              //x+1=lines move across page
  if (x > width) {        //gets it to loop
    x = 0;
  }
  if(mousePressed || keyPressed){ //if mouse or key is pressed
   stroke(0,100);                //stroke turns to thinner black lines
  strokeWeight(2);               
  line(x, 250, x, r);            //250=line starts at bottom of page
  }                              //x=x-cordinate that moves across screen by 1
                                 //r=random height of line
  else {                       
    stroke(255);              //if key or mouse not pressed, lines become white
    strokeWeight(4);          //and thicker
    line(x, 255, x, r);
  }
 
 strokeWeight(6);
 stroke(random(255),random(255)); //creates points on top of lines
 point(x,r);
}


