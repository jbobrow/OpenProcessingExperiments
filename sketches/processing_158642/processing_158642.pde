
void setup(){
size(600,600);
background(250,250,250);
}

void draw(){
  
  fill(0,0,0);
stroke(0, 50);
line(mouseX,mouseY,300,300);
fill(255,0,255);
fill(500,0,172);
line(mouseY,mouseX,75,75);
line(mouseX,mouseY,-300,-300);
fill(-255,0,-255);
fill(-500,0,-172);
line(mouseY,mouseX,-75,-75);
}

