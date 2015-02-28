
int counter;

void setup() { 
size(300, 300); 
background(255); 
smooth(); 
} 

void draw() {  
float a=dist(mouseX, mouseY, pmouseX, pmouseY); 
int rd=int(random(0, 10)); 
if (rd<2) { 
fill(random(232, 255), random(254), random(240)); 
} 
else if (rd==3) { 
fill(random(240, 255), random(245), random(230)); 
} 
else { 
fill(200, random(222,255)); 
} 
float r=random(0, 15); 
noStroke(); 
ellipse(mouseX+random(3+a,3-a), mouseY+random(-3-a, -3+a), r-a/3, r-a/3); 
}
