
void setup(){
    size(1000,1000);
}

void draw(){
  fill(random(0,200),0,255);
  ellipse(mouseX,mouseY,50,50);
  fill(random(0,150),255,random(0,100));
  ellipse(mouseY,mouseX,random(0,50),50);

  line(mouseY,mouseY,720,500);
  line(mouseX,mouseX,500,720);
  line(mouseX,mouseX,600,400);
  line(mouseY,mouseY,200,800);
  line(mouseY,mouseY,800,200);
  line(mouseX,mouseX,random(0,400),600);




 
  
}

