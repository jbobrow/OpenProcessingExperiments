
void setup ()

{
 size(700,700);
 background(255);
 smooth();
}

void draw (){
 
for (int posx = 10; posx<= 772; posx = posx+70)

for (int posy = 10; posy<= 772; posy = posy+70)

 




{
noFill();
 strokeWeight(0);
  stroke(250,11,3,20);
ellipse(posx, mouseY,50,50);

  strokeWeight(0);
  stroke(2,250,10);
ellipse(posx, mouseY,150,150);
 strokeWeight(0);
  stroke(187,250,3);
ellipse(mouseX, mouseY,125,125);

 strokeWeight(0);
  stroke(40,250,3);
ellipse(mouseX, mouseY,125,125);






}



}


