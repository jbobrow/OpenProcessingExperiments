
void setup ()

{
 size(700,700);
 background(255);
 smooth();
}

void draw (){
 
for (int posx = 10; posx<= 772; posx = posx+7)

for (int posy = 10; posy<= 772; posy = posy+7)

 




{
noFill();
 strokeWeight(0);
  stroke(150,11,3,20);
ellipse(posx, mouseY,15,15);

  strokeWeight(0);
  stroke(290,250,10);
ellipse(posx, mouseY,15,51);
 strokeWeight(0);
  stroke(#02B999);
ellipse(posx, mouseY,15,15);

 strokeWeight(0);
  stroke(120,50,3);
ellipse(posx, mouseY,51,15);

// j'ai ajouté la posx dans le couple mose x mouse y






}



}


