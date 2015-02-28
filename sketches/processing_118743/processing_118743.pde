
void setup()
{
size(500,500);
background(255);
fill(0);
rect(10,0,10,500);
rect(30,0,10,500);
rect(50,0,10,500);
rect(70,0,10,500);
rect(90,0,10,500);
rect(110,0,10,500);
rect(130,0,10,500);
rect(150,0,10,500);
rect(170,0,10,500);
rect(190,0,10,500);
rect(210,0,10,500);
rect(230,0,10,500);
rect(250,0,10,500);
rect(270,0,10,500);
rect(290,0,10,500);
rect(310,0,10,500);
rect(330,0,10,500);
rect(350,0,10,500);
rect(370,0,10,500);
rect(390,0,10,500);
rect(410,0,10,500);
rect(430,0,10,500);
rect(450,0,10,500);
rect(470,0,10,500);
rect(490,0,10,500);
}
void draw()
{
pushMatrix();
translate(width/4,height/4);
stroke(0);
fill(255);
rotate(mouseX/5);
rect(0,0,80,80);
popMatrix();
resetMatrix();
pushMatrix();
translate(400,400);
rotate(mouseX/8);
fill(255);
stroke(0);
rect(0,0,60,60);
popMatrix();
resetMatrix();

stroke(255,0,0);

fill(0,0,0);

ellipse(100,400,50,50);
ellipse(60,450,20,20);
ellipse(260,350,100,100);
ellipse(400,200,80,80);
ellipse(450,20,200,200);
ellipse(260,220,50,50);
ellipse(30,460,30,30);
ellipse(300,130,90,90);
ellipse(150,290,80,80);


}
