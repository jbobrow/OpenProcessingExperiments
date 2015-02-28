
//Emanuele Reis - Exercício Reforço 6
void setup (){
size(200,200);
background(0);
}

int x;
int y;

 void draw (){
   noFill();
 stroke(#FFBC00);
        ellipse (100,120,7,7);
        ellipse (130,120,7,7);

  stroke (255);
for (int x=40; x<190; x=x+30){
    for (int y=60; y<160; y=y+30)
      ellipse (x, y, 7,7);
  for (int a=50; a<160; a=a+30)
     for (int b= 60; b<170; b=b+30)
       rect (a, b, 10,1);
    for ( int i=40; i<190; i=i+30)
      for (int j= 70; j<160; j=j+30)
        rect (i, j, 1, 10);
 }
   }
