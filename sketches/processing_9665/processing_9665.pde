

void setup ()
{
  
size( 400, 400 );  

  
  smooth();

noStroke();
frameRate (8);  


ellipseMode(CENTER); //ellipsen zentriert
}


// GLOBAL
int lid;
int pupille;
int augen;

int monsterfarbe;
int hoehe;

//PImage bg;



void draw () {
 
  background (125); 
 // bg = loadImage ("05.jpg");
  
  
//image (bg, 0,0);
  
  //MONSTER

 
 
 if (mousePressed)
 {

 

   lid = 65;
   augen =55;

   pupille = 25;
   hoehe = 210;
   
   monsterfarbe = (#3E5F13);

background (0,random(255),0);
 
 }
 
 else
 {

   
  
     lid = 55;
  augen =50;
    pupille = 20;
    hoehe= 200;
 
monsterfarbe = (#FF0000);
   
 
 }
 
 //KOERPER
   fill (monsterfarbe);      //ROT
      ellipse (200,250,300,hoehe); 
      
      //MUND
        fill (255);      //weiss
      ellipse (200,200,150,50); 
 
 //FUEHLER
  fill (monsterfarbe);      //ROT
  rect (148,100,4,60); 
 rect (248,100,4,60); 
 
 

  fill (monsterfarbe);      //ROT
   ellipse (250,100,lid,lid); 
  ellipse (150, 100, lid, lid);

  
  fill (255);      //WEISS
   ellipse (250,100,augen,augen); 
  ellipse (150, 100, augen, augen);
  
  fill (0);    //SCHWARZ
  ellipse (250,100,pupille,pupille);
   ellipse (150,100,pupille,pupille);
   
   //Tentakel
   stroke (monsterfarbe);
   strokeWeight (10);
   
   line (random(200,300),250, random(400),450);
      line (random(200,300),250, random(400),450);
         line (random(200,300),250, random(400),450);
            line (random(200,300),250, random(400),450);
               line (random(200,300),250, random(400),450);
                  line (random(200,300),250, random(400),450);
                     line (random(200,300),250, random(400),450);
                        line (random(200,300),250, random(400),450);
                           line (random(200,300),250, random(400),450);
                              line (random(200,300),250, random(400),450);
                                 line (random(200,300),250, random(400),450);
                                 
                                 
                                 
 strokeWeight (5);
line (random(200,300),250, random(400),450);
line (random(200,300),250, random(400),450); 
line (random(200,300),250, random(400),450);
line (random(200,300),250, random(400),450); 
line (random(200,300),250, random(400),450);
line (random(200,300),250, random(400),450); 
line (random(200,300),250, random(400),450);
line (random(200,300),250, random(400),450); 
  
  // line (250,250,random(200),400);
   
   
   
   noStroke();
 

  
  //FLECKEN
  
  fill (255,123);    //WEISS; TRANSPARENT
  ellipse (250,300,20,20);
    ellipse (225,300,30,30);
  ellipse (175,250,30,30);

//ellipse mousebewegung
//ellipse( mouseX, mouseY, 15, 15 );


//    filter (BLUR, 2);

/*
float [ ] wrte = new float [width]; //leere liste mit länge "width" anlegen

for (int i=0; i<wrte.length; i=i+10)
{
line(i-1, wrte [i-1], i, wrte[i]); //lesen
}
*/


}


/*
 rect( r, r, width-r2, height-r2 );               // rechteck malen (x,y, breite, höhe)
 
 for ( int i = r; i <= width-r; i = i+s )         // eine schleife (mit zähler "i")
 {
     line( i, r, r, i );                          // linien malen
     line( width-i, width-r, width-r, width-i );
 }
 
 */



