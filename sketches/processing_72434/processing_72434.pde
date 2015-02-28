

 


void setup()
{
  size(400,400);
  background(0,255,255,5);
 
}
void mouseDragged()
{
  fill(255,255,255,15);
  rect(0,0,400,400);
  fill(255,255,255,0);
  ellipse(mouseX,mouseY,40,40);
  fill(255);
  ellipse(mouseX,mouseY,20,20);
  
  
  //face


fill(255,255,255,100);
ellipse(mouseX-70,mouseY+50,200,160);

//eyes
fill(0,0,0);
ellipse(mouseX-120,mouseY+65,20,25);
ellipse(mouseX-20,mouseY+65,20,25);
  
//nose
fill(246,255,0);
ellipse(mouseX-70,mouseY+80,20,15);

//ear

smooth();

fill(255);
beginShape();
vertex(mouseX-180,mouseY-50);
vertex(mouseX-120,mouseY-20);
vertex(mouseX-160,mouseY+15);
endShape(CLOSE);
  
//ear
noStroke();
smooth();

fill(255);
beginShape();
vertex(mouseX-25,mouseY-20);
vertex(mouseX+40,mouseY-50);
vertex(mouseX+22,mouseY+15);
endShape(CLOSE);


  fill(random(234,255),random(255),0);
ellipse(mouseX+30,mouseY+15,70,70);

fill(random(234,255),random(255),0);
ellipse(mouseX-30,mouseY-20,70,70);


fill(random(234,255),random(255),0);
ellipse(mouseX,mouseY,30,30);
}
void draw()
{
 
 
  noStroke();
smooth();

fill(0,random(78,255),random(192,255),random(100));
ellipse(random(800),random(800),50, 50);
fill(0,random(78,255),random(192,255),random(100));
ellipse(random(800),random(800),40, 40);
fill(0,random(78,255),random(192,255),random(100));
ellipse(random(800),random(800),30, 30);
  
  

}


