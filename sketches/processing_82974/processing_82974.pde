
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
  stroke(106,255,176,20);
ellipse(posx, mouseY,130,15);

  strokeWeight(0);
  stroke(255,243,106);
ellipse(posx, mouseY,150,150);
 strokeWeight(0);
  stroke(2,186,201);
ellipse(posx, mouseY,15,130);

 strokeWeight(0);
  stroke(3,236,255);
ellipse(posx, mouseY,150,150);

// j'ai ajouté la posx dans le couple mose x mouse y






}



}


