
/*Mandala
Alexius Castilleja
Created: Sept. 15th, 2010
*/

void setup(){
  size(600, 600);
  background(0);

noFill();
smooth();
color infuse1 = color ( 230, 247, 5, 150);
  color strk = color(255);
  for (int n=0; n<10; n++){
  polyStar(width/2, height/2, 10, 100, 200, infuse1, strk, .2, PI/n);
  }
noStroke();
fill (49, 3, 52, 65);
ellipse( 300, 300, 300, 300);
fill (49, 3, 52, 64);
ellipse( 300, 300, 360, 360);
fill (49, 3, 52, 63);
ellipse( 300, 300, 420, 420);
fill (49, 3, 52, 62);
ellipse( 300, 300, 480, 480);
fill (49, 3, 52, 50);
ellipse( 300, 300, 520, 520);


  color infuse2 = color ( 230, 247, 5, 150);
  color sc = color(255);
  for (int n=0; n<5; n++){
  polyStar(width/2, height/2, 4, 100, 50, infuse2, sc, .2, PI/n);
  }

for (int m=0; m<6; m++){
  color infuse = color ( 242, 7, 7, 150);
  color bounds = color(m*2, 9, 152);
  smooth();
  polytri( width/2+m, height/2-18*m, 3, m*12, infuse, bounds, .9, 29*PI/180.0);
}
for (int m=0; m<6; m++){
  color infuse = color ( 242, 7, 7, 150);
  color bounds = color(m*2, 9, 152);
  smooth();
  polytri( width/2+m, height/2+18*m-1, 3, m*12, infuse, bounds, .9, PI/2.0);
}

}










