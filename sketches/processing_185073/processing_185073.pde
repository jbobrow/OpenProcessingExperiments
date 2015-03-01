
int x=300; int y=130;
void setup(){ 
size(600,300); 
line (0,100,600,100); 
line(0,200,600,200);
}
void draw(){ 
  if ((mouseX < 600) && (mouseY<100)){ 
    noStroke(); 
    fill (246,255,-100+mouseX/3); 
    rect (0,0,600,100);
} 
else if((mouseX<600) && (mouseY<=200)){ 
noStroke(); 
fill (mouseX/3-70,76,255); 
rect (0,100,600,100); 
}
else if((mouseX<600) && (mouseY>200)){ 
noStroke(); 
fill (255,mouseX/3-50,mouseX/3-50); 
rect (0,200,600,100);
}
if((mouseY>100)&&(mouseY<200)){
  fill(255,150);
  ellipse(x,y,40,40);ellipse(x-20,y+10,40,40);ellipse(x-50,y+25,40,40);ellipse(x-80,y+40,40,40);
  ellipse(x+20,y+10,40,40);ellipse(x+50,y+25,40,40);ellipse(x+80,y+40,40,40);
}
}
