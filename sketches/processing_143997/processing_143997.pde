
/*Informàtica GEDI 2013-14
Seminari 1_Elsa Casanova Sampé*/

void setup(){ //fix
  size(600,600);
  background(255);
  cursor(CROSS);
}
  void draw(){ //moviment
  background(255);
    dibuixGespa();
    dibuixReno();
}


void dibuixGespa(){
  //gespa
stroke(102,160,74);
strokeWeight(1);
for (int i = 1; i < 600; i = i+7)  {
 line(i, 100, i, 600);}
for (int i = 1; i < 600; i = i+14) {
 line(i, 80, i, 600);}
for (int i = 1; i < 600; i = i+21) {
 line(i, 120, i, 600);}
}

void dibuixReno(){

translate(mouseX-300,mouseY-375);
noStroke();
  //coll
fill(131,96,40);
quad(200,550,400,550,350,300,250,300);
  //cap
fill(149,114,57);
quad(270,450,330,450,375,300,225,300);
triangle(270,450,330,450,300,460);
  //superior cap
fill(103,78,37);
quad(225,300,210,250,300,225,300,325);
quad(375,300,390,250,300,225,300,325);
  //nas
fill(72,61,34);
quad(300,420,300,400,280,400,290,420);
quad(300,420,300,400,320,400,310,420);
fill(149,114,57);
triangle(310,390,270,410,270,400);
fill(149,114,57);
triangle(290,390,330,410,330,400);
fill(33);
ellipse(293,407,4,4);
translate(15, 0);
ellipse(292,407,4,4);
translate(-15,0);

 //banyes esquerra
stroke(250,230,76);
strokeWeight(8);
strokeCap(SQUARE);
line(210,246,160,221);
strokeCap(SQUARE);
line(162,223,140,100);
noStroke();
fill(250,230,76);
triangle(136,101,200,70,140,115);
stroke(250,230,76);
strokeWeight(8);
strokeCap(SQUARE);
line(162,223,180,150);
noStroke();
triangle(176,151,250,130,180,162);

 //banyes dreta
stroke(250,230,76);
strokeWeight(8);
strokeCap(SQUARE);
line(390,246,440,221);
strokeCap(SQUARE);
line(438,219,460,100);
noStroke();
fill(250,230,76);
triangle(464,101,400,70,460,115);
stroke(250,230,76);
strokeWeight(8);
strokeCap(SQUARE);
line(438,223,420,150);
noStroke();
triangle(424,151,350,130,420,162);
  
  //boles banyes
int div=15;
fill(234,24,41,100);
ellipse(350,130,mouseX/div,mouseX/div);
ellipse(250,130,mouseX/div,mouseX/div);
ellipse(400,70,mouseX/div,mouseX/div);
ellipse(200,70,mouseX/div,mouseX/div);
fill(234,24,41);
ellipse(350,130,15,15);
ellipse(250,130,15,15);
ellipse(400,70,15,15);
ellipse(200,70,15,15);

  //orella esquerra inferior
fill(222,128,110);
triangle(211,250,130,275,100,230);
  //orella esquerra superior
fill(193,114,98);
triangle(210,250,160,225,100,230);
  //orella dreta inferior
fill(222,128,110);
triangle(389,250,470,275,500,230);
  //orella dreta superior
fill(193,114,98);
triangle(390,250,440,225,500,230);

//ulls
fill(255);
ellipse(260,340,15,15);
ellipse(340,340,15,15);
fill(25);
ellipse(260,341,8,8);
ellipse(340,341,8,8);
//pestanyes
noFill();
stroke(30);
strokeWeight(2);
arc(259,330,20,10,PI,TWO_PI);
arc(341,330,20,10,PI,TWO_PI);

 //text
textSize(10);
textAlign(CENTER);
fill(255);
text(" the brown nosed reindeer ",300,520);
fill(102,160,74);
text("|| ",230,520);
text(" ||",370,520);
}

  


  


