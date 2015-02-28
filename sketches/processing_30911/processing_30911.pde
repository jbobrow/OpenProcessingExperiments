
/////flow  R

int sz = 50;

void setup(){
size (500,700);

}

void draw(){
 background(255);
 smooth();
 stroke(0);
 
 pushMatrix();
  translate(width/2,600);
  int a = (mouseY-600);
  int b = (mouseX-width/2);
  float ang = atan2(a,b);
   rotate(ang);
  rotate(PI/2);
  line(0,0,0,-250);
  
  pushMatrix();
  translate(0,-250);
  ellipse(0,0,sz,sz);
   for (int i= 0; i< TWO_PI*2;i++){
    //stroke(0,100);
    strokeWeight(3);
    fill(255);
    rotate(0.5);
    ellipse(0,-60,30,70);
    }
  
 popMatrix();
   popMatrix();
   line(0,597,width,597);
   stroke(255);
rect(0,600,width,height);
}

