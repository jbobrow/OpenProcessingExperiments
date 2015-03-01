
/*-----------------------------
For & While Doodle
Created 4 February 2015
by Catherine Lee
-----------------------------*/

size(500,500);
background(0,100,200);

//thicker lines
int i = 0;
while (i < 150) {
  strokeWeight(1);
  line(0,0,500,i+40);
  line(0,0,i+40,500);
  i = i+10;
}

//thinner lines
int i2 = 0;
while (i2<550) {
  strokeWeight(.5);
  line(i2+40,0,0,500); //left side
  line(500,0,0,i2+40); //right side
  i2 = i2+10;
}  



//squares
for (int a = 0; a < width; a = a+5) {
   strokeWeight(.5);
   stroke(200,255,10);
   rect(a,a,a,a);
   fill(0,100+a,200+a,10);
 }

