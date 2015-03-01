
void setup() { 
size(600, 600); 
background(255); 
smooth(); 
} 

void draw() { 
if (mousePressed==true) { 
float a=dist(mouseX, mouseY, pmouseX, pmouseY); 
strokeWeight(random(1, 5)); 
stroke(70,random(0,255)); 
line(mouseX, mouseY, pmouseX, pmouseY); 
int rd=int(random(0, 15)); 
if (rd<2) { 
fill(#99CCFF, random(100, 255)); 
} 
else if (rd==3) { 
fill(#47B5FF, random(200, 255)); 
} 
else { 
fill(#15364C, random(100, 255)); 
} 
float r=random(1, 15); 
noStroke(); 
//rect(mouseX+random(3-a, a-3), mouseY+random(-3-a, a-3), r-a/3, r-a/3);
ellipse(mouseX+random(3-a, a-3), mouseY+random(-3-a, a-3), r-a/3, r-a/3);
} 
} 


