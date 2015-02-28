
// Response to Atilla Bilgili's "Rasgele Noktalar"

int i,w,h,b,s; 


void setup() { 
  size(400,400); 
  background (120); 
  noStroke (); 
  frameRate(25);
  w=40; // kareler arasindaki yatay uzaklik
  h=40; // kareler arasindaki dikey uzaklik
  b=8; //karenin ebati
  s=20 ; // ust ve soldan kaydirmaca
} 

void draw() 
{
  if (random(100)>95) 
    fill(0); // % 5 olasılıkla siyah kare çiz
  else if (random(100)>80) 
    fill(120); // % 20 olsılıkla bir kare yok et. (gri kare ciz)
  else 
    fill(255); // diger tum olasiliklarda beyaz kare ciz.
   
  float x = int( random ( width  / w )) * w; 
  float y = int( random ( height / h )) * h;
  
  rect ( s + x ,s + y , b , b ); 
} 





