

void draw() {
  stroke(225,0,0);
 
  line(mouseX, mouseY,600,405);
 
}
float R = 255;
float G = 255;
float B = 0;
float incremento = +1;
float mincol = 0, maxcol = 255;
 
void setup(){
//random colors credit to rebirth on processing forums
size (800,800);
 
 
 
 
 
 

 
 
 
 background(R,G,B);
 R += incremento;
 if (R > maxcol)
 incremento = -.5;
 else if (R < mincol)
 incremento = random(2);
   B += incremento;
 if (B > maxcol)
 incremento = -1;
 else if (B < mincol)
 incremento = +5;
   G += incremento;
 if (G > maxcol)
 incremento = -1;
 else if (G < mincol)
 incremento = +10;
 frameRate(150);

//head
fill(255,179,144);
ellipse(600,230,260,350);
strokeWeight(10);

//hair
fill(0,0,0);
ellipse(600,100,200,100);
ellipse(500,170,90,130);

//eyes and mouth
fill(255,255,255);
strokeWeight(2);
//mouth
ellipse(630,310,150,60);
fill(0,0,0);
ellipse(590,290,110,40);
ellipse(680,290,110,40);
//eyes
fill(255,255,255);
ellipse(580,190,60,70);
ellipse(680,190,60,70);
fill(0,0,0);
ellipse(580,190,30,40);
ellipse(680,190,30,40);  
 



}




