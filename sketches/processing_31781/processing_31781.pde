

PImage tennis;
void setup(){
  
size(500,500);
tennis=loadImage("data/tennis.jpg");
background(27,72,37);
smooth();

}
void draw(){
  
//ball
strokeWeight(2);
fill(255,235,0);
stroke(0);
image(tennis,0,0);

//background(27,72,37);

ellipse(300,300,100,100);
if (mousePressed == true){
  fill(27,72,37);
  stroke(27,72,37);
  strokeWeight(3);
  ellipse(300,300,100,100);
  fill(255,235,0);
  strokeWeight(2);
  stroke(0);
  ellipse(mouseX,mouseY,100,100);
}
 
/*  
//court
fill(65,145,229);
strokeWeight(4);
stroke(255,255,255);
rect(40,10,440,230);
strokeWeight(4);
stroke(255,255,255);
line(150,40,150,210);
line(370,40,370,210);
line(150,125,260,125);
line(370,125,260,125);
line(40,125,50,125);
line(480,125,470,125);
line(40,40,480,40);
line(40,210,480,210);
stroke(0,0,0);
strokeWeight(8);
strokeJoin (BEVEL);
line(260,13,260,237);
*/

// racket grip
stroke(0);
strokeWeight(2);
fill(255,255,255);
quad(20,450,40,475,180,345,160,320);
line(40,475,40,430);
line (60,455,60,412);
line(80,436,80,393);
line (100,420,100,377);
line(120,401,120,356);
line (140,381,140,340);
line(160,362,160,322);



//strings
strokeWeight(2);
stroke(238,252,38);
line(152,245,310,114);
line(150,260,325,114);
line(149,277,342,116);
line(150,293,354,122);
line(153,308,366,125);
line(160,322,380,135);
line (170,333,390,145);
line(180,344,397,155);
line(190,352,402,168);
line(200,357,405,180);
line(210,361,408,192);
line(225,363,408,205);
line(245,363,406,224);
stroke(205,206,185);
line(150,260,243,363);
line(160,250,262,362);
line(165,220,293,353);



//head of racket
fill(255,255,255,0);
strokeWeight(8);
stroke(255,45,0);
rotate(TWO_PI/2.6);
ellipse(-50,-364,287,205);

//save("TennisCourt.jpg");
}

