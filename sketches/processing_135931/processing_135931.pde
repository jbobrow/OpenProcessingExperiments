
//Jordana Bungard
Feb 24, 14
Squares(Ness)
size (550,550);
background(150);
fill(255,200);
float d=20;
for (int a = 15; a < 500; a = a+30) {
for (int c = 20; c < 350; c = c+25) {
  rect(a, c, 20, 20);
}
}
 fill(255,200);

for (int a = 100; a < 500; a = a+10) {
for (int b = 310; b < 500; b = b+20)
rect (random(a)*3 ,b, 20, 20);
pushMatrix();
  rotate(a*2);
  translate(5,15); 
  popMatrix();}


