
void setup() {
  size(400,400);
  makeHouse();
  rectMode(CORNER);
} 

float Ax = 0;
float Ay = -75;
float Bx = 200;
float By = 50;
float Cx = 60;
float Cy = 135;
float Dx = 240;
float Dy = 200;
float a = 200;
float b = 100;
float c =180;
float d =90;
 
void draw() {
}
 
void mouseDragged() {
    a = a + 0.2*(mouseX-pmouseX);
    b = b + 0.2*(mouseX-pmouseX);
    c = c + 0.3*(mouseX-pmouseX);
    d = d + 0.3*(mouseX-pmouseX);
    Ax = Ax + 0.1*(mouseX-pmouseX);
    Ay = Ay + 0.1*(mouseY-pmouseY);
    Bx = Bx + 0.3*(mouseY-pmouseY);
    By = By + 0.3*(mouseX-pmouseX);
    Cx = Cx + 0.2*(mouseX-pmouseX);
    Cy = Cy + 0.2*(mouseY-pmouseY);
    Dx = Dx + 0.1*(mouseY-pmouseY);
    Dy = Dy + 0.1*(mouseX-pmouseX);
    makeHouse();
}
 
void makeHouse() {
  background(220);
  fill(0);
  quad(Ax,Ay,Ax-b/tan(20),Ay+b,Ax+a+b/tan(20),Ay+b,Ax+a,Ay);
  fill(255);
  rect(Ax,Ay+b,a,1.3*b);
  fill(200);
  rect(Ax+0.2*a,Ay+1.6*b,0.2*a,0.7*b);
  
  fill(0);
  quad(Bx,By,Bx-d/tan(20),By+d,Bx+c+d/tan(20),By+d,Bx+c,By);
  fill(255);
  rect(Bx,By+d,c,1.3*d);
    fill(200);
  rect(Bx+0.2*c,By+1.6*d,0.2*c,0.7*d);
  
  fill(0);
  quad(Cx,Cy,Cx-b/tan(20),Cy+b,Cx+a+b/tan(20),Cy+b,Cx+a,Cy);
  fill(255);
  rect(Cx,Cy+b,a,1.3*b);
  fill(200);
  rect(Cx+0.2*a,Cy+1.6*b,0.2*a,0.7*b);
  
  fill(0);
  quad(Dx,Dy,Dx-b/tan(20),Dy+b,Dx+a+b/tan(20),Dy+b,Dx+a,Dy);
  fill(255);
  rect(Dx,Dy+b,a,1.3*b);
    fill(200);
  rect(Dx+0.2*a,Dy+1.6*b,0.2*a,0.7*b);

}


