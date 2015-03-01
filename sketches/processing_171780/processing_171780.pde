
//Variables
float value1 = 16;
float value2 = 13;
float value3 = 4;
float value4 = 255;
float value5 = 255;
float value6 = 255;

void setup() 
{ 
size(622,500);
smooth();

 
} 
void draw()
{
  println (mouseX + "," + mouseY);
background(value4,value5,value6);

//CARA
  fill(214,158,140);
  arc(310,240,170,360,0,PI);
  fill(214,158,140);
  arc(310,220,170,110,PI,TWO_PI);
  
  

//OREJAS
  fill(214,158,140);
  arc(230,280,40,50,HALF_PI,PI+HALF_PI);
  arc(390,280,40,50,PI+HALF_PI,PI+HALF_PI+PI);

//FRENTE 
  fill(214,158,140);
  noStroke();
  rect(225,220,170,20);
  stroke(2);  
  line(395,240,395,220);
  line(225,240,225,220);
  
  //BOLSA META AZUL
  fill(215,215,215);
  rect(261,160-15,105,66);
  
    //cristales
    fill (0, 173, 204);
    
    rect (340,162-15,15,10);
    rect (341,188-15,15,10);
    rect (330,167-15,15,10);
    rect (340,168-15,13,10);
    rect (325,190,15,10);
    rect (350,201,15,10);
    rect (350,173-15,15,10);
    rect (340,166-15,15,10);
    rect (338,172-15,15,10);
    rect (338,169-15,15,10);
    rect (330,182-15,15,10);
    rect (320,162-15,15,10);
    rect (320,172-15,15,10);
    rect (343,180-15,15,10);
    rect (320,162-15,15,10);
    rect (323,160-15,15,10);
    rect (285,161-15,15,10);
    rect (324,164-15,15,10);
    rect (333,160-15,13,10);
    rect (340,173-15,15,10);
    rect (310,194-15,15,10);
    rect (285,173-15,12,10);
    rect (282,167-15,15,10);
    rect (356,160-15,10,10);
    rect (285,176-15,15,10);
    rect (335,200,15,10);
    rect (282,185-15,15,10);
    rect (282,199-15,15,10);
    rect (285,210-15,15,10);
    rect (282,216-15,15,10);
    rect (289,191-15,15,10);
   
    
    rect (303,160-15,15,10);
    rect (303,164-15,15,10);
    rect (303,180-15,15,10);

    rect (303,190-15,15,10);
    rect (303,200-15,15,10);
    rect (303,203-15,15,10);
    rect (303,215-15,15,10);
    rect (303,215-15,15,10);
    rect (314,199-15,15,10);
    rect (314,210-15,15,10);
    rect (314,215-15,15,10);
    rect (315,180-15,15,10);   
    rect (282,207-15,10,15);
    rect (282,171-15,9,13);
    rect (332,187-15,9,13);
    rect (337,192-15,15,10);
    rect (332,203-15,15,10);
    rect (328,212-15,10,14);
    rect (338,208-15,15,10);
    rect (355,178-15,10,15);
    rect (345,200-15,10,13);
    rect (350,193-15,15,10);
    rect (355,198-15,10,15);
    rect (340,216-15,15,10);
    rect (350,214-15,15,10);
    rect (350,162-15,15,10);
    rect (332,173-15,15,10);
    rect (301,170-15,15,10);
    rect (326,195-15,15,10);
    rect (282,191-15,13,8);
    rect (282,160-15,12,10);
    rect (315,185-15,15,10);
    rect (325,183,15,10);
    rect (315,145,15,18);
    //tiras blancas  
    fill(245,245,245);
    rect(280,160-15,2,66);
    rect(296,160-15,10,66);
    rect(308,160-15,10,66);
    rect(320,160-15,10,66);
    
   
  
  
 //SOMBRERO
  fill(20,19,25);
  rect(220,120-mouseY/4,180,68);
  rect(165,216-mouseY/4,295,23);
  fill(47,46,54);
  rect(220,189-mouseY/4,180,27);
  
 //ARRUGAS
  stroke(0,0,0);
  line(262,246,357,246);
  line(262,255,357,255);
  

 //OJOS
  stroke(0);
  fill(240,240,240);
  ellipse(273,295,45,25);
  ellipse(348,295,45,25);
  //pupila
  fill(71, 82, 78);
  ellipse(273,295,value1,value2);
  ellipse(348,295,value1,value2);
  //iris
  fill (9, 11, 12);
  ellipse(273,295,value3,value3);
  ellipse(348,295,value3,value3);
  //ojeras
  noFill();
  arc(273,307,36,8,0,PI);
  arc(349,307,36,8,0,PI);
  //cejas
  strokeWeight(7);
  stroke(57,32,16);
  line(248,275,294,278);
  line(326,278,372,275);
    
  
 //GAFAS DE SOL
  stroke(9,9,9);
  strokeWeight(1);
  fill(9,9,9);
  rect(240,273-mouseX/8,60,40);
  rect(320,273-mouseX/8,60,40);
  noStroke();
  rect(295,283-mouseX/8,30,15);
    //REFLEJO
    stroke(255,255,255);
    line(252,295-mouseX/8,265,280-mouseX/8);
    line(267,303-mouseX/8,286,279-mouseX/8);
    line(332,295-mouseX/8,345,280-mouseX/8);
    line(347,303-mouseX/8,366,280-mouseX/8);



 //PATILLAS GAFAS
  strokeWeight(4);
  stroke(9,9,9);
  line(226,254,240,293-mouseX/8);
  line(380,293-mouseX/8,394,254);

 //NARIZ
  strokeWeight(1);
  noFill();
  arc(289,331,30,55,TWO_PI-QUARTER_PI,TWO_PI+QUARTER_PI);
  arc(333,331,30,55,HALF_PI+QUARTER_PI,PI+QUARTER_PI);

 //BARBA
  //BIGOTE
    noStroke();
    fill(57,32,16);
    rect(282,350,57,15);
    triangle(271,367,282,350,282,367);
    triangle(339,367,339,350,350,367);
  //PERILLA
    rect(271,367,11,30);
    rect(339,367,11,30);
    rect(281,386,60,11);
    arc(310,397,79,46,0,PI);

//BOCA
  stroke(0,0,0);
  noFill();
  //line(288,375,333,375);
  arc(311,375,35+mouseY/50,0+mouseY/40,0,PI);
  arc(289,375,10,15,HALF_PI,PI+HALF_PI);
  arc(332,375,10,15,PI+HALF_PI,PI+HALF_PI+PI);
  
  //SI MANTIENES PRESIONADO EL RATON...
  if (mousePressed) {
    value1 = random(16,26);
    value2 = random(13,23);
    value3 = random(4,8);
    value4 = random(0,255);
    value5 = random(0,255);
    value6 = random(0,255);
  }

}



