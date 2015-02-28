
//Brennda
size(200,200);
int janx=100;
fill(10,65,65);
rect(janx+50,0,10,10);
fill(17,123,123);
rect(janx+50,50,10,10);
fill(22,163,163);
rect(janx+50,100,10,10);
fill(35,224,224);
rect(janx+50,150,10,10);
fill(181,244,244);
rect(janx+50,190,10,10);
fill(200,0,150);
ellipse(40,40,75,75);
pushStyle();  // Start a new style
strokeWeight(8);
fill(204, 0, 50);
ellipse(100, 150, 33,33);  // Left-middle circle
pushStyle();  // Start another new style
stroke(0, 102, 153);
ellipse(30, 146, 44, 44);  // Right-middle circle 
translate(0,100);
noFill();
//curve(30,11,55,130,55,170,30,183);  fica em cima da ellipse azul
int steps = 6;
for (int i = 0; i <= steps; i++) {
  float t = i / float(steps);
  float x = curvePoint(5, 50,50, 15, t);
  float y = curvePoint(26, 24, 61, 65, t);
  //ellipse(x, y, 5, 5);
  float tx = curveTangent(5, 73, 73, 15, t);
  float ty = curveTangent(26, 24, 61, 65, t);
  float a = atan2(ty, tx);
  a -= PI/2.0;
  line(x, y, cos(a)*8 + x, sin(a)*8 + y);
}













