
void setup()
{
size(200,200);
smooth();
frameRate(30);
}
void draw()
{
background(255);
stroke(0);
fill(mouseX+100,mouseY+200,60);

rect(mouseX,mouseY,10,30); //kaklas  
//koordinates 90,30. nuo visur tiek atitraukti
ellipseMode(CORNERS);
ellipse(mouseX+50-90,mouseY+50-30,mouseX+100-90,mouseY+75-30); // kunas
fill(255);
curve(mouseX+50-90,mouseY+62-30,mouseX+50-90,mouseY+62-30,pmouseX+20-90,pmouseY+50-30,mouseX+30-90,mouseY+100+30); //uodega
fill(mouseX+100,mouseY+200,60);
ellipse(mouseX+90-90,mouseY+35-30,mouseX+110-90,mouseY+20-30);  //galva

fill(255); // kas liko vel spalvinam baltai

line(mouseX+60-90,mouseY+60-30,pmouseX+60-90,pmouseY+100-30); // kojos
line(mouseX+60-90,mouseY-30+100,pmouseX+70-90,pmouseY-30+100);

line(mouseX+65-90,mouseY-30+60,pmouseX+65-90,pmouseY-30+90); //virsutine kojos dalis
line(mouseX+65-90,mouseY-30+90,pmouseX+70-90,pmouseY-30+90); // pedos dalis

line(mouseX+80-90,mouseY-30+60,pmouseX+80-90,pmouseY-30+100);
line(mouseX+80-90,mouseY-30+100,pmouseX+90-90,pmouseY-30+100);

line(mouseX+85-90,mouseY-30+60,pmouseX+85-90,pmouseY-30+90);
line(mouseX+85-90,mouseY-30+90,pmouseX+90-90,pmouseY-30+90);

fill(abs(100*(mouseX-pmouseX)));
ellipseMode(CENTER); //akis
ellipse(mouseX+100-90,mouseY+26-30,5,5);
}
