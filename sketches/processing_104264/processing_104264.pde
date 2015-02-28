
int nGon = 6;
int nShapes = 500;
int hexagonSize = 32;

void setup()
{
size(800, 800);
smooth();
}

void draw()
{

float  c = hexagonSize;
float  b = hexagonSize/2;
float  a = sqrt((c*c)-(b*b));
println(b);
println(a);

translate(400,400); 
drawHexagon(a, b, c);

for(int x = 1; x < nShapes; x++)
{
int case_n = int(random(1,3));
switch(case_n)
{
case 1:
translate(-b*3, -a*3);
break;
case 2:
translate(-b*3, a*3);
break;
case 3:
translate(b*3*2, 0);
break;
default:
translate(0,0);
break;
}

drawHexagon(a, b, c);
}

noLoop();
}


void drawHexagon(float a, float b, float c) {
  /* draw the hexagon */
  noStroke();
  fill(random(255), 64, 128);
  
  beginShape();
  vertex(-b, -a - a*2);
  vertex(b , -a - a*2);
  vertex(c, 0- a*2);
  vertex(b , a- a*2);
  vertex(-b, a- a*2);
  vertex(-c, 0- a*2);
  endShape(CLOSE);
 
  
  
  beginShape();
  vertex(-b*4, -a - a);
  vertex(-b*2, -a - a);
  vertex(c -b*3, 0- a);
  vertex(-b*2, a- a);
  vertex(-b*4, a- a);
  vertex(-c -b*3, 0- a);
  endShape(CLOSE);
 
  
  beginShape();
  vertex(-b, -a);
  vertex(b, -a);
  vertex(c, 0);
  vertex(b, a);
  vertex(-b, a);
  vertex(-c, 0);
  endShape(CLOSE);
  
  stroke(255);
  strokeWeight(1.2);
  line(-b, -a, b, a);
  line(-b, -a, c, 0);
  line(-b, -a, -b, a);
  line(-b, -a, 0, a);
  line(-b, -a, b*1.5, a/2);
  
  line(-b, -a, b, a - a*4);
  line(-b, -a, c, 0 - a*2);
  line(-b, -a, b*1.5, a - a*4 + a/2);
  line(-b, -a, - b, a - a*4);
  line(-b, -a, -b + b, a - a*4);
  //line(-b, -a, b*1.5, a/2 -110);
   
  line(-b, -a, b - b*6, -a );
  line(-b, -a, -b*2 - c, -a - a );
  line(-b, -a, -b*2 - c, -a + a );
  line(-b, -a, -b - b*3.5, -a + a/2 );
  line(-b, -a, -b - b*3.5, -a - a/2 );
  
}



