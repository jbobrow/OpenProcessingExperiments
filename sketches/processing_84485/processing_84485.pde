
void setup()
{
size(500, 500);
background(255,240,160);
 smooth();
 translate(50,50);
 scale(0.8);
 fleur();

 translate(-200,-50);
 scale(2.5);
 fleur();
 
 translate(150,60);
 scale(2.5);
 fleur();
 
 translate(-130,-70);
 scale(3);
 fleur();
 
 translate(130,120);
 scale(4);
 fleur();
 
 translate(-60,-90);
 scale(3);
 fleur();
 //a gauche
 translate(-160,0);
 scale(1);
 fleur();
 translate(-60,50);
 scale(1.5);
 fleur();
 translate(30,-90);
 scale(3);
 fleur();
 translate(80,30);
 scale(1.5);
 fleur();
}

void fleur(){
  noStroke();
  fill(155,180,200,120);
  scale(0.5);
  for (int i=0;i<360;i=i+30){
  rotate(radians(45)); 
  arc(0,5,150,60,0,PI/3);
   }
}


