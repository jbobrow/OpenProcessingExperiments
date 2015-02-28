
void setup() {
  size(1200, 1200);
  background(30);
  frameRate(90);
}


float angle, angle_bis;
int r, v, b = 0;
float decalage = 0;


void draw() {
println(frameRate);
  angle +=0.005; //définit la valeur de l'angle de rotation de la line
  angle_bis +=0.1; //définit la valeur de l'angle de rotation des rotations précédantes

  r +=3;
  v +=0.75;
  b +=1;
  decalage +=0.5; //décale de plus en plus les line
  pushMatrix();
  translate(width/2, height/2);
  pushMatrix();
  rotate(angle_bis);
    translate(10, 0);
    pushMatrix();
    translate(20, decalage);
    rotate(angle);
    stroke(r, v, b);
    line(0, 0, 20, 0);
    popMatrix();
  
    pushMatrix();
    translate(50, decalage);
    rotate(angle);
    stroke(r, b, v);
    line(0, 0, 20, 0);
    popMatrix();
  
    pushMatrix();
    translate(80, decalage);
    rotate(angle);
    stroke(b, v, 100);
    line(0, 0, 20, 0);
    popMatrix();
  
    pushMatrix();
    translate(110, decalage);
    rotate(angle);
    stroke(v, b, 10);
    line(0, 0, 20, 0);
    popMatrix();
  
    pushMatrix();
    translate(140, decalage);
    rotate(angle);
    stroke(b, 50, v);
    line(0, 0, 20, 0);
    popMatrix();
  
    pushMatrix();
    translate(170, decalage);
    rotate(angle);
    stroke(v, r, b);
    line(0, 0, 20, 0);
    popMatrix();
  
    pushMatrix();
    translate(200, decalage);
    rotate(angle);
    stroke(r, v, b);
    line(0, 0, 20, 0);
    popMatrix();
  
    pushMatrix();
    translate(230, decalage);
    rotate(angle);
    stroke(r, b, v);
    line(0, 0, 20, 0);
    popMatrix();
  
    pushMatrix();
    translate(260, decalage);
    rotate(angle);
    stroke(v, b, 100);
    line(0, 0, 20, 0);
    popMatrix();
  
    pushMatrix();
    translate(290, decalage);
    rotate(angle);
    stroke(b, v, 100);
    line(0, 0, 20, 0);
    popMatrix();
  
    pushMatrix();
    translate(320, decalage);
    rotate(angle);
    stroke(b, v, 20);
    line(0, 0, 20, 0);
    popMatrix();
  
    pushMatrix();
    translate(350, decalage);
    rotate(angle);
    stroke(100, v, b);
    line(0, 0, 20, 0);
    popMatrix();
  
    pushMatrix();
    translate(380, decalage);
    rotate(angle);
    stroke(b, 100, b);
    line(0, 0, 20, 0);
    popMatrix();
  popMatrix();
  popMatrix();
}


