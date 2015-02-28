
void setup(){
  
  size(500,500); //size of the canvas
smooth();
frameRate(30);
  
}

void draw(){
    background(255,0,0);
ellipseMode(CENTER);
rectMode(CENTER);

//zoog arms
line(100+mouseX,110+mouseY,70+mouseX,125+mouseY);
line(100+mouseX,110+mouseY,130+mouseX,125+mouseY);

//zoog body
stroke(0);
fill(127,0,0);
rect(mouseX+100,mouseY+100,20,100);

//zoog head
fill(255,200,200);
ellipse(mouseX+100,mouseY+70,60,60);

//zoog eyes
fill(0);
ellipse(81+mouseX,70+mouseY,16,32);
ellipse(119+mouseX,70+mouseY,16,32);
fill(255);
ellipse(81+mouseX,80+mouseY,10,10);
ellipse(119+mouseX,80+mouseY,10,10);
stroke(0);

//zoog legs
line(mouseX+90,mouseY+150,mouseX+80,mouseY+180);
line(mouseX+110,mouseY+150,mouseX+120,mouseY+180);

//zoog mouth
line(87+mouseX,90+mouseY,110+mouseX,90+mouseY);

}

void mousePressed(){
  println("Take me to your leader!");
}

