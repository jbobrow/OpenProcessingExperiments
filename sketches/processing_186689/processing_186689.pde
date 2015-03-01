
//Pràctica rellotge

float liniasegons =675;
float mida =50;
color groc1 = color(252,233,8);
color groc2 = color(250,208,68);
color blau1= color(33,216,169);
color crema= color(242,239,125);
color verd= color(154,242,174);
color vermell = color(242,165,49);




void setup() {
  size(600,700);
  }
  
  
  
void draw() {
//if (hour()>=6) {variaciocel();} 
//if (hour()<=6) {variaciocel2();}
  variaciocel();
  dibuixa();
  if(hour()>=15) {pluja();}

 
}

//////////////////////////////// FUNCIONS ////////////////////////////////////


void variaciocel () {
 float llarg = map(hour(),0,32,0,width);
  background(166 - llarg,220 -llarg/2,245 -llarg/4);


}
 void pluja () {
   float llarg = map(hour(),0,32,0,width);
     

fill(103 + llarg/5,220 + llarg/5 ,230 - llarg/20, llarg + 10);
stroke(166 + llarg/5,220 + llarg/5 ,245 - llarg/20, llarg + 0.001);
rect(random(0,600),random(0,600),1,20);
rect(random(0,600),random(0,600),1,20);
rect(random(0,600),random(0,600),1,20);
rect(random(0,600),random(0,600),1,20);
rect(random(0,600),random(0,600),1,20);
rect(random(0,600),random(0,600),1,20);
rect(random(0,600),random(0,600),1,20);
rect(random(0,600),random(0,600),1,20);

 
 }
//void variaciocel2 () {
   //float llarg = map(hour(),0,24,0,width);
  //background(24 - llarg,100 -llarg/2,134 -llarg/4);
  
//}


