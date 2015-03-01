
void setup() {
  size(1000, 955);
}

void draw() {

  background(200);
  
 for (int yt =0; yt< 1000; yt =yt + 320)
 {
  for (int xt = -156; xt< 800; xt = xt + 400)
    
{
   
//leaf orange
fill(#DE6E28);
noStroke();
  pushMatrix();
  translate(xt, yt);
bezier(250, 10, 80, 75, 210, 300, 250, 310);//lhs
popMatrix();
  pushMatrix();
  translate(xt, yt);
bezier(250, 10, 390, 130, 370, 260, 250, 310);//rhs
popMatrix();
stroke(220);
strokeWeight(4);
  pushMatrix();
  translate(xt, yt);
bezier(250, 20, 190, 100, 290, 180, 250, 320);//spine
popMatrix();
int steps = 7;
for (int i = 1; i < steps; i++) {
  float t = i / float(steps);
  float x = bezierPoint(250, 190, 290, 250, t);
  float y = bezierPoint(10, 100, 180, 300, t);
  float tx = bezierTangent(250, 190, 290, 250,t);
  float ty = bezierTangent( 10, 100, 180, 300, t);
  float a = atan2(ty, tx);
   a -= HALF_PI;
   strokeWeight(1);
   stroke(200);
     pushMatrix();
  translate(xt, yt);
  line(x, y, cos(a)*98 + x, sin(a)*80 + y);
  line(x, y, cos(a)*-90 + x, sin(a)*-60 + y);
popMatrix();

 for (int ytg =0; ytg< 1000; ytg =ytg + 320)
 {
  for (int xtg = 45; xtg< 1500; xtg = xtg + 400)
    
{
   
 // for  (int yt = 0; yt < 900; yt = + 300)
  //{

//leafgreen
fill(#2CBF80);
noStroke();
  pushMatrix();
  translate(xtg, ytg);
bezier(250, 10, 80, 75, 210, 300, 250, 310);//lhs
popMatrix();
  pushMatrix();
  translate(xtg, ytg);
bezier(250, 10, 390, 130, 370, 260, 250, 310);//rhs
popMatrix();
stroke(220);
strokeWeight(4);
  pushMatrix();
  translate(xtg, ytg);
bezier(250, 20, 190, 100, 290, 180, 250, 320);//spine
popMatrix();
int stepsg = 7;
for (int ig = 1; ig < stepsg; ig++) {
  float tg = ig / float(steps);
  float xg = bezierPoint(250, 190, 290, 250, tg);
  float yg = bezierPoint(10, 100, 180, 300, tg);
  float txg = bezierTangent(250, 190, 290, 250,tg);
  float tyg = bezierTangent( 10, 100, 180, 300, tg);
  float ag = atan2(tyg, txg);
   ag -= HALF_PI;
   strokeWeight(1);
   stroke(200);
     pushMatrix();
  translate(xtg, ytg);
  line(xg, yg, cos(ag)*98 + xg, sin(ag)*80 + yg);
  line(xg, yg, cos(ag)*-90 + xg, sin(ag)*-60 + yg);
popMatrix();
}
}
}
}
}
}

}


