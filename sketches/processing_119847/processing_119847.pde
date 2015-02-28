
void setup()
{
size(380,400); 
background(255);
}
void draw()
{
noStroke(); //no frame
fill(0,200,255); //bule head
ellipse(185,105,155,155); //bule head
stroke(0,0,0);
fill(255,255,255); //white neck
ellipse(185,115,125,125); //bule head
fill(255,255,255); //white eye
stroke(0,0,0);
ellipse(169,70,35,48); //white eye
fill(255,255,255); //white eye
stroke(0,0,0);
ellipse(205,70,35,48); //white eye
fill(0,0,0); //black eye
stroke(0,0,0);
ellipse(193,70,8,8); //black eye
fill(0,0,0); //black eye
stroke(0,0,0);
ellipse(193,70,8,8); //black eye
fill(0,0,0); //black eye
stroke(0,0,0);
ellipse(180,70,8,8); //black eye
fill(255,0,0); //RED 
stroke(0,0,0);
ellipse(187,90,15,15); //RED
fill(255,255,255); //black eye
stroke(0,0,0);
line(187,145,187,97); // line to mouth
line(135, 95, 170, 100); //cat line
line(135, 108, 170, 108);
line(135, 125, 170, 115);
line(200, 100, 235, 95);
line(200, 108, 235, 108);
line(200, 115, 235, 125);
//mouth
fill(255,50,0); //red mouth
arc(185, 130, 70, 70, 0, PI, PIE);
stroke(255);
fill(0,200,255); //bule body
rect(135,170,100,100); //bule body
stroke(0);
fill(255,255,255); //white belly
ellipse(185,209,80,80);
fill(255,0,0); //red neck
rect(135,170,100,12,7); //red neck
//fill(255,0,0); //red neck
//rect(180,200,150,150,100); //red neck
//pocket
fill(255);
stroke(0);
arc(185, 210, 65, 65, 0, PI, PIE);
//bell
fill(255, 247, 153);
ellipse(185, 185, 25, 25);
//left 
fill(0,200,255);
stroke(0);
quad(110, 230, 110, 200, 136, 180, 136, 210);
//right 
fill(0,200,255);
stroke(0);
quad(235, 210, 235, 180, 264, 200, 264, 230);
//left hand
fill(255, 255, 255);
stroke(0);
ellipse(105, 217, 35, 35);
//right hand
fill(255, 255, 255);
stroke(0);
ellipse(270, 217, 35, 35);
//foot
fill(255,255,255); 
stroke(0);
rect(125,270,60,15,10);
fill(255,255,255); 
stroke(0);
rect(185,270,60,15,10);
}