void dibuixa () {
  
 strokeWeight(10);
 fill(#8B6935);
 rect(0,675,600,40);
  float llarg = map(minute(),0,59,0,width);
  
  stroke(#DE3F26);
  line(0,liniasegons,llarg,liniasegons);
  strokeWeight(2);
  stroke(00);
  noFill();
    rect(0,670,600,10);
//per fer que en un minut completi la pantalla: fer una regla de tres, seg=59, sobre width que es? o amb la funcio map (aquest valor va de 0 a 59 i vull que mel mapegis de 0 a width
//manera d'invocar la funcio, sempre obrint i tancant parentesis,
 //quadrat edifici
 fill(135);
   rect(130,100,340,560);
   
   
 
  //porta
  fill(198,126,16);
 rect(270,560,60,110);
 line(300,560,300,670);
 fill(209,186,8);
 ellipse(285,620,5,5);
 ellipse(315,620,5,5);
 
 //finestrese -->  fer-ho tot a partir del paràmetre SEPARACIÓ
 //planta 1
fill(#EACE2D);
 rect(150,560,50,60);
 rect(210,560,50,60);
 rect(340,560,50,60);
 rect(400,560,50,60);
 //planta 2
 noFill();
 ///FINESTRES RANDOM// 
 
 //grupfinestres1
 fill(groc1);
 noStroke();
groc1= color(random(220,250), random(190,233), random(0,12));
rect(200,120,mida,mida);
rect(400,120,mida,mida);
rect(250,220,mida,mida);
rect(400,220,mida,mida);
rect(250,370,mida,mida);
rect(250,320,mida,mida);
rect(400,420,mida,mida);
rect(300,470,mida,mida);
rect(300,270,mida,mida);
   
   //grupfinestres2
   fill(groc2);
  groc2 =  color(random(230,255), random(200,208), random(40,68));
  
  rect(250,170,mida,mida);
  rect(150,120,mida,mida);
  rect(150,270,mida,mida);
  rect(400,320,mida,mida);
  rect(300,370,mida,mida);
  rect(150,420,mida,mida);
  rect(250,470,mida,mida);
  rect(200,220,mida,mida);
  
  //grupfinestres3
  fill(blau1);
  blau1 =  color(random(33,155), random(200,216), random(100,169));
  rect(250,120,mida,mida);
  rect(200,170,mida,mida);
  rect(150,220,mida,mida);
  rect(350,320,mida,mida);
  rect(200,420,mida,mida);
  rect(400,370,mida,mida);
  rect(350,470,mida,mida);
  rect(300,220,mida,mida);
  
  //grupfinestres4
  fill(crema);
  crema= color(random(200,242),random(200,239),random(100,125));
  rect(250,420,mida,mida);
  rect(350,120,mida,mida);
  rect(300,170,mida,mida);
  rect(350,220,mida,mida);
  rect(250,270,mida,mida);
  rect(200,320,mida,mida);
  rect(350,370,mida,mida);
  rect(150,470,mida,mida);
  rect(300,420,mida,mida);
  //rect(400,170,mida,mida);
  
  //grupfinestres5
  fill(verd);
    verd= color(random(115,154),random(200,242),random(100,174));
  rect(300,120,mida,mida);
  rect(350,170,mida,mida);
  rect(200,270,mida,mida);
  rect(150,320,mida,mida);
  rect(350,420,mida,mida);
  rect(200,470,mida,mida);
  rect(400,270,mida,mida);
  rect(200,370,mida,mida);
  
//grupfinestres6
fill(vermell);
  vermell= color(random(200,242),random(100,165),random(20,49));
 rect(400,170,mida,mida);
 rect(350,270,mida,mida);
 rect(300,320,mida,mida);
 rect(150,370,mida,mida);
 rect(150,170,mida,mida);
 rect(400,470,mida,mida);
 
//////SEGONS///
stroke(00);
 float segons = map(second(),0,59,150,520);
 line(200,120,200,segons);
 line(300,120,300,segons);
 
 float segons2 = map(second(),0,59,520,120);
 line(400,520,400,segons2);
 line(250,520,250,segons2);
 line(350,520,350,segons2);
 
 float segons3 = map(second(),0,59,150,450);
 line(150,220,segons3,220);
 line(150,320,segons3,320);
 line(150,370,segons3,370);
 line(150,470,segons3,470);
 
 float segons4 = map(second(),0,59,450,150);
 line(450,270,segons4,270);
 line(450,170,segons4,170);
 line(450,420,segons4,420);
 
 noFill();
 rect(150,120,300,400);
 stroke(255,232,98);
 fill(255,232,98);
 //rect(150,120,300,minuts);

 stroke(00);
 

  //estructura edifici
  
  fill(85);
  rect(115,660,160,10);
  rect(325,660,165,10);
  line(130,660,130,100);
  line(130,100,470,100);
  line(470,100,470,660);
  rect(140,90,320,10);
  //antena
  line(400,90,420,35);
  line(403,65,415,65);
  line(390,50,440,50);
  line(388,60,438,60);
  line(410,45,422,45);
  //Valla terrat
  line(150,80,450,80);
  line(150,90,150,70);
   line(160,90,160,70);
    line(170,90,170,70);
    line(180,90,180,70);
    line(190,90,190,70);
    line(200,90,200,70);
    line(210,90,210,70);
    line(210,90,210,70);
    line(220,90,220,70);
    line(230,90,230,70);
    line(240,90,240,70);
    line(250,90,250,70);
    line(260,90,260,70);
    line(270,90,270,70);
    line(280,90,280,70);
    line(290,90,290,70);
    line(300,90,300,70);
    line(310,90,310,70);
    line(320,90,320,70);
    line(330,90,330,70);
    line(340,90,340,70);
    line(350,90,350,70);
    line(360,90,360,70);
    line(370,90,370,70);
    line(380,90,380,70);
    line(390,90,390,70);
    line(400,90,400,70);
    line(410,90,410,70);
    line(420,90,420,70);
    line(430,90,430,70);
    line(440,90,440,70);
    line(450,90,450,70);
 
    
 
}


 
  
  

  
  

