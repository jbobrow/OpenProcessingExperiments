
void setup() 
{ 
  smooth();
  size(500,500);
  background(255,255,255);

}
void draw()
{
//contornos de la cara
background(255,255,255);
noFill();
//cabeza
arc(250,220,180,180,PI,TWO_PI);
line(160,220,160,400);
line(340,220,340,400);
line(160,320,220,380);
line(340,320,280,380);
line(220,380,280,380);
line(160,220,160,100);
line(160,100,180,163);
line(340,220,340,100);
line(340,100,320,163);
//cara
noFill();
line(190,280,170,330);
line(310,280,330,330);
line(190,280,250,310);
line(310,280,250,310);
//ojos
//fill(255,250,90);
line(250,310,250,270);
arc(210,250,50,40,QUARTER_PI,PI);
arc(290,250,50,40,0,QUARTER_PI+HALF_PI);
line(175,245,235,265);
line(325,247,265,265);
//parte inferior boca
line(220,300,200,330);
line(280,300,300,330);
//boca
arc(250,355,28,5,PI,TWO_PI);
arc(250,335,50,8,PI,TWO_PI);

if(mousePressed){
  println(mouseX,mouseY);
background(0,0,0);
noFill();
//strokeWeight(3);
//cabeza
stroke(255,255,255);
arc(250,220,180,180,PI,TWO_PI);
line(160,220,160,400);
line(340,220,340,400);
line(160,320,220,380);
line(340,320,280,380);
line(220,380,280,380);
line(160,220,160,100);
line(160,100,180,163);
line(340,220,340,100);
line(340,100,320,163);
//cara
noFill();
line(190,280,170,330);
line(310,280,330,330);
line(190,280,250,310);
line(310,280,250,310);
//ojos
//fill(255,250,90);
line(250,310,250,270);
fill(255,255,0);
arc(210,250,50,40,QUARTER_PI,PI);
arc(290,250,50,40,0,QUARTER_PI+HALF_PI);
fill(0,0,0);
noStroke();
triangle(175,245,235,265,214,239);
//line(175,245,235,265);
fill(0,0,0);
triangle(325,247,265,265,287,238);
noFill();
//line(325,247,265,265);
//parte inferior boca
line(220,300,200,330);
line(280,300,300,330);
//boca
stroke(255,255,255);
arc(250,355,28,5,PI,TWO_PI);
arc(250,335,50,8,PI,TWO_PI);
stroke(255,255,255);
line(160,365,0,425);
line(341,365,500,425);
fill(255,255,0);
noStroke();
arc(250,500,280,130,PI,TWO_PI);
fill(0,0,0);
rect(225,460,50,50);
fill(0,0,0);
arc(175,500,100,85,PI,PI+HALF_PI);
arc(325,500,100,85,PI+HALF_PI,TWO_PI);
noStroke();
triangle(225,460,225,450,240,461);
triangle(275,460,274,450,261,461);
fill(255,255,0);
arc(196,477,70,70,QUARTER_PI,PI+QUARTER_PI);
fill(255,255,0);
arc(324,479,30,50,PI+HALF_PI,HALF_PI+TWO_PI);
//arc(296,477,70,70,,HALF_PI+QUARTER_PI);

//fill(255,255,255);
//arc(200,460,100,100,PI,QUARTER_PI);
}
//arc(130,180,15,220,HALF_PI,PI+HALF_PI);
//arc(370,180,15,220,PI+HALF_PI,TWO_PI+HALF_PI);
}
void mouseReleased(){
//contornos de la cara
background(255,255,255);
noFill();
//cabeza
stroke(0,0,0);
arc(250,220,180,180,PI,TWO_PI);
line(160,220,160,400);
line(340,220,340,400);
line(160,320,220,380);
line(340,320,280,380);
line(220,380,280,380);
line(160,220,160,100);
line(160,100,180,163);
line(340,220,340,100);
line(340,100,320,163);
//cara
noFill();
line(190,280,170,330);
line(310,280,330,330);
line(190,280,250,310);
line(310,280,250,310);
//ojos
//fill(255,250,90);
line(250,310,250,270);
arc(210,250,50,40,QUARTER_PI,PI);
arc(290,250,50,40,0,QUARTER_PI+HALF_PI);
line(175,245,235,265);
line(325,247,265,265);
//parte inferior boca
line(220,300,200,330);
line(280,300,300,330);
//boca
arc(250,355,28,5,PI,TWO_PI);
arc(250,335,50,8,PI,TWO_PI);


}





