
//-------------------------------------------------------------------------------
// variables 
float x;
float y;
//-------------------------------------------------------------------------------
// corps
size(400,400);
smooth();
//-------------------------------------------------------------------------------
// variables de référence à la moitié de la fenetre
x = width/2;
y = height/2;
//-------------------------------------------------------------------------------
// arriere-plan
background(0);
//-------------------------------------------------------------------------------
// variable (diametre de yeux)
int diametre = 50; 

//-------------------------------------------------------------------------------
// corps
fill(255,100,100); 
noStroke(); 
ellipse(y,x+75,50,50);
ellipse(y+10,x+75,50,50);
ellipse(y+20,x+85,50,50);
ellipse(y+30,x+95,50,50);
ellipse(y+10,x+95,50,50);
ellipse(y,x+105,50,50);
ellipse(y-10,x+95,50,50);
ellipse(y-20,x+85,50,50);
ellipse(y-30,x+75,50,50);
ellipse(y-30,x+85,50,50);
ellipse(y-40,x+85,50,50);
ellipse(y-50,x+95,50,50);
ellipse(y-50,x+85,50,50);
ellipse(y-60,x+75,50,50);
ellipse(y-60,x+65,50,50);
ellipse(y-40,x+55,50,50);
ellipse(y-30,x+55,50,50);
ellipse(y-20,x+45,50,50);
ellipse(y-10,x+45,50,50);
ellipse(y,x+35,50,50);
ellipse(y+10,x+45,50,50);
ellipse(y+20,x+55,50,50);
ellipse(y+30,x+65,50,50);
ellipse(y+40,x+45,50,50);
ellipse(y+50,x+45,50,50);
ellipse(y-70,x+45,50,50);
ellipse(y,x+35,50,50);
ellipse(y,x+15,50,50);
ellipse(y,x+5,50,50);
ellipse(y-20,x+35,50,50);
ellipse(y-20,x+45,50,50);
//-------------------------------------------------------------------------------
// tentacules gauche
fill(255,100,100); 
ellipse(y - diametre,y-100,25,25);
ellipse(y - 50,x-90,25,25);
ellipse(y - 50,x-80,25,25);
ellipse(y - 60,x-70,25,25);
ellipse(y - 70,x-60,25,25);
ellipse(y - 80,x-50,25,25);
ellipse(y - 90,x-40,25,25);
ellipse(y - 90,x-30,25,25);
ellipse(y - 90,x-20,25,25);
ellipse(y - 100,x-10,25,25);
ellipse(y - 95,x,25,25);
ellipse(y - 85,x+10,25,25);
ellipse(y - 75,x+20,25,25);
//-------------------------------------------------------------------------------
// tentacules centre
fill(255,100,100); 
ellipse(y,y-100,25,25);
ellipse(y,x-90,25,25);
ellipse(y,x-80,25,25);
ellipse(y,x-70,25,25);
ellipse(y,x-60,25,25);
ellipse(y+10,x-50,25,25);
ellipse(y+20,x-40,25,25);
ellipse(y+10,x-30,25,25);
ellipse(y,x-20,25,25);
//-------------------------------------------------------------------------------
// tentacules droite
fill(255,100,100); 
ellipse(y + 50,x-100,25,25); 
ellipse(y + 50,x-90,25,25); 
ellipse(y + 50,x-80,25,25); 
ellipse(y + 60,x-70,25,25); 
ellipse(y + 70,x-60,25,25); 
ellipse(y + 80,x-50,25,25); 
ellipse(y + 70,x-40,25,25); 
ellipse(y + 80,x-30,25,25); 
ellipse(y + 80,x-20,25,25); 
ellipse(y + 90,x-10,25,25); 
ellipse(y + 80,x,25,25);
ellipse(y + 80,x+10,25,25);
ellipse(y + 80,x+20,25,25);
ellipse(y + 70,x+30,25,25);

//-------------------------------------------------------------------------------
// yeux contour
fill(255,100,100); 
noStroke(); 

ellipse(y - diametre,y-100, diametre,diametre);
ellipse(y,y-100,diametre,diametre);
ellipse(y + 50,y-100,diametre,diametre); 
//-------------------------------------------------------------------------------
// yeux blanc     
fill (255,255,255);
ellipse(y - diametre,y-100,37,37);
ellipse(y,y-100,37,37);
ellipse(y + 50,y-100,37,37);                                 
//-------------------------------------------------------------------------------
// yeux noir  
fill (0,0,0);
ellipse(y - diametre,y-100,10,10);
ellipse(y,y-100,10,10);
ellipse(y + 50,y-100,10,10); 
//-------------------------------------------------------------------------------
// dégradé pris dans l'exemple du cours
smooth();
   
noStroke();
 
float d = width;
float ratio = 0.9;
 
while ( d > 5 ) {

   fill ( 255 - d / width * 100,100,100 );
 ellipse(y,x+75,d*0.07,d*0.07);
  fill ( 255 - d / width * 100,100,100 );
ellipse(y+10,x+75,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y+20,x+85,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y+30,x+95,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y+10,x+95,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y,x+105,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y-10,x+95,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y-20,x+85,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y-30,x+75,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y-30,x+85,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y-40,x+85,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y-50,x+95,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y-50,x+85,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y-60,x+75,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y-60,x+65,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y-40,x+55,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y-30,x+55,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y-20,x+45,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y-10,x+45,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y,x+35,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y+10,x+45,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y+20,x+55,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y+30,x+65,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y+40,x+45,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y+50,x+45,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y-70,x+45,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y,x+35,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y,x+15,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y,x+5,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y-20,x+35,d*0.07,d*0.07);
 fill ( 255 - d / width * 100,100,100 );
ellipse(y-20,x+45,d*0.07,d*0.07);
   d = d * ratio;
}
//-------------------------------------------------------------------------------
//bouche
stroke(0);
strokeWeight(20);
line(y-40,y+60,x+20,x+60);
//-------------------------------------------------------------------------------
//dents
stroke(255);
strokeWeight(7);
line(y-40,y+60,x+20,x+60);

stroke(0);
strokeWeight(2);
line(x,x+65,y+10,y+55);
line(x,x+65,y,y+55);
line(x-10,x+65,y-10,y+55);
line(x-10,x+65,y,y+55);
line(x-20,x+65,y-20,y+55);
line(x-20,x+65,y-10,y+55);
line(x-30,x+65,y-30,y+55);
line(x-30,x+65,y-20,y+55);
line(x-40,x+65,y-40,y+55);
line(x-40,x+65,y-30,y+55);
line(x+10,x+65,y+10,y+55);
line(x+10,x+65,y+20,y+55);
line(x+20,x+65,y+20,y+55);
//-------------------------------------------------------------------------------
//ligne en-dessous de la bouche
stroke(0);
strokeWeight(2);
line(y-35,y+75,x+10,x+75);
line(y-20,y+80,x,x+80);





