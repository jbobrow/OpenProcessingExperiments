
void setup ()
{
  size (600, 600, P3D);
  noCursor ();
  noStroke ();
}
void draw ()
{
 objecty (); 
 objecty2 ();
 texty (); 
}
void objecty ()
{
  fill (40,40,255);
background (155);
ambientLight(200, 200, - 200 );
directionalLight (51, 102, 126, -1, 0, 0);
translate(width*.6, height*.6, 0); 
rotateY(radians (mouseX*1.5));
rotateX(radians (mouseY*1.5));
box(40);
text ( " Carl is the best !  ", 50,0, 500,500, 0 ); 
rect ( 0, 50, 100, 100);


translate(58, 48, 0); 
rotateY(0.5);
box(40, 20, 50);

translate (-98, -98, 0);
rotateY (0.5);
box(40, 20, 50);

translate(-98, 98, 0);
sphere (10);

translate(140, 40, 0);
sphere (20);
////////////////////////////////////////
translate(158, 48, 0); 
rotateY(0.5);
box(40, 20, 50);


translate (-198, -98, 0);
rotateY (0.5);

fill (255, 0, 0 ) ; 
box(40, 20, 50);

text ( " Carl is the best !  ", 0,0, 500,500, 0 ); 
translate(-98, 198, 0);
sphere (15);
ellipse ( 200, 200, 100, 100); 

fill (40,40,255);



translate(140, 140, 0);
sphere (25);
/////////////////////////
translate(-108, 48, 0); 
rotateY(0.5);
box(40, 20, 50);
text ( " Carl is the best !  ", 0,0, 500,500, 0 ); 

translate (+148, -98, 0);
rotateY (0.5);
box(40, 20, 50);
text ( " Carl is the best !  ", 0,0, 500,500, 0 ); 


translate(-98, -148, 0);
sphere (40);

translate(-100, 140, 0);
sphere (30);
}
 
void objecty2 ()
{
  noFill (); 
  stroke (2);
  box (3000);
}

void texty ()
{


}
