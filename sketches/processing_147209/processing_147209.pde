
int wy = 0;
int wx = 0;


void setup ()
{
  size (400,400);
}
void draw ()
{
  background (#0000FF);
//Creeper
fill(#00FF00);
if(keyPressed){
if(key == 'f'|| key == 'F'); 
fill(255);}
rect (0,0,100,100);
fill(#000000);
rect (20,20,20,20);
rect (60,20,20,20);
rect (20,60,20,30);
rect (60,60,20,30);
rect (40,40,20,40);

 


//Enderman
fill(#000000);
if(keyPressed){
  if(key == 't' || key == 'T');
  fill(#0000FF);}
rect (300,0,100,100);
fill(#FF00FF);
if(keyPressed){
  if(key == 't' || key == 'T');
  fill(#0000FF);}
rect (310,30,30,20);
rect (360,30,30,20);


//Wither
fill(#000000);
pushMatrix();
if (key == 'w')  { wy = wy -1 ; wy--;}
if (key == 's') { wy = wy+1 ; wy++; }
if (key == 'a') { wx = wx -1 ; wx--;}
if (key == 'd') { wx = wx+1 ; wx++;}
 translate (wx,wy);
rect (0,300,100,100);
fill(#FFFFFF);
rect (10,320,30,20);
rect (60,320,30,20);
rect (20,360,60,20);
popMatrix();

//Dirt block
fill(#663300);
rect (120,240,160,160);
fill(#00FF00);
rect (120,240,160,50);


//Cow
fill(#663300);
rect (300,300,100,100);
fill(#000000);
rect (310,320,20,20);
rect (370,320,20,20);
fill(#FF66FF);
rect (320,360,60,40);
fill(#000000);
rect (330,370,10,20);
rect (360,370,10,20);
}
