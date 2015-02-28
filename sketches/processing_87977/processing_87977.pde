
PFont my_font;
float x;
float easing = 0.1;
float diameter = 120;

void setup()
{
  size(600,600);
  background(255);


//FONT
  my_font=loadFont("CenturyGothic-48.vlw");
  textFont(my_font,42);
  textAlign(CENTER);

}

void draw()
{
smooth();
noStroke();
background(255);
//LINES
smooth();
strokeWeight(30);
stroke(200);
line(60, 0, 60, height);
line(0, 70, width, 70);
//CIRCLE
fill(255,0,0,160);
ellipse(60,70,60,60);
//Circle FLOATS
noStroke();

float targetX = mouseX;
x += (targetX - x) * easing;
int a=70;
fill(255,0,0,160);
ellipse(x-15, a, 12, pmouseY/2);
ellipse(x+15, a, pmouseY/2, 12);
println(targetX + " : " + x);
if(mousePressed==true){
  //MAP
noStroke();
ellipse(60, 70, mouseX, mouseY); // red circle
float mx = map(mouseX, 0, width, pmouseX, 180);
}else{
  noStroke();
}
fill(255,0,0,160);
ellipse(mouseX,mouseY,40,40); //CIRLCE FOLLOWING MOUSE
//LOGO
  fill(255,0,0);
  textFont(my_font,42);
  text("PANDEMIC!",width/3,height/15);
  fill(255);
  textFont(my_font,20);
  textAlign(CENTER);
  text("Click and Drag", width/3,76);
  
}




