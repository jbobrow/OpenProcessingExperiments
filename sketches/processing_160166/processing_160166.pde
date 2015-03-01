
float rectX;
float rectY;
float a;
float b;
float c;
float d;
 

void setup(){
  size(1600,800);
}
void draw(){}
 
void mouseMoved()
{
int px,py;
  colorMode(HSB,360,100,100);
  background(0,20,200);
  
  stroke(255,0,0);
  strokeWeight(10);
  fill(10,10,238);
  rect(rectX+100,rectY+300,200,200,3,3,90,90);
  
  
  stroke(255,0,0);
  strokeWeight(5);
  fill(0,10,60);
  ellipse(rectX+150,rectY+350,40,40);
  
  
 
  
  stroke(255,0,0);
  strokeWeight(5);
  fill(0,10,60);
  ellipse(rectX+250,rectY+350,40,40);
  
  stroke(255,0,0);
  strokeWeight(2);
  fill(0,255,0);
  
px=(int)((mouseX-200)*0.005);
py=(int)((mouseY-200)*0.015);
if (py>50){py=50;}
ellipse(rectX+151+px,rectY+351+py,23,23);
ellipse(rectX+251+px,rectY+351+py,23,23);

fill(20,20,255);
  triangle(rectX+180,rectY+420,rectX+200,rectY+380,rectX+220,rectY+420);
  
  
  line(rectX+185,rectY+450,rectX+215,rectY+450);
  line(rectX,rectY+300,rectX+100,rectY+300);
  
  
  fill (a,b,c,d);
  rect(rectX+80,rectY+200,240,100,30,30,3,3);
   a=random(255);
  b=random(255);
  c=random(255);
  d=random(255);
  
  
  
  rectX=rectX+1;
  rectY= rectY+ random(-10,10);
}


