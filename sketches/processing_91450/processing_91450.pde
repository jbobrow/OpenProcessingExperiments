
PFont my_font;
float x;
float easing = 0.1;
float diameter = 120;

void setup()
{
  size(600,600);
  background(255);

  my_font=loadFont("ChunkFive-Roman-48.vlw");
  textFont(my_font,42);
  textAlign(CENTER); 
}


void draw()
{
smooth();
noStroke();
background(255);

float d = dist(300, 300, mouseX, mouseY);
  fill(d*4);
  rect(0, 0, 600, 600);

noStroke();
 
float targetX = mouseX;
x += (targetX - x) * easing;
int a=70;
fill(0,189,255);
rect(0, 305, pmouseX, 1);
rect(0, 300, pmouseY, 1);
println(targetX + " : " + x);


if(mousePressed==true){
  fill(102,102,102);
  textFont(my_font,18);
  textAlign(CENTER);
  text("www.twindots.com", width/2,height/2+20);
  }else{
  fill(102,102,102);
  textFont(my_font,18);
  textAlign(CENTER);
  text("graphic design & web development", width/2,height/2+20);
  }
  float m = map(mouseX, 0, 100, 0, width);
  fill(251,33,151);
  ellipse(mouseX-18,mouseY,30,30);
  ellipse(mouseX+18,mouseY,30,30);
  ellipse(mouseX+18,mouseY,m/20,m/20);

  fill(59,59,59);
  textFont(my_font,42);
  text("Twin Dots",width/2,height/2);

}



