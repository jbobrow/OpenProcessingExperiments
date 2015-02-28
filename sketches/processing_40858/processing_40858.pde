
int a= 1000;

void setup()
{size(a,a/2);
}
void draw()
{
  background(0);
   smooth();


stroke(255);

 
stroke(255);
line(500,250,500,245);
line(500,250,504,250);
line(500,250,500,255);
line(500,250,495,250);


  noStroke();
  




stroke(255,50);
line(mouseX-200,mouseY-50,500,250);
line(mouseX-100,mouseY-50,500,250);
line(mouseX-200,mouseY+50,500,250);
line(mouseX-100,mouseY+50,500,250);


line(mouseX+100,mouseY-50,500,250);
line(mouseX+200,mouseY-50,500,250);
line(mouseX+100,mouseY+50,500,250);
line(mouseX+200,mouseY+50,500,250);

stroke(255,50);
line((mouseX-200)/2+700,(mouseY-50)/2+125,500,250);
line((mouseX-200)/2+700+50,(mouseY-50)/2+125,500,250);
line((mouseX-200)/2+700,(mouseY-50)/2+125+50,500,250);
line((mouseX-200)/2+700+50,(mouseY-50)/2+125+50,500,250);


stroke(255,50);

line((mouseX-200)/4+100,(mouseY-50)/4+187.7,500,250);
line((mouseX-200)/4+125,(mouseY-50)/4+187.7,500,250);
line((mouseX-200)/4+100,(mouseY-50)/4+187.7+25,500,250);
line((mouseX-200)/4+125,(mouseY-50)/4+187.7+25,500,250);

fill(50,200);
noStroke();
rect((mouseX-200)/4+375,(mouseY-50)/4+187.7,25,25);
rect((mouseX-200)/4+450,(mouseY-50)/4+187.7,25,25);
rect((mouseX-200)/4+100,(mouseY-50)/4+187.7,25,25);


fill(120,200);
noStroke();
rect((mouseX-200)/2+250,(mouseY-50)/2+125,50,50);
rect((mouseX-200)/2+400,(mouseY-50)/2+125,50,50);
rect((mouseX-200)/2+700,(mouseY-50)/2+125,50,50);

noStroke();
fill(255,200);
rect(mouseX+100,mouseY-50,100,100);
rect(mouseX-200,mouseY-50,100,100);
}








