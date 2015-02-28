
// Configuration du cadre
size ( 400,400 );
smooth ();
background ( 125,125,125 );

// Variable de position
int x =199;
int y =150;

//coup du monde
strokeWeight (4);
fill ( 255 );
rect ( x-5,y+65, 10, 10 );
rect ( x-5,y+55, 10,10);

// tête du monstre
strokeWeight ( 2 );
stroke ( 255 );
fill ( 255 );
ellipse ( x, y-20, 95,95 );
ellipse ( x, y, 75, 110);

// yeux du monstre
fill ( 0 );
ellipse ( x-20, y-22, 25, 25 );
ellipse ( x+20, y-22, 25, 25 );
stroke (214, 6, 6);
fill (214,6,6);
ellipse ( x-20, y-22, 10,10 );
ellipse ( x+20, y-22, 10,10 );
fill ( 0 );
ellipse ( x-20, y-22, 5, 5 );
ellipse ( x+20, y-22, 5, 5 );

// nez du monstre
strokeJoin ( ROUND );
stroke ( 0 );
fill ( 0 );
triangle ( x,y-5, x-5, y+10, x+5, y+10 );

//bouche du monstre
strokeWeight ( 4 );
line (x-20,y+25, x+20, y+25);
int i =0;
while (i< 4){
int espacement = 10*i;
line( x-15+ espacement,y+30, x-15+ espacement, y+20); 
i++ ;
}

  
//bras gauche du monstre
fill ( 255 );
noStroke ( );
quad (x-58, y+75, x-40, y+ 100, x-110,  y+120, x-110, y+90);
quad ( x-100, y+90, x-110, y+120, x-140, y+120, x-140, y+90 );

//chemise du monstre
fill ( 255 );
noStroke ();
rect ( x-57,y+75, 115, 125 );

//bras droite
fill ( 255 );
noStroke ( );
ellipse ( x+60, y+89, 35, 30 );
quad ( x+50, y+78, x+75, y+80, x+88, y+120, x+63, y+120 );
rect ( x+63, y+120, 25, 60 );
fill ( 0 );
ellipse ( x+74, y+185, 35 , 30 );

//couteau du monstre 
noStroke ();
fill ( 134,79,37 );
rect ( x-155, y+85, 10,45 );
fill ( 188, 187, 186 );
triangle ( x-160, y+132, x-160, y+200, x-138, y+132 ); 
fill ( 147,146,145 );
stroke ( 2);
line( x-160, y+200, x-138, y+132 );

// main gauche
fill ( 0 );
ellipse ( x-148, y+105,  40, 30 ); 

//poche de la chemisse
noFill ();
stroke ( 2);
beginShape ( );
vertex ( x+20, y+100 );
vertex (x+40, y+100 );
vertex (x+40, y+125 );
vertex (x+30, y+130 );
vertex (x+20, y+125 );
vertex (x+20, y+100 );
endShape ();

//ceinture du monstre
noStroke ( );
fill ( 214, 6, 6 );
rect ( x-57,y+200,114, 10);
fill ( 0);
ellipse (x, y+205, 15, 15 );

//Pentalon du monstre
noStroke ();
fill (26, 6, 214 );
rect( x-57, y+210, 57, 60 );
fill ( 26, 6, 214 );
rect( x, y+210, 57, 60 );
stroke ( 4 );
line ( x, y+210, x, y+250 );


//cravate du monstre
fill ( 168, 6, 214 );
noStroke ();
beginShape ();
vertex (x-2, y+75 );
vertex (x-10, y+190 );
vertex (x, y+210);
vertex (x+10, y+190);
vertex (x+2, y+75 );
endShape (); 
triangle ( x-17, y+76, x+17, y+76, x, y+86 );

//Noeud papillon du monstre
fill ( 214, 6, 6 );
triangle ( x, y+75, x-30, y+65, x-30, y+85 );
triangle ( x, y+75, x+30, y+65, x+30, y+85 );

                
                
