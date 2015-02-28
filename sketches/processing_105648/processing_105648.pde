
float x=250;
float y=400;
 
float easing=5;

void setup() {
  size (1000,1000);
  smooth();
}

void draw() {
  if(mousePressed){ 
 background(255,255,255);
 
 
  fill(200);
  strokeWeight(3);
  quad(355+mouseX,260+mouseY,380+mouseX,175+mouseY,520+mouseX,200+mouseY,540+mouseX,330+mouseY);
  quad(355+mouseX,275+mouseY,380+mouseX,175+mouseY,475+mouseX,275+mouseY,470+mouseX,380+mouseY);
  ellipse(312+mouseX,193+mouseY,120,120);
  triangle(280+mouseX,205+mouseY,300+mouseX,205+mouseY,290+mouseX,230+mouseY);
  
  noFill();
stroke(0);
  line(mouseX+380,240+mouseY,310+mouseX,210+mouseY);
  line(355+mouseX,272+mouseY,280+mouseX,260+mouseY);
  line(475+mouseX,275+mouseY,445+mouseX,290+mouseY);
  line(445+mouseX,290+mouseY,540+mouseX,350+mouseY);
  line(470+mouseX,380+mouseY,540+mouseX,460+mouseY);
  
  
  fill(1);
  ellipse(270+mouseX,193+mouseY,15,15);
  ellipse(316+mouseX,193+mouseY,15,15);
    
}
else{
  background(255,255,255);
  
  fill(200);
  strokeWeight(3);
  quad(250+mouseX,180+mouseY,350+mouseX,175+mouseY,350+mouseX,320+mouseY,250+mouseX,300+mouseY);
  ellipse(295+mouseX,117+mouseY,120,120);
  
  noFill();
stroke(0);
  line(mouseX+250,300+mouseY,255+mouseX,400+mouseY);
  line(350+mouseX,300+mouseY,355+mouseX,420+mouseY);
  line(250+mouseX,180+mouseY,210+mouseX,285+mouseY);
  line(350+mouseX,175+mouseY,360+mouseX,295+mouseY);
  
  fill(1);
  ellipse(270+mouseX,117+mouseY,15,15);
  ellipse(316+mouseX,117+mouseY,15,15);
}
  
}
