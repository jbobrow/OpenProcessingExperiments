
//Program to create somewhat "random" polygons 
//functions taken from the following code by Natalie Freed https://gist.github.com/nataliefreed/8483050


PVector loc; 
float orientation; 


void setup()
{

  size(displayWidth, displayHeight);

  orientation = HALF_PI; 

  loc= new PVector(width/2, height/2);

 
    //save("shape2.png");
}



void draw() {
  background(100); 
  drawShape();
  delay(500);
}




void drawShape () {

  int[] numbers = {
    15, 30, 45, 60, 90, 120, 10
  }; 
  int angle = numbers[int(random(0, 6))] ;  
 // int angle = numbers[2] ; 


  float sides = 360/angle ; 

  float sidelength = 1000/sides;


 
  beginShape();
  for (int i = 0; i < sides; i++) {
    forward(sidelength);
    left(radians(angle)); 
    addVertex(); 
   
   
  }
  endShape(CLOSE);
 
}

//everything below here is from the source above

void addVertex()
{
  vertex(loc.x, loc.y);
}

void forward(float pixels)
{
  PVector start = loc;
  PVector end = PVector.add(loc, polar(pixels, orientation));
  line(start, end);
  loc = end;
}

void left(float theta) 
{
  orientation += theta;
}

void right(float theta)
{
  orientation += theta;
}
void jumpTo(float x, float y) 
{
  loc = new PVector(x, y);
}

void line(PVector a, PVector b)
{
  line(a.x, a.y, b.x, b.y);
}
PVector polar(float r, float theta)
{
  return new PVector (r*cos(theta), r*sin(-theta));
}


