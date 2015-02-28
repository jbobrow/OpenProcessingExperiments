
//set window, bg & anti-alias
void setup(){
size(800,600);
background(255);
smooth();
}

//set drawing
void draw(){
  //set static image
  noLoop();
//variables
float x1;
float y1;

//loop
for (int i=0;i<=360; i=i+3)
{
//initial point of line
x1=width/2;
y1=height/2;
//color & stroke 
  fill(random(i),random(255),random(i),random(180));
  stroke(194,86,237);
  strokeWeight(0);
  stroke(148,100,167);
  bezier(x1,y1,random(width),random(height),x1,y1,random(width),random(height));
}

saveFrame("line-####.png");
}

