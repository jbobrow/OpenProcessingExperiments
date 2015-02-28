

 


void setup()
{
  size(400,400);
  background(0,255,255,5);
 
}
void draw()
{
  
  fill(255,255,255,15);
  rect(0,0,400,400);
  fill(255,255,255,0);
  ellipse(mouseX,mouseY,40,40);
  fill(255);
  ellipse(mouseX,mouseY,20,20);
  
  
  //face
if(mousePressed) fill(0,0,0);
else fill(255,255,255);
ellipse(mouseX-70,mouseY+50,200,160);

//eyes
if(mousePressed) fill(255,0,246);
else fill(0,0,0);
ellipse(mouseX-120,mouseY+65,20,25);
ellipse(mouseX-20,mouseY+65,20,25);
  
//nose
if(mousePressed) fill(0,246,255);
else fill(246,255,0);
ellipse(mouseX-70,mouseY+80,20,15);

//ear

smooth();

if(mousePressed) fill(0,0,0);
else fill(255,255,255);
beginShape();
vertex(mouseX-180,mouseY-50);
vertex(mouseX-120,mouseY-20);
vertex(mouseX-160,mouseY+15);
endShape(CLOSE);
  
//ear
noStroke();
smooth();

if(mousePressed) fill(0,0,0);
else fill(255,255,255);
beginShape();
vertex(mouseX-25,mouseY-20);
vertex(mouseX+40,mouseY-50);
vertex(mouseX+22,mouseY+15);
endShape(CLOSE);

if(mousePressed) fill(0,random(0,240),random(204,255)); 
else fill(random(234,255),random(255),0);
ellipse(mouseX+30,mouseY+15,70,70);

if(mousePressed) fill(0,random(0,240),random(204,255)); 
else fill(random(234,255),random(255),0);
ellipse(mouseX-30,mouseY-20,70,70);

if(mousePressed) fill(random(0,255),255,random(0,255)); 
else fill(random(234,255),random(255),0);

ellipse(mouseX,mouseY,30,30);


 
 
  noStroke();
smooth();

if(mousePressed) fill(random(138,255),0,random(0,255)); 
else fill(0,random(78,255),random(192,255),random(90,100));
ellipse(random(800),random(800),50, 50);

if(mousePressed) fill(random(138,255),0,random(0,255));
else fill(0,random(78,255),random(192,255),random(90,100));
ellipse(random(800),random(800),40, 40);

if(mousePressed) fill(random(138,255),0,random(0,255)); 
else fill(0,random(78,255),random(192,255),random(90,100));
ellipse(random(800),random(800),30, 30);
  

  

}


