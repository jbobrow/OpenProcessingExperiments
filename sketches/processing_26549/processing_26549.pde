
float angle =0.0;
float speed = 0.05;
float radius =500.0;

float offset =40.0;
float scaleVal =40.0;
float angleInc = PI/38.0;


void setup(){
  size(500,500);
  noStroke();
  smooth();
}

void draw(){
 
  fill(0,12);
  rect(0,0,width,height);
  fill(random(155), random(138), random(8));
  angle += speed;
  float sinval = sin(angle);
  float yoffset = sinval * radius;
  ellipse(25,25+ yoffset, random(20), 10);
  ellipse(50,50+ yoffset,random(40),random(50));
  ellipse(75,75+ yoffset, random(20), 10);
  ellipse(100,100+ yoffset, random(20), 10);
  ellipse(400,400+ yoffset, random(20), 10);
  ellipse(425,425+ yoffset, random(20), 10);
  ellipse(450,450+ yoffset,random(40),random(50));
  ellipse(475,475+ yoffset, random(20), 10);

  for(int y=0; y<=width; y+=5){
  float x =offset + (sin(angle) * scaleVal);
  fill(247,250,174);
  rect(x+100,y,2,4);
  rect(x+150,y,2,4);
  rect(x+200,y,2,4);
  rect(x+250,y,2,4);
  rect(x+300,y,2,4);
  x= offset + (cos(angle) * scaleVal);
  fill(38,94,149);
  rect(x+100,y,2,4);
  rect(x+150,y,2,4);
  rect(x+200,y,2,4);
  rect(x+250,y,2,4);
  rect(x+300,y,2,4);
  angle +=angleInc;
}
}


