
class Satellite {
 
float angle;   

Satellite(){
angle = 0;
}


void display(int pos,int size,int x1, int x2) {
  //background(255);
  fill(127);
  stroke(0);
  rectMode(CENTER);
  translate(x1, x2);
    rotate(angle);
  line(-pos, 0, pos, 0);
   stroke(0);
   strokeWeight(2);
   fill( random(255), random(255), random(255), random(255));
  ellipse(pos, 0, size, size);
  ellipse(-pos, 0, size, size);
  ellipse(0, 0, size+10, size+10);
 
}

void rotateAngle(){
  angle += 0.02;

}



}
Satellite b;
Satellite b1;
PVector v1;

void setup(){
b = new Satellite();
b1 = new Satellite();
fill(0);
ellipse(width/2,height/2,400,400);

size(750,750);


v1 = new PVector(width/2,height/2);

}


void draw(){
 
ellipse(v1.x, v1.y, 12, 12);
  
b.display(50,30,width/2,height/2); //line, size
b.rotateAngle();

b1.display(50,30,220,220); //line, size
b1.rotateAngle();


}


