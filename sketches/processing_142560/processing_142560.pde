
/* @pjs preload="bulb.jpg, sole.jpg"; */
size(475, 450);
PImage bulb = loadImage ("bulb.jpg");
PImage sole = loadImage ("sole.jpg");
 
image (bulb, 0,0);
image (sole, 0,450);
 
 
copy (sole, 25,0, 25,450, 25,0, 25,450 );
copy (sole, 75,0, 25,450, 75,0, 25,450 );
copy (sole, 125,0, 25,450, 125,0, 25,450 );
copy (sole, 175,0, 25,450, 175,0, 25,450 );
copy (sole, 225,0, 25,450, 225,0, 25,450 );
copy (sole, 275,0, 25,450, 275,0, 25,450 );
copy (sole, 325,0, 25,450, 325,0, 25,450 );
copy (sole, 375,0, 25,450, 375,0, 25,450 );
copy (sole, 425,0, 25,450, 425,0, 25,450 );



