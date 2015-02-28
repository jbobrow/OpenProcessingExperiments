
/*

***********************************************************************
***********************************************************************
** ///////////////     //\\        ////    //\\     //    ////////// **
** //          //     //  \\       ////    // \\    //    ////////// **
** /////////////     //    \\      ////    //  \\   //       //      **
** //               // ==== \\     ////    //   \\  //       //      **
** //              //        \\    ////    //    \\ //       //      **
** //             //          \\   ////    //     \\//       //      **
***********************************************************************
***********************************************************************

by Eliad Lienhardt
   Media Production 2011

*/

// statischer anfang
void setup(){
size(500,500); //grösse des fensters
background(255); //hintergrundfarbe
smooth(); //weniger verpixelte rundungen
int zufall = constrain(int(random(0,255)),50,250); //generiert zufällige zahl zwischen 0 und 255, wobei der mindestwert bei 50 und maximalwert bei 250 liegt
fill(150); //setzt die oben generierte zahl für die füllung der palette ein
rect(-1,height*0.8,width,height*0.2); //getrennter abschnitt für die farbpalette
line(250,height*0.8,250,height); //trennt farbpallette



 //roter farbenbereich
noStroke();
fill(255,0,0);
stroke(0);
ellipse(20,height*0.84,15,15);

 //grüner farbenbereich
noStroke();
fill(0,255,0);
stroke(0);
ellipse(50,height*0.84,15,15);

 //blauer farbenbereich
noStroke();
fill(0,0,255);
stroke(0);
ellipse(80,height*0.84,15,15);

 //schwarzer farbenbereich
fill(0,0,0);
stroke(255,255,255);
ellipse(110,height*0.84,15,15);

 //weisser farbenbereich
fill(255,255,255);
stroke(0);
ellipse(140,height*0.84,15,15);

 //pinker farbenbereich
fill(255,0,255);
stroke(0);
ellipse(170,height*0.84,15,15);

//gelber farbenbereich
fill(255,255,0);
stroke(0);
ellipse(200,height*0.84,15,15);

//magenta farbenbereich
fill(0,255,255);
stroke(0);
ellipse(230,height*0.84,15,15);

 //schwarzer hintergrund
fill(0);
stroke(0);
ellipse(20,height*0.96,15,15);

 //weisser hintergrund
fill(255);
stroke(0);
ellipse(50,height*0.96,15,15);

 //kleiner pinsel
fill(100);
stroke(0);
ellipse(400,height*0.84,5,5);

 //mittlerer pinsel
fill(100);
stroke(0);
ellipse(415,height*0.84,10,10);

 //grosser pinsel
fill(100);
stroke(0);
ellipse(440,height*0.84,20,20);

 //grosser pinsel rechteck
fill(100);
stroke(0);
rect(430,height*0.92,20,20);

//mittlerer pinsel rechteck
fill(100);
stroke(0);
rect(410,height*0.92,10,10);

//kleiner pinsel rechteck
fill(100);
stroke(0);
rect(395,height*0.92,5,5);

 //weicher pinsel an
fill(200);
stroke(0);
ellipse(310,height*0.84,15,15);

//weicher pinsel aus
fill(200);
stroke(0);
ellipse(310,height*0.9,15,15);

//titel & beschreibungen
fill(0);
text("Weich an",305,height*0.85);
text("Weich aus",305,height*0.91);
text("Runde Pinsel",395,height*0.82);
text("Rechteckige Pinsel",395,height*0.91);
text("Hintergrund-Farbe",10,height*0.93);
}

//initialisiert farbenwert (standard = schwarz)
float r = -1;
float g = -1;
float b = -1;


//initialisiert pinselgrösse (standard = klein)
int groesse = 5;

//initialisiert pinselform (1 für kreis, 2 für rechteck)
int form = 1;

//initialisiert rechteckspinsel-grösse (standard = klein)
int groesseform = 5;

//initialisiert weicher pinsel
int weich = 500;


//initialisiert hintergrundfarbe
char hintergrund = 255;


