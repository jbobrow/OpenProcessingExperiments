
/*Alfons Echegaray
Informatica Grup 02 - 2n GEDI
Professora: Anna Mª del Corral
Practica 2
Variables:
En aquest exercici treballem les variables en funció del cursor (X,Y) utilitzant el void set, i el void draw, i definint la posició de les lineas respecte mouseX.
Les elipses canvien de tamany amb mouseX, i de color amb mouseY.
L'ull apareix segons el moviment de mouseX, pero apareix amb un moviment vertical.
*/

void setup()
{
  size(600,600);
  rectMode(CENTER);
  colorMode(RGB, height, height, 250);
  noCursor(); 


}

void draw()
{
  background(255);
  
  //lineas creu//   
  stroke(0);
    strokeWeight(10);
  line(width/4,height/4,3*(width/4),3*(height/4));
  line(3*(width/4),height/4,width/4,3*(height/4));
  
  //cercles de colors//
noStroke();
fill(mouseY+100,mouseY,50);
ellipse(width/2,height/2,130+(0.5*mouseX),180+(0.5*mouseX));

fill(mouseY+50,mouseY,150);
ellipse(width/2,height/2,100+(0.5*mouseX),100+(0.5*mouseX));

fill(mouseY,mouseY,250);
ellipse(width/2,height/2,20+(0.3*mouseX),40+(0.8*mouseX));

  
  // lineas estatiques//
stroke(0);
strokeWeight(5);
line(10,0,10,600);
line(20,0,20,600);
line(30,0,30,600);
line(40,0,40,600);
line(50,0,50,600);
line(60,0,60,600);
line(70,0,70,600);
line(80,0,80,600);
line(90,0,90,600);
line(100,0,100,600);
line(110,0,110,600);
line(120,0,120,600);
line(130,0,130,600);
line(140,0,140,600);
line(150,0,150,600);
line(160,0,160,600);
line(170,0,170,600);
line(180,0,180,600);
line(190,0,190,600);
line(200,0,200,600);
line(210,0,210,600);
line(220,0,220,600);
line(230,0,230,600);
line(240,0,240,600);
line(250,0,250,600);
line(260,0,260,600);
line(270,0,270,600);
line(280,0,280,600);
line(290,0,290,600);
line(300,0,300,600);
line(310,0,310,600);
line(320,0,320,600);
line(330,0,330,600);
line(340,0,340,600);
line(350,0,350,600);
line(360,0,360,600);
line(370,0,370,600);
line(380,0,380,600);
line(390,0,390,600);
line(400,0,400,600);
line(410,0,410,600);
line(420,0,420,600);
line(430,0,430,600);
line(440,0,440,600);
line(450,0,450,600);
line(460,0,460,600);
line(470,0,470,600);
line(480,0,480,600);
line(490,0,490,600);
line(500,0,500,600);
line(510,0,510,600);
line(520,0,520,600);
line(530,0,530,600);
line(540,0,540,600);
line(550,0,550,600);
line(560,0,560,600);
line(570,0,570,600);
line(580,0,580,600);
line(590,0,590,600);

  //limeas moviment//
stroke(0);
line(mouseX+10,0,mouseX+10,600);
line(mouseX+20,0,mouseX+20,600);
line(mouseX+30,0,mouseX+30,600);
line(mouseX+40,0,mouseX+40,600);
line(mouseX+50,0,mouseX+50,600);
line(mouseX+60,0,mouseX+60,600);
line(mouseX+70,0,mouseX+70,600);
line(mouseX+80,0,mouseX+80,600);
line(mouseX+90,0,mouseX+90,600);
line(mouseX+100,0,mouseX+100,600);
line(mouseX+110,0,mouseX+110,600);
line(mouseX+120,0,mouseX+120,600);
line(mouseX+130,0,mouseX+130,600);
line(mouseX+140,0,mouseX+140,600);
line(mouseX+150,0,mouseX+150,600);
line(mouseX+160,0,mouseX+160,600);
line(mouseX+170,0,mouseX+170,600);
line(mouseX+180,0,mouseX+180,600);
line(mouseX+190,0,mouseX+190,600);
line(mouseX+200,0,mouseX+200,600);

//ull moviment//
fill(#FCD700);
ellipse(300,mouseX*2,200,200);
fill(0);
ellipse(300,mouseX*2,50,180);




}





