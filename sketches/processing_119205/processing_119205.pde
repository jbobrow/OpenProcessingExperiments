
void setup()
{
  size(500,500);
background(#CECECE);


}

void draw()
{

background(#CECECE);

fill(#D4FF29);

rect(190,190,50,50);
rect(260,190,50,50);
rect(190,260,50,50);
rect(260,260,50,50);

rect(215,215,20,20);
rect(265,215,20,20);
rect(215,265,20,20);
rect(265,265,20,20);



rect(120,120,50,50);
rect(330,120,50,50);
rect(120,330,50,50);
rect(330,330,50,50);

ellipse(470,220,20,20);
ellipse(470,250,20,20);
ellipse(470,280,20,20);

ellipse(30,220,20,20);
ellipse(30,250,20,20);
ellipse(30,280,20,20);
















ellipse(250,100,20,20);

ellipse(250,400,20,20);


noFill();
rect(120,120,50,50);
rect(330,120,50,50);
rect(120,330,50,50);
rect(330,330,50,50);

ellipse(250,100,20,20);

ellipse(250,400,20,20);





fill(#D4FF29);

float strecke= map(mouseX,500,10,10,192);

rect(20+strecke,20+strecke,20,20);
rect(460-strecke,20+strecke,20,20);
rect(20+strecke,460-strecke,20,20);
rect(460-strecke,460-strecke,20,20);

float strecke1=map(mouseX,500,100,75,20);

ellipse(120-strecke1,120-strecke1,50,50);
ellipse(380+strecke1,380+strecke1,50,50);
ellipse(120-strecke1,380+strecke1,50,50);
ellipse(380+strecke1,120-strecke1,50,50);

float strecke2=map(mouseX,500,50,0,20);

ellipse(420-strecke2,220-strecke2,20,20);
ellipse(420-strecke2,250,20,20);
ellipse(420-strecke2,280+strecke2,20,20);

ellipse(80+strecke2,220-strecke2,20,20);
ellipse(80+strecke2,250,20,20);
ellipse(80+strecke2,280+strecke2,20,20);

float strecke3 = map(mouseY,500,0,0,20);

ellipse(250,385+strecke3,20,20);
ellipse(250,115-strecke3,20,20);

pushMatrix();
float winkel1 = map(mouseX,500,0,0,2*PI);

translate(250,450);
rotate(winkel1);
translate(-250,-450);

ellipse(240,460,20,20);
ellipse(260,440,20,20);
ellipse(240,440,20,20);
ellipse(260,460,20,20);
popMatrix();

translate(250,50);
rotate(winkel1);
translate(-250,-50);
ellipse(240,40,20,20);
ellipse(260,60,20,20);
ellipse(240,60,20,20);
ellipse(260,40,20,20);


}