//anfang schlaufe
void draw() { //anfang schleife


 
/*background(255);
 text(mouseX,mouseX,mouseY);
 text(mouseY,mouseX,mouseY-20);
*/


//setzt pinsel auf rot 
 if (mouseX >= 13 && mouseX <= 27 && mouseY >= height*0.826 && mouseY <= height*0.854 && mousePressed == true && mouseButton == LEFT){
   r = 255;
   g = 0;
   b = 0;
}

//setzt pinsel auf grün
if (mouseX >= 42 && mouseX <= 57 && mouseY >= height*0.826 && mouseY <= height*0.854 && mousePressed == true && mouseButton == LEFT){
   r = 0;
   g = 255;
   b = 0;
}

//setzt pinsel auf blau
if (mouseX >= 73 && mouseX <= 83 && mouseY >= height*0.826 && mouseY <= height*0.854 && mousePressed == true && mouseButton == LEFT){
   r = 0;
   g = 0;
   b = 255;
}

//setzt pinsel auf schwarz
if (mouseX >= 103 && mouseX <= 113 && mouseY >= height*0.826 && mouseY <= height*0.854 && mousePressed == true && mouseButton == LEFT){
   r = 0;
   g = 0;
   b = 0;
}

//setzt pinsel auf weiss
if (mouseX >= 133 && mouseX <= 143 && mouseY >= height*0.826 && mouseY <= height*0.854 && mousePressed == true && mouseButton == LEFT){
   r = 255;
   g = 255;
   b = 255;
}

//setzt pinsel auf pink
if (mouseX >= 163 && mouseX <= 173 && mouseY >= height*0.826 && mouseY <= height*0.854 && mousePressed == true && mouseButton == LEFT){
   r = 255;
   g = 0;
   b = 255;
  
}

//setzt pinsel auf gelb
if (mouseX >= 193 && mouseX <= 203 && mouseY >= height*0.826 && mouseY <= height*0.854 && mousePressed == true && mouseButton == LEFT){
   r = 255;
   g = 255;
   b = 0;
  
}

//setzt pinsel auf magenta
if (mouseX >= 223 && mouseX <= 233 && mouseY >= height*0.826 && mouseY <= height*0.854 && mousePressed == true && mouseButton == LEFT){
   r = 0;
   g = 255;
   b = 255;
  
}

//pinselgrösse gross  
if (mouseX >= 430 && mouseX <= 450 && mouseY >= height*0.84-10 && mouseY <=height*0.84+10 && mousePressed == true && mouseButton == LEFT){
   groesse = 20;
   form = 1;
   
}

//pinselgrösse mittel  
if (mouseX >= 410 && mouseX <= 420 && mouseY >= height*0.84-5 && mouseY <= height*0.84+5 && mousePressed == true && mouseButton == LEFT){
   groesse = 10;
   form = 1;
   
}

//pinselgrösse klein  
if (mouseX >= 397 && mouseX <= 402 && mouseY >= height*0.84-2.5 && mouseY <= height*0.84+2.5 && mousePressed == true && mouseButton == LEFT){
   groesse = 5;
   form = 1;
   
}

//rechteck-pinselgrösse gross  
if (mouseX >= 430 && mouseX <= 450 && mouseY >= height*0.92-10 && mouseY <= height*0.92+10 && mousePressed == true && mouseButton == LEFT){
   groesseform = 20;
   form = 2;
   
}
   
  //rechteck-pinselgrösse mittel  
if (mouseX >= 410 && mouseX <= 420 && mouseY >= height*0.92-5 && mouseY <= height*0.92+5 && mousePressed == true && mouseButton == LEFT){
   groesseform = 10;
   form = 2;
   
}

  //rechteck-pinselgrösse klein  
if (mouseX >= 395 && mouseX <= 400 && mouseY >= height*0.92-2.5 && mouseY <= height*0.92+2.5 && mousePressed == true && mouseButton == LEFT){
   groesseform = 5;
   form = 2;
   
}

//pinsel weich an, wenn man auf "weich an" klinkt (standard aus)
if(mouseX >= 302 && mouseX <= 318 && mouseY >= height*0.84-7.5 && mouseY <= height*0.84+7.5 && mousePressed == true && mouseButton == LEFT) {
    weich = 50;
  }
  
//pinsel weich aus, wenn man auf "weich aus" klickt
  if(mouseX >= 302 && mouseX <= 318 && mouseY >= height*0.9-7.5 && mouseY <= height*0.9+7.5 && mousePressed == true && mouseButton == LEFT) {
    weich = 500;
  }
 
  
  //setzt farbe auf schwarz
  if(mouseX >= 12 && mouseX <= 28 && mouseY >= height*0.96-7.5 && mouseY <= height*0.96+7.5 && mousePressed == true && mouseButton == LEFT) {
    hintergrund = 0;
    fill(hintergrund);
    rect(-1,-1,width,height-height*0.2);
  }
  
  //setzt hintergrundfarbe auf weiss
  if(mouseX >= 42 && mouseX <= 58 && mouseY >= height*0.96-7.5 && mouseY <= height*0.96+7.5 && mousePressed == true && mouseButton == LEFT) {
    hintergrund = 255;
    fill(hintergrund);
    rect(-1,-1,width,height-height*0.2);
  }
  
  

//pinsel (falls NICHT form2 bzw. rechteckspinsel gecklickt worden ist)
if (mouseX >= 0 && mouseX <= width && mouseY >= 0 && mouseY < height*0.8 && mousePressed == true && mouseButton == LEFT && form != 2){
  fill(r,g,b,weich);
  noStroke();
   ellipse(mouseX,mouseY,groesse,groesse);
}
//sonst eckiger pinsel
else {
  if (mouseX >= 0 && mouseX <= width && mouseY >= 0 && mouseY < height*0.8 && mousePressed == true && mouseButton == LEFT){  
  fill(r,g,b,weich);
  noStroke();
  rect(mouseX,mouseY,groesseform,groesseform);
}



// speichert durch drücken der taste 'S' ODER 's' das bild als jpg-datei ab
if (key == 's' || key == 'S') {
save("#.jpg");
String geklickt = "Sie haben das Meisterwerk gesichert!";
fill(255,0,0);
text(geklickt,width/2, height-3); //position passt sich immer der fensterbreite und -höhe an
}

}

}

void mousePressed(){
//zurücksetzten des malbereichs mit von links nach rechts bewegendem rechteck, sobald rechte maustaste gedrückt wird
if (mouseButton == RIGHT) {
  for(int bewegung = 0; bewegung < 400; bewegung++){
    fill(hintergrund);
rect(bewegung,-1,width,height-height*0.2);
if(bewegung == 400){
 bewegung = 0; 
}

}
    


}
}

