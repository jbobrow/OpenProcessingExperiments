
float col = 0;
float g;
float b;
float r;
float ran;

void setup () {
  size (600,600); background (255);  }
  
void draw () 
{
  r =255;
  g =240;
  b = 200;
  
  
  
  fill (255,0,0);
  rect (20,550,20,20);
  fill (0,255,0);
  rect (50,550,20,20);
  fill (0,0,255);
  rect (80,550,20,20);
  fill (random(0,250),random (0,250),random (0,250));
  rect (110,550,20,20);
  
  fill (random (0,255),random (0,255),random (0,255));
  
  if (col == r) {fill (255,0,0);}
  if (col == g) {fill (0,255,0);}
   if (col == b) {fill (0,0,200);}
   if (col == ran) {fill(random(0,250),random (0,250),random (0,250));}
   
  
// assigns shape to pen   
if(key=='c') { ellipse (mouseX, mouseY,10,10);}    
if(key=='s') { rect(mouseX, mouseY, 10, 10);}
if (key=='t') {triangle (mouseX, mouseY,mouseX-10,mouseY+10,mouseX+10,mouseY+10);}

//assigns color to pen
if (mouseX >=20 && mouseX <= 50 && mouseY >=550) {col = r; }
if (mouseX >=60 && mouseX <=89 && mouseY >=550) {col = g; }
if (mouseX >=90 && mouseX <=119 && mouseY >=550) {col = b; }
if (mouseX >=120 &&mouseX <=160 && mouseY >=550) {col = ran; }

fill (255);
rect (0,0,600,100);
rect (0,530,600,70);
 fill (255,0,255);
  rect (20,20,40,40);
  fill (0);
  text ("S key", 22,80);
  text ("t key", 80, 80);
  text ("c key", 120,80);
  text ("PAINT by Jake F", 300, 50);
  
  
     fill (255,0,255);
  triangle (90,20,85,60,95,60);
  ellipse (140,40,40,40); 
   
  
  
  
  
  fill (255,0,0);
  rect (20,550,20,20);
  fill (0,255,0);
  rect (50,550,20,20);
  fill (0,0,255);
  rect (80,550,20,20);
  fill (random(0,250),random (0,250),random (0,250));
  rect (110,550,20,20);

  
}


