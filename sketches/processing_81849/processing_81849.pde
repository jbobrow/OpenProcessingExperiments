
 void setup ()

{
 size(400,400);
 background(255);
 smooth();
}

void draw (){
 
for (int posx = 5; posx<= 475; posx = posx+50)

for (int posy = 5; posy<= 475; posy = posy+50)

 
for (int pos2x = 28; pos2x<= 475; pos2x = pos2x+50)

for (int pos2y = 28; pos2y<= 475; pos2y = pos2y+50)

{
noStroke();
fill(0,0,70,50);
rect(posx,posy,20,20);
fill(255);
rect(pos2x,pos2y,20,20);


fill(#F7E005, 30);
rect(posx, posy, 44, 44);

}



}



