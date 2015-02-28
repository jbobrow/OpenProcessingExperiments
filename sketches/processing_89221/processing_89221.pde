
//thanks 眨澈 for sharing his processing code on http://www.douban.com/group/topic/13009258/

color c3 = color(215, 50, 50, random(120, 255));//red
color c2 = color(247, 120, 3, random(200, 255));//yellow
color c1 = color(100, 0,0,random(120, 255));//black

void setup() { 
size(600, 800); 
initialize();
} 

void initialize(){
background(0,200); 
smooth(); 
stroke(100,100);
fill(20,60,90,200);
rect(500,720,70,30);
fill(200,100);
textSize(16);
text("redraw",510,740);
}

void draw() { 
if (mousePressed==true) { 
  float a=dist(mouseX, mouseY, pmouseX, pmouseY); 
  strokeWeight(random(1, 4)); 
  stroke(120); 
  line(mouseX, mouseY, pmouseX, pmouseY); 
  int rd=int(random(0, 14)); 
  if (rd<4) {fill(c1); } 
  else if (rd >4 && rd<6) { fill(c2); } 
  else { fill(c3); } 
float r=random(2, 15); 
noStroke(); 
float x3 = mouseX+random(3-a, a-3); float y3= mouseY+random(-3-a, a-3);
ellipse(x3, y3, (r-a/3)*2, (r-a/3)*2); 
textSize(rd*1.3);
text("Serene",x3,y3);
  
} 
clear();
} 

void clear(){
if (mouseX>500 && mouseX<570 && mouseY>720 && mouseY<750 && mousePressed)
{initialize();}

}
