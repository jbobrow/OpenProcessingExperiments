
 void setup ()

{
 size(500,700);
 background(255);
 smooth();
}

void draw (){
 
for (int posx = 1; posx<= 504; posx = posx+2)
for (int posy = 1; posy<= 704; posy = posy+2)

for (int posx1 = 1; posx1<= 504; posx1 = posx1+2)
for (int posy1 = 200; posy1<= 400; posy1 = posy1+2) 
{


noFill();
stroke(255,49,231,20);
rect(posx,posy,200,200);

noFill();
stroke(200,240,230,30);
rect(posx,posy,200,200);

noFill();
stroke(10,240,230,30);
rect(posx1,posy1,200,200);








}
}


