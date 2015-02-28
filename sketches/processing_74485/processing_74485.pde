
int fib = 2; // fibonacci number
int pfib = 1; // previous fibanacci sequence number
//float radius = 5;
 int temp;
 color c;
 int n = 10;
void setup()
{
  size(600, 600);
  background(0);
  //smooth();
  frameRate(2);
  
}//end setup
 void draw(){
  noFill();
  
  c = color(random(100,200),random(70,155),random(60,200));
  stroke(c);
  polygon(fib, 20+fib, height/2, fib); //vertices, x, y, r
  temp = fib + pfib;
  pfib = fib;
  fib = temp;
  //if (fib < 10 ){radius = fib*3;}
  //else {radius = fib;}
  //if (radius < 10 && fib > 100 && fib < 1000){radius = 1000};

  
   
  render();
  if (pfib == 610){noLoop();} //end the draw function
    
} //end draw
  void render(){
    fill(255); // text color
    text(" n = ",0,30);
    text(pfib+",",15+n,30); // print fibonacci value represented by polygon
    if (fib < 100) {n += 19};
    if (fib > 100 && fib < 1000) {n += 25};
  }


void polygon(int n, float cx, float cy, float r) //this function is thanks to 
                                                 //www.processing.org/learning/anatomy
{
  float angle = 360.0 / n;

  beginShape();
  for (int i = 0; i < n; i++)
  {
    vertex(cx + r * cos(radians(angle * i)),
      cy + r * sin(radians(angle * i)));
  }
  endShape(CLOSE);
}
