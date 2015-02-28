
int sketch;
 
void setup()
{
size(250, 250);
smooth();
sketch = 0;
}

  
void draw()
{
  frameRate(40);
fill(216,147,255, 10);
stroke(255);
sketch = sketch + 1;
  
rect(0, 0, width, height);
  
translate(width / 1, height / 1);
rotate(radians(sketch));
line(-height, -height, height, height);
}


