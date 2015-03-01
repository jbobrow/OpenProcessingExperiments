
int value = 150; // efecte dels ulls
boolean por = false; //efecte de obrir la boca
int llengua = 0; //efecte de la llengua
float puntx; 
float punty;
float puntxx;
float puntyy;


void setup () {
  size (500,500);
  background (0,100,150);
  smooth();
  
}

void draw () {
println(mouseX + " : " + pmouseY);
fill(240,222,100); // orelles
arc (404,240,50,50,0,TWO_PI);
arc (130,240,50,50,0,TWO_PI);
fill (240,222,100);
beginShape(); //cara
     vertex(205,416);
     vertex(136,324);
     vertex(127,205);
     vertex(145,213);
     vertex(146,205);
     vertex(155,203);
     vertex(139,135);
     vertex(200,124);
     vertex(253,143);
     vertex(269,154);
     vertex(281,162);
     vertex(306,160);
     vertex(333,141);
     vertex(379,126);
     vertex(379,202);
     vertex(405,203);
     vertex(404,298);
     vertex(395,316);
     vertex(334,410);
     vertex (283,412); //mitad de la cara
     vertex(205,416);
endShape();

fill (0,0,0);
beginShape (); //cabell
  vertex(110,213);
  vertex(94,132);
  vertex(131,53);
  vertex(171,28);
  vertex(186,48);
  vertex(199,38);
  vertex(214,54);
  vertex(250,41);
  vertex(276,68);
  vertex (307,40);
  vertex (325,66);
  vertex(359,63);
  vertex(392,52);
  vertex(415,117);
  vertex(407,201);
  vertex (410,214);
  vertex (394,206);
  vertex (378,200);
  vertex (380,127);
  vertex (325,146);
  vertex ( 308,159);
  vertex (283,161);
  vertex (306,155);
  vertex (281,160);
  vertex (255,142);
  vertex (203,124);
  vertex (140,133);
  vertex (154,200);
  vertex (145,206);
  vertex (145,215);
  vertex (126,204);
  vertex(110,213);
endShape();
  
  
  fill (255,255,255); //ull contorn blanc
  ellipse (210,226,55,50);
  ellipse (329,226,55,50);
  fill ( #30B247); //ull contorn verd
  ellipse (210,226,30,30);
  ellipse (329,226,30,30);
 
  
   fill(255,255,255); //nas
 line(262,252,283,271);
 line (282,272,263,274); 
  
 fill (255,255,255); //ull contorn blanc
  ellipse (210,226,55,50);
  ellipse (329,226,55,50);
  
 //canvi color ull
 fill (value);
ellipse (210,226,30,30);
ellipse (329,226,30,30);


fill(0);//ull contorn negre
   ellipse (puntx,punty,10,10);
   ellipse (puntxx,puntyy,10,10);
  
              puntx=map(mouseX, 0, 900, 200, 235);
              punty=map(mouseY, 0, 300, 216, 227);
              puntxx=map(mouseX, 0, 900, 320, 355);
              puntyy=map(mouseY, 0, 300, 216,227);
              
 if (por == false) {
    // boca
 line (198,348,212,333);
 line(213,334,235,349);
 line(236,350,257,329);
 line(258,330,279,347);
 line (280,348,297,327);
 line (298,328,317,345);
 }
                
 if (por == true){ //efecte de la boca
 fill(200,100,90);             
  ellipse(260,336,140,50);
  fill ((#B90909)); 
  arc(259,339+ llengua,50,50,0,PI);
  
   if (llengua == 0){ //efecte de la llengua
   llengua= llengua + 5;
 }else{ 
   llengua = 0;
 }
  
 }
}

void mouseDragged() 
{
  value = value + 5;
 if (value > 255) {
    value = 0;
  }
}


void mousePressed(){
 por = true;
 llengua = 0;
 
  }
  
 void mouseReleased(){
   por = false;
 }



