
//thanks 眨澈 for sharing his processing code on http://www.douban.com/group/topic/13009258/

color c4 = color(199, 203, 189, random(120, 255));
color c3 = color(30, 37, 29, random(120, 255));
color c2 = color(48, 44, 45, random(200, 255));
color c1 = color(2, 2,1,random(120, 255));
PFont font = createFont("黑体",20,true);

void setup() { 
size(600, 800); 
initialize();
} 

void initialize(){
background(239,240,250); 
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
  strokeWeight(random(1, 5)); 
  stroke(0,0,0); 
  line(mouseX, mouseY, pmouseX, pmouseY); 
  int rd=int(random(0, 16)); 
  if (rd<4) {fill(c4); } 
  else if (rd >4 && rd<8) { fill(c3); } 
  else if (rd >8 && rd<12) { fill(c2); } 
  else { fill(c1); } 
float r=random(2, 15); 
noStroke(); 
float x3 = mouseX+random(3-a, a-3); float y3= mouseY+random(-3-a, a-3);
ellipse(x3, y3, r-a/3, r-a/3); 

  
} 
clear();
} 

void clear(){
if (mouseX>500 && mouseX<570 && mouseY>720 && mouseY<750 && mousePressed)
{initialize();}

}


