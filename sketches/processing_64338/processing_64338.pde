
float x_value;

void setup()
{
  size(400,200);

  stroke(255);
  frameRate(4);

}

void draw(){
fill(0,20);
rect(0,0,width,height);
  x_value = (x_value+61) % 400;
    noFill();
  rect(x_value, 100, 50, 50);
}

