
void setup ()

{
 size(700,700);
 background(255);
noStroke();
 smooth();
}

void draw (){
 


  

 
for (int posx1 = 1; posx1<= 695; posx1 = posx1+11)

for (int posy1 = 1; posy1<= 695; posy1 = posy1+11)

{


  fill(231,255,174,10);
 ellipse(posx1, posy1, 15, 15);
  rotate(PI/8);
  
  
  fill(131,155,174,10);
 ellipse(posx1, posy1, 15, 15);
  rotate(PI/8);
  
   fill(231,155,74,10);
 ellipse(posx1, posy1, 15, 15);
  rotate(PI/8);
  

  
  

 
}

}




