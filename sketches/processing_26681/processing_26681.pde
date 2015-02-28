
import processing.opengl.*;

float v;
float x,y;
float z, zA, zB;
float radius, radiusA, radiusB;
float angle;
float angleIncrement;

PVector vertices[][];

void setup () {
  size(1000,1000,OPENGL);
  
  angleIncrement = PI/300.0;
}

void draw () {
  background(255);
  smooth();
  lights();
  translate(width/2, height/2);
  rotateX(frameCount * angleIncrement);
  rotateY(frameCount * angleIncrement);
  rotateZ(frameCount * angleIncrement);
  
  //rotateZ(radians(180));
  //rotateX(radians(100));

  scale(20);

  
///////////////////////////PVECTOR
/* 
  vertices = new PVector[5][v+1];
  
  for (int i = 0; i < 5; i++) {
    angle = 0;
    for (int j = 0; j <= v; j++) {
      vertices [i][j].x = 0;
*/ 

////////////////////////////FOr LOOP



/////////////////////VERTEX



  beginShape();
  
  /////////////////////////FIRST LAYER
  
  radiusA = 0;
  radiusB = 2;
  zA = -19.7;
  zB = -19;
  
  vertex(radiusA *cos(radians(0)), radiusA *sin(radians(0)), zA);
  vertex(radiusB *cos(radians(0)), radiusB *sin(radians(0)), zB);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 1)), radiusA *sin(radians(360/36 * 1)), zA);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 2)), radiusA *sin(radians(360/36 * 2)), zA);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 3)), radiusA *sin(radians(360/36 * 3)), zA);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 4)), radiusA *sin(radians(360/36 * 4)), zA);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 5)), radiusA *sin(radians(360/36 * 5)), zA);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 6)), radiusA *sin(radians(360/36 * 6)), zA);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 7)), radiusA *sin(radians(360/36 * 7)), zA);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 8)), radiusA *sin(radians(360/36 * 8)), zA);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 9)), radiusA *sin(radians(360/36 * 9)), zA);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 10)), radiusA *sin(radians(360/36 * 10)), zA);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 11)), radiusA *sin(radians(360/36 * 11)), zA);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 12)), radiusA *sin(radians(360/36 * 12)), zA);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 13)), radiusA *sin(radians(360/36 * 13)), zA);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 14)), radiusA *sin(radians(360/36 * 14)), zA);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 15)), radiusA *sin(radians(360/36 * 15)), zA);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 16)), radiusA *sin(radians(360/36 * 16)), zA);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 17)), radiusA *sin(radians(360/36 * 17)), zA);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);

  vertex(radiusA *cos(radians(360/36 * 18)), radiusA *sin(radians(360/36 * 18)), zA);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 19)), radiusA *sin(radians(360/36 * 19)), zA);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 20)), radiusA *sin(radians(360/36 * 20)), zA);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 21)), radiusA *sin(radians(360/36 * 21)), zA);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 22)), radiusA *sin(radians(360/36 * 22)), zA);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 23)), radiusA *sin(radians(360/36 * 23)), zA);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 24)), radiusA *sin(radians(360/36 * 24)), zA);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 25)), radiusA *sin(radians(360/36 * 25)), zA);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 26)), radiusA *sin(radians(360/36 * 26)), zA);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 27)), radiusA *sin(radians(360/36 * 27)), zA);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
    
  vertex(radiusA *cos(radians(360/36 * 28)), radiusA *sin(radians(360/36 * 28)), zA);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 29)), radiusA *sin(radians(360/36 * 29)), zA);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 30)), radiusA *sin(radians(360/36 * 30)), zA);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 31)), radiusA *sin(radians(360/36 * 31)), zA);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 32)), radiusA *sin(radians(360/36 * 32)), zA);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 33)), radiusA *sin(radians(360/36 * 33)), zA);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 34)), radiusA *sin(radians(360/36 * 34)), zA);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 35)), radiusA *sin(radians(360/36 * 35)), zA);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  vertex(radiusB *cos(radians(360/36 * 36)), radiusB *sin(radians(360/36 * 36)), zB);
  
  vertex(radiusA*cos(radians(0)), radiusA*sin(radians(0)), zA);
  
/////////////////////////SECOND LAYER
  
  radiusA = 2;
  radiusB = 3.3;
  zA = -19;
  zB = -18;
  
  vertex(radiusA *cos(radians(0)), radiusA *sin(radians(0)), zA);
  vertex(radiusB *cos(radians(0)), radiusB *sin(radians(0)), zB);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 1)), radiusA *sin(radians(360/36 * 1)), zA);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 2)), radiusA *sin(radians(360/36 * 2)), zA);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 3)), radiusA *sin(radians(360/36 * 3)), zA);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 4)), radiusA *sin(radians(360/36 * 4)), zA);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 5)), radiusA *sin(radians(360/36 * 5)), zA);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 6)), radiusA *sin(radians(360/36 * 6)), zA);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 7)), radiusA *sin(radians(360/36 * 7)), zA);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 8)), radiusA *sin(radians(360/36 * 8)), zA);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 9)), radiusA *sin(radians(360/36 * 9)), zA);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 10)), radiusA *sin(radians(360/36 * 10)), zA);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 11)), radiusA *sin(radians(360/36 * 11)), zA);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 12)), radiusA *sin(radians(360/36 * 12)), zA);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 13)), radiusA *sin(radians(360/36 * 13)), zA);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 14)), radiusA *sin(radians(360/36 * 14)), zA);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 15)), radiusA *sin(radians(360/36 * 15)), zA);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 16)), radiusA *sin(radians(360/36 * 16)), zA);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 17)), radiusA *sin(radians(360/36 * 17)), zA);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);

  vertex(radiusA *cos(radians(360/36 * 18)), radiusA *sin(radians(360/36 * 18)), zA);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 19)), radiusA *sin(radians(360/36 * 19)), zA);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 20)), radiusA *sin(radians(360/36 * 20)), zA);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 21)), radiusA *sin(radians(360/36 * 21)), zA);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 22)), radiusA *sin(radians(360/36 * 22)), zA);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 23)), radiusA *sin(radians(360/36 * 23)), zA);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 24)), radiusA *sin(radians(360/36 * 24)), zA);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 25)), radiusA *sin(radians(360/36 * 25)), zA);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 26)), radiusA *sin(radians(360/36 * 26)), zA);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 27)), radiusA *sin(radians(360/36 * 27)), zA);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
    
  vertex(radiusA *cos(radians(360/36 * 28)), radiusA *sin(radians(360/36 * 28)), zA);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 29)), radiusA *sin(radians(360/36 * 29)), zA);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 30)), radiusA *sin(radians(360/36 * 30)), zA);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 31)), radiusA *sin(radians(360/36 * 31)), zA);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 32)), radiusA *sin(radians(360/36 * 32)), zA);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 33)), radiusA *sin(radians(360/36 * 33)), zA);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 34)), radiusA *sin(radians(360/36 * 34)), zA);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 35)), radiusA *sin(radians(360/36 * 35)), zA);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  vertex(radiusB *cos(radians(360/36 * 36)), radiusB *sin(radians(360/36 * 36)), zB);
  
  vertex(radiusA*cos(radians(0)), radiusA*sin(radians(0)), zA);

/////////////////////////THIRD LAYER
  
  radiusA = 3.3;
  radiusB = 4.2;
  zA = -18;
  zB = -17;
  
  vertex(radiusA *cos(radians(0)), radiusA *sin(radians(0)), zA);
  vertex(radiusB *cos(radians(0)), radiusB *sin(radians(0)), zB);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 1)), radiusA *sin(radians(360/36 * 1)), zA);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 2)), radiusA *sin(radians(360/36 * 2)), zA);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 3)), radiusA *sin(radians(360/36 * 3)), zA);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 4)), radiusA *sin(radians(360/36 * 4)), zA);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 5)), radiusA *sin(radians(360/36 * 5)), zA);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 6)), radiusA *sin(radians(360/36 * 6)), zA);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 7)), radiusA *sin(radians(360/36 * 7)), zA);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 8)), radiusA *sin(radians(360/36 * 8)), zA);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 9)), radiusA *sin(radians(360/36 * 9)), zA);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 10)), radiusA *sin(radians(360/36 * 10)), zA);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 11)), radiusA *sin(radians(360/36 * 11)), zA);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 12)), radiusA *sin(radians(360/36 * 12)), zA);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 13)), radiusA *sin(radians(360/36 * 13)), zA);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 14)), radiusA *sin(radians(360/36 * 14)), zA);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 15)), radiusA *sin(radians(360/36 * 15)), zA);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 16)), radiusA *sin(radians(360/36 * 16)), zA);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 17)), radiusA *sin(radians(360/36 * 17)), zA);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);

  vertex(radiusA *cos(radians(360/36 * 18)), radiusA *sin(radians(360/36 * 18)), zA);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 19)), radiusA *sin(radians(360/36 * 19)), zA);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 20)), radiusA *sin(radians(360/36 * 20)), zA);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 21)), radiusA *sin(radians(360/36 * 21)), zA);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 22)), radiusA *sin(radians(360/36 * 22)), zA);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 23)), radiusA *sin(radians(360/36 * 23)), zA);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 24)), radiusA *sin(radians(360/36 * 24)), zA);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 25)), radiusA *sin(radians(360/36 * 25)), zA);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 26)), radiusA *sin(radians(360/36 * 26)), zA);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 27)), radiusA *sin(radians(360/36 * 27)), zA);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
    
  vertex(radiusA *cos(radians(360/36 * 28)), radiusA *sin(radians(360/36 * 28)), zA);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 29)), radiusA *sin(radians(360/36 * 29)), zA);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 30)), radiusA *sin(radians(360/36 * 30)), zA);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 31)), radiusA *sin(radians(360/36 * 31)), zA);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 32)), radiusA *sin(radians(360/36 * 32)), zA);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 33)), radiusA *sin(radians(360/36 * 33)), zA);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 34)), radiusA *sin(radians(360/36 * 34)), zA);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 35)), radiusA *sin(radians(360/36 * 35)), zA);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  vertex(radiusB *cos(radians(360/36 * 36)), radiusB *sin(radians(360/36 * 36)), zB);
  
  vertex(radiusA*cos(radians(0)), radiusA*sin(radians(0)), zA);

/////////////////////////FOURTH LAYER
  
  radiusA = 4.2;
  radiusB = 4.7;
  zA = -17;
  zB = -16;
  
  vertex(radiusA *cos(radians(0)), radiusA *sin(radians(0)), zA);
  vertex(radiusB *cos(radians(0)), radiusB *sin(radians(0)), zB);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 1)), radiusA *sin(radians(360/36 * 1)), zA);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 2)), radiusA *sin(radians(360/36 * 2)), zA);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 3)), radiusA *sin(radians(360/36 * 3)), zA);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 4)), radiusA *sin(radians(360/36 * 4)), zA);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 5)), radiusA *sin(radians(360/36 * 5)), zA);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 6)), radiusA *sin(radians(360/36 * 6)), zA);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 7)), radiusA *sin(radians(360/36 * 7)), zA);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 8)), radiusA *sin(radians(360/36 * 8)), zA);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 9)), radiusA *sin(radians(360/36 * 9)), zA);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 10)), radiusA *sin(radians(360/36 * 10)), zA);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 11)), radiusA *sin(radians(360/36 * 11)), zA);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 12)), radiusA *sin(radians(360/36 * 12)), zA);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 13)), radiusA *sin(radians(360/36 * 13)), zA);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 14)), radiusA *sin(radians(360/36 * 14)), zA);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 15)), radiusA *sin(radians(360/36 * 15)), zA);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 16)), radiusA *sin(radians(360/36 * 16)), zA);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 17)), radiusA *sin(radians(360/36 * 17)), zA);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);

  vertex(radiusA *cos(radians(360/36 * 18)), radiusA *sin(radians(360/36 * 18)), zA);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 19)), radiusA *sin(radians(360/36 * 19)), zA);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 20)), radiusA *sin(radians(360/36 * 20)), zA);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 21)), radiusA *sin(radians(360/36 * 21)), zA);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 22)), radiusA *sin(radians(360/36 * 22)), zA);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 23)), radiusA *sin(radians(360/36 * 23)), zA);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 24)), radiusA *sin(radians(360/36 * 24)), zA);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 25)), radiusA *sin(radians(360/36 * 25)), zA);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 26)), radiusA *sin(radians(360/36 * 26)), zA);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 27)), radiusA *sin(radians(360/36 * 27)), zA);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
    
  vertex(radiusA *cos(radians(360/36 * 28)), radiusA *sin(radians(360/36 * 28)), zA);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 29)), radiusA *sin(radians(360/36 * 29)), zA);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 30)), radiusA *sin(radians(360/36 * 30)), zA);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 31)), radiusA *sin(radians(360/36 * 31)), zA);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 32)), radiusA *sin(radians(360/36 * 32)), zA);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 33)), radiusA *sin(radians(360/36 * 33)), zA);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 34)), radiusA *sin(radians(360/36 * 34)), zA);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 35)), radiusA *sin(radians(360/36 * 35)), zA);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  vertex(radiusB *cos(radians(360/36 * 36)), radiusB *sin(radians(360/36 * 36)), zB);
  
  vertex(radiusA*cos(radians(0)), radiusA*sin(radians(0)), zA);


/////////////////////////FIFTH LAYER
  
  radiusA = 4.7;
  radiusB = 5.2;
  zA = -16;
  zB = -15;
  
  vertex(radiusA *cos(radians(0)), radiusA *sin(radians(0)), zA);
  vertex(radiusB *cos(radians(0)), radiusB *sin(radians(0)), zB);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 1)), radiusA *sin(radians(360/36 * 1)), zA);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 2)), radiusA *sin(radians(360/36 * 2)), zA);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 3)), radiusA *sin(radians(360/36 * 3)), zA);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 4)), radiusA *sin(radians(360/36 * 4)), zA);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 5)), radiusA *sin(radians(360/36 * 5)), zA);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 6)), radiusA *sin(radians(360/36 * 6)), zA);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 7)), radiusA *sin(radians(360/36 * 7)), zA);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 8)), radiusA *sin(radians(360/36 * 8)), zA);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 9)), radiusA *sin(radians(360/36 * 9)), zA);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 10)), radiusA *sin(radians(360/36 * 10)), zA);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 11)), radiusA *sin(radians(360/36 * 11)), zA);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 12)), radiusA *sin(radians(360/36 * 12)), zA);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 13)), radiusA *sin(radians(360/36 * 13)), zA);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 14)), radiusA *sin(radians(360/36 * 14)), zA);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 15)), radiusA *sin(radians(360/36 * 15)), zA);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 16)), radiusA *sin(radians(360/36 * 16)), zA);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 17)), radiusA *sin(radians(360/36 * 17)), zA);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);

  vertex(radiusA *cos(radians(360/36 * 18)), radiusA *sin(radians(360/36 * 18)), zA);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 19)), radiusA *sin(radians(360/36 * 19)), zA);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 20)), radiusA *sin(radians(360/36 * 20)), zA);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 21)), radiusA *sin(radians(360/36 * 21)), zA);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 22)), radiusA *sin(radians(360/36 * 22)), zA);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 23)), radiusA *sin(radians(360/36 * 23)), zA);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 24)), radiusA *sin(radians(360/36 * 24)), zA);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 25)), radiusA *sin(radians(360/36 * 25)), zA);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 26)), radiusA *sin(radians(360/36 * 26)), zA);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 27)), radiusA *sin(radians(360/36 * 27)), zA);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
    
  vertex(radiusA *cos(radians(360/36 * 28)), radiusA *sin(radians(360/36 * 28)), zA);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 29)), radiusA *sin(radians(360/36 * 29)), zA);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 30)), radiusA *sin(radians(360/36 * 30)), zA);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 31)), radiusA *sin(radians(360/36 * 31)), zA);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 32)), radiusA *sin(radians(360/36 * 32)), zA);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 33)), radiusA *sin(radians(360/36 * 33)), zA);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 34)), radiusA *sin(radians(360/36 * 34)), zA);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 35)), radiusA *sin(radians(360/36 * 35)), zA);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  vertex(radiusB *cos(radians(360/36 * 36)), radiusB *sin(radians(360/36 * 36)), zB);
  
  vertex(radiusA*cos(radians(0)), radiusA*sin(radians(0)), zA);

/////////////////////////SIXTH LAYER
  
  radiusA = 5.2;
  radiusB = 5.5;
  zA = -15;
  zB = -14;
  
  vertex(radiusA *cos(radians(0)), radiusA *sin(radians(0)), zA);
  vertex(radiusB *cos(radians(0)), radiusB *sin(radians(0)), zB);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 1)), radiusA *sin(radians(360/36 * 1)), zA);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 2)), radiusA *sin(radians(360/36 * 2)), zA);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 3)), radiusA *sin(radians(360/36 * 3)), zA);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 4)), radiusA *sin(radians(360/36 * 4)), zA);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 5)), radiusA *sin(radians(360/36 * 5)), zA);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 6)), radiusA *sin(radians(360/36 * 6)), zA);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 7)), radiusA *sin(radians(360/36 * 7)), zA);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 8)), radiusA *sin(radians(360/36 * 8)), zA);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 9)), radiusA *sin(radians(360/36 * 9)), zA);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 10)), radiusA *sin(radians(360/36 * 10)), zA);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 11)), radiusA *sin(radians(360/36 * 11)), zA);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 12)), radiusA *sin(radians(360/36 * 12)), zA);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 13)), radiusA *sin(radians(360/36 * 13)), zA);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 14)), radiusA *sin(radians(360/36 * 14)), zA);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 15)), radiusA *sin(radians(360/36 * 15)), zA);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 16)), radiusA *sin(radians(360/36 * 16)), zA);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 17)), radiusA *sin(radians(360/36 * 17)), zA);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);

  vertex(radiusA *cos(radians(360/36 * 18)), radiusA *sin(radians(360/36 * 18)), zA);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 19)), radiusA *sin(radians(360/36 * 19)), zA);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 20)), radiusA *sin(radians(360/36 * 20)), zA);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 21)), radiusA *sin(radians(360/36 * 21)), zA);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 22)), radiusA *sin(radians(360/36 * 22)), zA);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 23)), radiusA *sin(radians(360/36 * 23)), zA);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 24)), radiusA *sin(radians(360/36 * 24)), zA);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 25)), radiusA *sin(radians(360/36 * 25)), zA);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 26)), radiusA *sin(radians(360/36 * 26)), zA);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 27)), radiusA *sin(radians(360/36 * 27)), zA);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
    
  vertex(radiusA *cos(radians(360/36 * 28)), radiusA *sin(radians(360/36 * 28)), zA);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 29)), radiusA *sin(radians(360/36 * 29)), zA);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 30)), radiusA *sin(radians(360/36 * 30)), zA);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 31)), radiusA *sin(radians(360/36 * 31)), zA);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 32)), radiusA *sin(radians(360/36 * 32)), zA);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 33)), radiusA *sin(radians(360/36 * 33)), zA);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 34)), radiusA *sin(radians(360/36 * 34)), zA);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 35)), radiusA *sin(radians(360/36 * 35)), zA);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  vertex(radiusB *cos(radians(360/36 * 36)), radiusB *sin(radians(360/36 * 36)), zB);
  
  vertex(radiusA*cos(radians(0)), radiusA*sin(radians(0)), zA);


/////////////////////////SEVENTH LAYER
  
  radiusA = 5.5;
  radiusB = 5.8;
  zA = -14;
  zB = -13;
  
  vertex(radiusA *cos(radians(0)), radiusA *sin(radians(0)), zA);
  vertex(radiusB *cos(radians(0)), radiusB *sin(radians(0)), zB);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 1)), radiusA *sin(radians(360/36 * 1)), zA);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 2)), radiusA *sin(radians(360/36 * 2)), zA);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 3)), radiusA *sin(radians(360/36 * 3)), zA);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 4)), radiusA *sin(radians(360/36 * 4)), zA);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 5)), radiusA *sin(radians(360/36 * 5)), zA);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 6)), radiusA *sin(radians(360/36 * 6)), zA);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 7)), radiusA *sin(radians(360/36 * 7)), zA);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 8)), radiusA *sin(radians(360/36 * 8)), zA);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 9)), radiusA *sin(radians(360/36 * 9)), zA);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 10)), radiusA *sin(radians(360/36 * 10)), zA);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 11)), radiusA *sin(radians(360/36 * 11)), zA);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 12)), radiusA *sin(radians(360/36 * 12)), zA);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 13)), radiusA *sin(radians(360/36 * 13)), zA);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 14)), radiusA *sin(radians(360/36 * 14)), zA);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 15)), radiusA *sin(radians(360/36 * 15)), zA);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 16)), radiusA *sin(radians(360/36 * 16)), zA);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 17)), radiusA *sin(radians(360/36 * 17)), zA);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);

  vertex(radiusA *cos(radians(360/36 * 18)), radiusA *sin(radians(360/36 * 18)), zA);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 19)), radiusA *sin(radians(360/36 * 19)), zA);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 20)), radiusA *sin(radians(360/36 * 20)), zA);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 21)), radiusA *sin(radians(360/36 * 21)), zA);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 22)), radiusA *sin(radians(360/36 * 22)), zA);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 23)), radiusA *sin(radians(360/36 * 23)), zA);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 24)), radiusA *sin(radians(360/36 * 24)), zA);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 25)), radiusA *sin(radians(360/36 * 25)), zA);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 26)), radiusA *sin(radians(360/36 * 26)), zA);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 27)), radiusA *sin(radians(360/36 * 27)), zA);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
    
  vertex(radiusA *cos(radians(360/36 * 28)), radiusA *sin(radians(360/36 * 28)), zA);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 29)), radiusA *sin(radians(360/36 * 29)), zA);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 30)), radiusA *sin(radians(360/36 * 30)), zA);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 31)), radiusA *sin(radians(360/36 * 31)), zA);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 32)), radiusA *sin(radians(360/36 * 32)), zA);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 33)), radiusA *sin(radians(360/36 * 33)), zA);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 34)), radiusA *sin(radians(360/36 * 34)), zA);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 35)), radiusA *sin(radians(360/36 * 35)), zA);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  vertex(radiusB *cos(radians(360/36 * 36)), radiusB *sin(radians(360/36 * 36)), zB);
  
  vertex(radiusA*cos(radians(0)), radiusA*sin(radians(0)), zA);


/////////////////////////EIGHTH LAYER
  
  radiusA = 5.8;
  radiusB = 6;
  zA = -13;
  zB = -12;
  
  vertex(radiusA *cos(radians(0)), radiusA *sin(radians(0)), zA);
  vertex(radiusB *cos(radians(0)), radiusB *sin(radians(0)), zB);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 1)), radiusA *sin(radians(360/36 * 1)), zA);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 2)), radiusA *sin(radians(360/36 * 2)), zA);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 3)), radiusA *sin(radians(360/36 * 3)), zA);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 4)), radiusA *sin(radians(360/36 * 4)), zA);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 5)), radiusA *sin(radians(360/36 * 5)), zA);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 6)), radiusA *sin(radians(360/36 * 6)), zA);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 7)), radiusA *sin(radians(360/36 * 7)), zA);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 8)), radiusA *sin(radians(360/36 * 8)), zA);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 9)), radiusA *sin(radians(360/36 * 9)), zA);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 10)), radiusA *sin(radians(360/36 * 10)), zA);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 11)), radiusA *sin(radians(360/36 * 11)), zA);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 12)), radiusA *sin(radians(360/36 * 12)), zA);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 13)), radiusA *sin(radians(360/36 * 13)), zA);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 14)), radiusA *sin(radians(360/36 * 14)), zA);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 15)), radiusA *sin(radians(360/36 * 15)), zA);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 16)), radiusA *sin(radians(360/36 * 16)), zA);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 17)), radiusA *sin(radians(360/36 * 17)), zA);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);

  vertex(radiusA *cos(radians(360/36 * 18)), radiusA *sin(radians(360/36 * 18)), zA);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 19)), radiusA *sin(radians(360/36 * 19)), zA);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 20)), radiusA *sin(radians(360/36 * 20)), zA);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 21)), radiusA *sin(radians(360/36 * 21)), zA);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 22)), radiusA *sin(radians(360/36 * 22)), zA);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 23)), radiusA *sin(radians(360/36 * 23)), zA);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 24)), radiusA *sin(radians(360/36 * 24)), zA);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 25)), radiusA *sin(radians(360/36 * 25)), zA);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 26)), radiusA *sin(radians(360/36 * 26)), zA);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 27)), radiusA *sin(radians(360/36 * 27)), zA);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
    
  vertex(radiusA *cos(radians(360/36 * 28)), radiusA *sin(radians(360/36 * 28)), zA);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 29)), radiusA *sin(radians(360/36 * 29)), zA);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 30)), radiusA *sin(radians(360/36 * 30)), zA);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 31)), radiusA *sin(radians(360/36 * 31)), zA);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 32)), radiusA *sin(radians(360/36 * 32)), zA);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 33)), radiusA *sin(radians(360/36 * 33)), zA);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 34)), radiusA *sin(radians(360/36 * 34)), zA);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 35)), radiusA *sin(radians(360/36 * 35)), zA);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  vertex(radiusB *cos(radians(360/36 * 36)), radiusB *sin(radians(360/36 * 36)), zB);
  
  vertex(radiusA*cos(radians(0)), radiusA*sin(radians(0)), zA);


/////////////////////////NINTH LAYER
  
  radiusA = 6;
  radiusB = 6.18;
  zA = -12;
  zB = -11;
  
  vertex(radiusA *cos(radians(0)), radiusA *sin(radians(0)), zA);
  vertex(radiusB *cos(radians(0)), radiusB *sin(radians(0)), zB);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 1)), radiusA *sin(radians(360/36 * 1)), zA);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 2)), radiusA *sin(radians(360/36 * 2)), zA);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 3)), radiusA *sin(radians(360/36 * 3)), zA);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 4)), radiusA *sin(radians(360/36 * 4)), zA);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 5)), radiusA *sin(radians(360/36 * 5)), zA);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 6)), radiusA *sin(radians(360/36 * 6)), zA);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 7)), radiusA *sin(radians(360/36 * 7)), zA);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 8)), radiusA *sin(radians(360/36 * 8)), zA);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 9)), radiusA *sin(radians(360/36 * 9)), zA);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 10)), radiusA *sin(radians(360/36 * 10)), zA);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 11)), radiusA *sin(radians(360/36 * 11)), zA);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 12)), radiusA *sin(radians(360/36 * 12)), zA);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 13)), radiusA *sin(radians(360/36 * 13)), zA);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 14)), radiusA *sin(radians(360/36 * 14)), zA);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 15)), radiusA *sin(radians(360/36 * 15)), zA);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 16)), radiusA *sin(radians(360/36 * 16)), zA);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 17)), radiusA *sin(radians(360/36 * 17)), zA);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);

  vertex(radiusA *cos(radians(360/36 * 18)), radiusA *sin(radians(360/36 * 18)), zA);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 19)), radiusA *sin(radians(360/36 * 19)), zA);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 20)), radiusA *sin(radians(360/36 * 20)), zA);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 21)), radiusA *sin(radians(360/36 * 21)), zA);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 22)), radiusA *sin(radians(360/36 * 22)), zA);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 23)), radiusA *sin(radians(360/36 * 23)), zA);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 24)), radiusA *sin(radians(360/36 * 24)), zA);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 25)), radiusA *sin(radians(360/36 * 25)), zA);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 26)), radiusA *sin(radians(360/36 * 26)), zA);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 27)), radiusA *sin(radians(360/36 * 27)), zA);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
    
  vertex(radiusA *cos(radians(360/36 * 28)), radiusA *sin(radians(360/36 * 28)), zA);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 29)), radiusA *sin(radians(360/36 * 29)), zA);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 30)), radiusA *sin(radians(360/36 * 30)), zA);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 31)), radiusA *sin(radians(360/36 * 31)), zA);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 32)), radiusA *sin(radians(360/36 * 32)), zA);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 33)), radiusA *sin(radians(360/36 * 33)), zA);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 34)), radiusA *sin(radians(360/36 * 34)), zA);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 35)), radiusA *sin(radians(360/36 * 35)), zA);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  vertex(radiusB *cos(radians(360/36 * 36)), radiusB *sin(radians(360/36 * 36)), zB);
  
  vertex(radiusA*cos(radians(0)), radiusA*sin(radians(0)), zA);


/////////////////////////TENTH LAYER
  
  radiusA = 6.18;
  radiusB = 6.3;
  zA = -11;
  zB = -10;
  
  vertex(radiusA *cos(radians(0)), radiusA *sin(radians(0)), zA);
  vertex(radiusB *cos(radians(0)), radiusB *sin(radians(0)), zB);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 1)), radiusA *sin(radians(360/36 * 1)), zA);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 2)), radiusA *sin(radians(360/36 * 2)), zA);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 3)), radiusA *sin(radians(360/36 * 3)), zA);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 4)), radiusA *sin(radians(360/36 * 4)), zA);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 5)), radiusA *sin(radians(360/36 * 5)), zA);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 6)), radiusA *sin(radians(360/36 * 6)), zA);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 7)), radiusA *sin(radians(360/36 * 7)), zA);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 8)), radiusA *sin(radians(360/36 * 8)), zA);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 9)), radiusA *sin(radians(360/36 * 9)), zA);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 10)), radiusA *sin(radians(360/36 * 10)), zA);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 11)), radiusA *sin(radians(360/36 * 11)), zA);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 12)), radiusA *sin(radians(360/36 * 12)), zA);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 13)), radiusA *sin(radians(360/36 * 13)), zA);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 14)), radiusA *sin(radians(360/36 * 14)), zA);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 15)), radiusA *sin(radians(360/36 * 15)), zA);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 16)), radiusA *sin(radians(360/36 * 16)), zA);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 17)), radiusA *sin(radians(360/36 * 17)), zA);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);

  vertex(radiusA *cos(radians(360/36 * 18)), radiusA *sin(radians(360/36 * 18)), zA);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 19)), radiusA *sin(radians(360/36 * 19)), zA);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 20)), radiusA *sin(radians(360/36 * 20)), zA);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 21)), radiusA *sin(radians(360/36 * 21)), zA);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 22)), radiusA *sin(radians(360/36 * 22)), zA);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 23)), radiusA *sin(radians(360/36 * 23)), zA);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 24)), radiusA *sin(radians(360/36 * 24)), zA);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 25)), radiusA *sin(radians(360/36 * 25)), zA);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 26)), radiusA *sin(radians(360/36 * 26)), zA);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 27)), radiusA *sin(radians(360/36 * 27)), zA);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
    
  vertex(radiusA *cos(radians(360/36 * 28)), radiusA *sin(radians(360/36 * 28)), zA);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 29)), radiusA *sin(radians(360/36 * 29)), zA);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 30)), radiusA *sin(radians(360/36 * 30)), zA);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 31)), radiusA *sin(radians(360/36 * 31)), zA);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 32)), radiusA *sin(radians(360/36 * 32)), zA);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 33)), radiusA *sin(radians(360/36 * 33)), zA);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 34)), radiusA *sin(radians(360/36 * 34)), zA);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 35)), radiusA *sin(radians(360/36 * 35)), zA);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  vertex(radiusB *cos(radians(360/36 * 36)), radiusB *sin(radians(360/36 * 36)), zB);
  
  vertex(radiusA*cos(radians(0)), radiusA*sin(radians(0)), zA);

/////////////////////////ELEVENTH LAYER
  
  radiusA = 6.3;
  radiusB = 6.4;
  zA = -10;
  zB = -9;
  
  vertex(radiusA *cos(radians(0)), radiusA *sin(radians(0)), zA);
  vertex(radiusB *cos(radians(0)), radiusB *sin(radians(0)), zB);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 1)), radiusA *sin(radians(360/36 * 1)), zA);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 2)), radiusA *sin(radians(360/36 * 2)), zA);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 3)), radiusA *sin(radians(360/36 * 3)), zA);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 4)), radiusA *sin(radians(360/36 * 4)), zA);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 5)), radiusA *sin(radians(360/36 * 5)), zA);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 6)), radiusA *sin(radians(360/36 * 6)), zA);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 7)), radiusA *sin(radians(360/36 * 7)), zA);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 8)), radiusA *sin(radians(360/36 * 8)), zA);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 9)), radiusA *sin(radians(360/36 * 9)), zA);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 10)), radiusA *sin(radians(360/36 * 10)), zA);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 11)), radiusA *sin(radians(360/36 * 11)), zA);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 12)), radiusA *sin(radians(360/36 * 12)), zA);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 13)), radiusA *sin(radians(360/36 * 13)), zA);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 14)), radiusA *sin(radians(360/36 * 14)), zA);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 15)), radiusA *sin(radians(360/36 * 15)), zA);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 16)), radiusA *sin(radians(360/36 * 16)), zA);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 17)), radiusA *sin(radians(360/36 * 17)), zA);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);

  vertex(radiusA *cos(radians(360/36 * 18)), radiusA *sin(radians(360/36 * 18)), zA);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 19)), radiusA *sin(radians(360/36 * 19)), zA);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 20)), radiusA *sin(radians(360/36 * 20)), zA);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 21)), radiusA *sin(radians(360/36 * 21)), zA);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 22)), radiusA *sin(radians(360/36 * 22)), zA);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 23)), radiusA *sin(radians(360/36 * 23)), zA);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 24)), radiusA *sin(radians(360/36 * 24)), zA);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 25)), radiusA *sin(radians(360/36 * 25)), zA);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 26)), radiusA *sin(radians(360/36 * 26)), zA);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 27)), radiusA *sin(radians(360/36 * 27)), zA);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
    
  vertex(radiusA *cos(radians(360/36 * 28)), radiusA *sin(radians(360/36 * 28)), zA);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 29)), radiusA *sin(radians(360/36 * 29)), zA);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 30)), radiusA *sin(radians(360/36 * 30)), zA);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 31)), radiusA *sin(radians(360/36 * 31)), zA);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 32)), radiusA *sin(radians(360/36 * 32)), zA);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 33)), radiusA *sin(radians(360/36 * 33)), zA);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 34)), radiusA *sin(radians(360/36 * 34)), zA);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 35)), radiusA *sin(radians(360/36 * 35)), zA);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  vertex(radiusB *cos(radians(360/36 * 36)), radiusB *sin(radians(360/36 * 36)), zB);
  
  vertex(radiusA*cos(radians(0)), radiusA*sin(radians(0)), zA);
  
/////////////////////////TWELFTH LAYER
  
  radiusA = 6.4;
  radiusB = 6.47;
  zA = -9;
  zB = -8;
  
  vertex(radiusA *cos(radians(0)), radiusA *sin(radians(0)), zA);
  vertex(radiusB *cos(radians(0)), radiusB *sin(radians(0)), zB);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 1)), radiusA *sin(radians(360/36 * 1)), zA);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 2)), radiusA *sin(radians(360/36 * 2)), zA);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 3)), radiusA *sin(radians(360/36 * 3)), zA);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 4)), radiusA *sin(radians(360/36 * 4)), zA);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 5)), radiusA *sin(radians(360/36 * 5)), zA);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 6)), radiusA *sin(radians(360/36 * 6)), zA);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 7)), radiusA *sin(radians(360/36 * 7)), zA);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 8)), radiusA *sin(radians(360/36 * 8)), zA);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 9)), radiusA *sin(radians(360/36 * 9)), zA);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 10)), radiusA *sin(radians(360/36 * 10)), zA);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 11)), radiusA *sin(radians(360/36 * 11)), zA);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 12)), radiusA *sin(radians(360/36 * 12)), zA);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 13)), radiusA *sin(radians(360/36 * 13)), zA);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 14)), radiusA *sin(radians(360/36 * 14)), zA);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 15)), radiusA *sin(radians(360/36 * 15)), zA);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 16)), radiusA *sin(radians(360/36 * 16)), zA);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 17)), radiusA *sin(radians(360/36 * 17)), zA);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);

  vertex(radiusA *cos(radians(360/36 * 18)), radiusA *sin(radians(360/36 * 18)), zA);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 19)), radiusA *sin(radians(360/36 * 19)), zA);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 20)), radiusA *sin(radians(360/36 * 20)), zA);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 21)), radiusA *sin(radians(360/36 * 21)), zA);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 22)), radiusA *sin(radians(360/36 * 22)), zA);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 23)), radiusA *sin(radians(360/36 * 23)), zA);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 24)), radiusA *sin(radians(360/36 * 24)), zA);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 25)), radiusA *sin(radians(360/36 * 25)), zA);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 26)), radiusA *sin(radians(360/36 * 26)), zA);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 27)), radiusA *sin(radians(360/36 * 27)), zA);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
    
  vertex(radiusA *cos(radians(360/36 * 28)), radiusA *sin(radians(360/36 * 28)), zA);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 29)), radiusA *sin(radians(360/36 * 29)), zA);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 30)), radiusA *sin(radians(360/36 * 30)), zA);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 31)), radiusA *sin(radians(360/36 * 31)), zA);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 32)), radiusA *sin(radians(360/36 * 32)), zA);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 33)), radiusA *sin(radians(360/36 * 33)), zA);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 34)), radiusA *sin(radians(360/36 * 34)), zA);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 35)), radiusA *sin(radians(360/36 * 35)), zA);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  vertex(radiusB *cos(radians(360/36 * 36)), radiusB *sin(radians(360/36 * 36)), zB);
  
  vertex(radiusA*cos(radians(0)), radiusA*sin(radians(0)), zA);

/////////////////////////THIRTEENTH LAYER
  
  radiusA = 6.47;
  radiusB = 6.52;
  zA = -8;
  zB = -7;
  
  vertex(radiusA *cos(radians(0)), radiusA *sin(radians(0)), zA);
  vertex(radiusB *cos(radians(0)), radiusB *sin(radians(0)), zB);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 1)), radiusA *sin(radians(360/36 * 1)), zA);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 2)), radiusA *sin(radians(360/36 * 2)), zA);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 3)), radiusA *sin(radians(360/36 * 3)), zA);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 4)), radiusA *sin(radians(360/36 * 4)), zA);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 5)), radiusA *sin(radians(360/36 * 5)), zA);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 6)), radiusA *sin(radians(360/36 * 6)), zA);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 7)), radiusA *sin(radians(360/36 * 7)), zA);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 8)), radiusA *sin(radians(360/36 * 8)), zA);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 9)), radiusA *sin(radians(360/36 * 9)), zA);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 10)), radiusA *sin(radians(360/36 * 10)), zA);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 11)), radiusA *sin(radians(360/36 * 11)), zA);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 12)), radiusA *sin(radians(360/36 * 12)), zA);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 13)), radiusA *sin(radians(360/36 * 13)), zA);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 14)), radiusA *sin(radians(360/36 * 14)), zA);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 15)), radiusA *sin(radians(360/36 * 15)), zA);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 16)), radiusA *sin(radians(360/36 * 16)), zA);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 17)), radiusA *sin(radians(360/36 * 17)), zA);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);

  vertex(radiusA *cos(radians(360/36 * 18)), radiusA *sin(radians(360/36 * 18)), zA);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 19)), radiusA *sin(radians(360/36 * 19)), zA);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 20)), radiusA *sin(radians(360/36 * 20)), zA);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 21)), radiusA *sin(radians(360/36 * 21)), zA);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 22)), radiusA *sin(radians(360/36 * 22)), zA);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 23)), radiusA *sin(radians(360/36 * 23)), zA);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 24)), radiusA *sin(radians(360/36 * 24)), zA);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 25)), radiusA *sin(radians(360/36 * 25)), zA);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 26)), radiusA *sin(radians(360/36 * 26)), zA);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 27)), radiusA *sin(radians(360/36 * 27)), zA);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
    
  vertex(radiusA *cos(radians(360/36 * 28)), radiusA *sin(radians(360/36 * 28)), zA);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 29)), radiusA *sin(radians(360/36 * 29)), zA);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 30)), radiusA *sin(radians(360/36 * 30)), zA);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 31)), radiusA *sin(radians(360/36 * 31)), zA);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 32)), radiusA *sin(radians(360/36 * 32)), zA);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 33)), radiusA *sin(radians(360/36 * 33)), zA);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 34)), radiusA *sin(radians(360/36 * 34)), zA);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 35)), radiusA *sin(radians(360/36 * 35)), zA);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  vertex(radiusB *cos(radians(360/36 * 36)), radiusB *sin(radians(360/36 * 36)), zB);
  
  vertex(radiusA*cos(radians(0)), radiusA*sin(radians(0)), zA);
  
/////////////////////////FOURTEENTH LAYER
  
  radiusA = 6.52;
  radiusB = 6.45;
  zA = -7;
  zB = -6;
  
  vertex(radiusA *cos(radians(0)), radiusA *sin(radians(0)), zA);
  vertex(radiusB *cos(radians(0)), radiusB *sin(radians(0)), zB);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 1)), radiusA *sin(radians(360/36 * 1)), zA);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 2)), radiusA *sin(radians(360/36 * 2)), zA);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 3)), radiusA *sin(radians(360/36 * 3)), zA);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 4)), radiusA *sin(radians(360/36 * 4)), zA);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 5)), radiusA *sin(radians(360/36 * 5)), zA);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 6)), radiusA *sin(radians(360/36 * 6)), zA);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 7)), radiusA *sin(radians(360/36 * 7)), zA);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 8)), radiusA *sin(radians(360/36 * 8)), zA);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 9)), radiusA *sin(radians(360/36 * 9)), zA);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 10)), radiusA *sin(radians(360/36 * 10)), zA);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 11)), radiusA *sin(radians(360/36 * 11)), zA);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 12)), radiusA *sin(radians(360/36 * 12)), zA);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 13)), radiusA *sin(radians(360/36 * 13)), zA);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 14)), radiusA *sin(radians(360/36 * 14)), zA);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 15)), radiusA *sin(radians(360/36 * 15)), zA);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 16)), radiusA *sin(radians(360/36 * 16)), zA);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 17)), radiusA *sin(radians(360/36 * 17)), zA);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);

  vertex(radiusA *cos(radians(360/36 * 18)), radiusA *sin(radians(360/36 * 18)), zA);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 19)), radiusA *sin(radians(360/36 * 19)), zA);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 20)), radiusA *sin(radians(360/36 * 20)), zA);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 21)), radiusA *sin(radians(360/36 * 21)), zA);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 22)), radiusA *sin(radians(360/36 * 22)), zA);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 23)), radiusA *sin(radians(360/36 * 23)), zA);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 24)), radiusA *sin(radians(360/36 * 24)), zA);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 25)), radiusA *sin(radians(360/36 * 25)), zA);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 26)), radiusA *sin(radians(360/36 * 26)), zA);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 27)), radiusA *sin(radians(360/36 * 27)), zA);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
    
  vertex(radiusA *cos(radians(360/36 * 28)), radiusA *sin(radians(360/36 * 28)), zA);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 29)), radiusA *sin(radians(360/36 * 29)), zA);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 30)), radiusA *sin(radians(360/36 * 30)), zA);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 31)), radiusA *sin(radians(360/36 * 31)), zA);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 32)), radiusA *sin(radians(360/36 * 32)), zA);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 33)), radiusA *sin(radians(360/36 * 33)), zA);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 34)), radiusA *sin(radians(360/36 * 34)), zA);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 35)), radiusA *sin(radians(360/36 * 35)), zA);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  vertex(radiusB *cos(radians(360/36 * 36)), radiusB *sin(radians(360/36 * 36)), zB);
  
  vertex(radiusA*cos(radians(0)), radiusA*sin(radians(0)), zA);


/////////////////////////FIFTEENTH LAYER
  
  radiusA = 6.45;
  radiusB = 6.3;
  zA = -6;
  zB = -5;
  
  vertex(radiusA *cos(radians(0)), radiusA *sin(radians(0)), zA);
  vertex(radiusB *cos(radians(0)), radiusB *sin(radians(0)), zB);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 1)), radiusA *sin(radians(360/36 * 1)), zA);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 2)), radiusA *sin(radians(360/36 * 2)), zA);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 3)), radiusA *sin(radians(360/36 * 3)), zA);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 4)), radiusA *sin(radians(360/36 * 4)), zA);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 5)), radiusA *sin(radians(360/36 * 5)), zA);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 6)), radiusA *sin(radians(360/36 * 6)), zA);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 7)), radiusA *sin(radians(360/36 * 7)), zA);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 8)), radiusA *sin(radians(360/36 * 8)), zA);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 9)), radiusA *sin(radians(360/36 * 9)), zA);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 10)), radiusA *sin(radians(360/36 * 10)), zA);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 11)), radiusA *sin(radians(360/36 * 11)), zA);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 12)), radiusA *sin(radians(360/36 * 12)), zA);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 13)), radiusA *sin(radians(360/36 * 13)), zA);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 14)), radiusA *sin(radians(360/36 * 14)), zA);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 15)), radiusA *sin(radians(360/36 * 15)), zA);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 16)), radiusA *sin(radians(360/36 * 16)), zA);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 17)), radiusA *sin(radians(360/36 * 17)), zA);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);

  vertex(radiusA *cos(radians(360/36 * 18)), radiusA *sin(radians(360/36 * 18)), zA);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 19)), radiusA *sin(radians(360/36 * 19)), zA);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 20)), radiusA *sin(radians(360/36 * 20)), zA);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 21)), radiusA *sin(radians(360/36 * 21)), zA);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 22)), radiusA *sin(radians(360/36 * 22)), zA);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 23)), radiusA *sin(radians(360/36 * 23)), zA);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 24)), radiusA *sin(radians(360/36 * 24)), zA);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 25)), radiusA *sin(radians(360/36 * 25)), zA);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 26)), radiusA *sin(radians(360/36 * 26)), zA);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 27)), radiusA *sin(radians(360/36 * 27)), zA);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
    
  vertex(radiusA *cos(radians(360/36 * 28)), radiusA *sin(radians(360/36 * 28)), zA);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 29)), radiusA *sin(radians(360/36 * 29)), zA);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 30)), radiusA *sin(radians(360/36 * 30)), zA);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 31)), radiusA *sin(radians(360/36 * 31)), zA);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 32)), radiusA *sin(radians(360/36 * 32)), zA);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 33)), radiusA *sin(radians(360/36 * 33)), zA);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 34)), radiusA *sin(radians(360/36 * 34)), zA);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 35)), radiusA *sin(radians(360/36 * 35)), zA);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  vertex(radiusB *cos(radians(360/36 * 36)), radiusB *sin(radians(360/36 * 36)), zB);
  
  vertex(radiusA*cos(radians(0)), radiusA*sin(radians(0)), zA);

/////////////////////////SIXTEENTH LAYER
  
  radiusA = 6.3;
  radiusB = 6;
  zA = -5;
  zB = -4;
  
  vertex(radiusA *cos(radians(0)), radiusA *sin(radians(0)), zA);
  vertex(radiusB *cos(radians(0)), radiusB *sin(radians(0)), zB);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 1)), radiusA *sin(radians(360/36 * 1)), zA);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 2)), radiusA *sin(radians(360/36 * 2)), zA);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 3)), radiusA *sin(radians(360/36 * 3)), zA);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 4)), radiusA *sin(radians(360/36 * 4)), zA);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 5)), radiusA *sin(radians(360/36 * 5)), zA);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 6)), radiusA *sin(radians(360/36 * 6)), zA);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 7)), radiusA *sin(radians(360/36 * 7)), zA);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 8)), radiusA *sin(radians(360/36 * 8)), zA);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 9)), radiusA *sin(radians(360/36 * 9)), zA);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 10)), radiusA *sin(radians(360/36 * 10)), zA);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 11)), radiusA *sin(radians(360/36 * 11)), zA);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 12)), radiusA *sin(radians(360/36 * 12)), zA);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 13)), radiusA *sin(radians(360/36 * 13)), zA);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 14)), radiusA *sin(radians(360/36 * 14)), zA);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 15)), radiusA *sin(radians(360/36 * 15)), zA);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 16)), radiusA *sin(radians(360/36 * 16)), zA);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 17)), radiusA *sin(radians(360/36 * 17)), zA);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);

  vertex(radiusA *cos(radians(360/36 * 18)), radiusA *sin(radians(360/36 * 18)), zA);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 19)), radiusA *sin(radians(360/36 * 19)), zA);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 20)), radiusA *sin(radians(360/36 * 20)), zA);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 21)), radiusA *sin(radians(360/36 * 21)), zA);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 22)), radiusA *sin(radians(360/36 * 22)), zA);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 23)), radiusA *sin(radians(360/36 * 23)), zA);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 24)), radiusA *sin(radians(360/36 * 24)), zA);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 25)), radiusA *sin(radians(360/36 * 25)), zA);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 26)), radiusA *sin(radians(360/36 * 26)), zA);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 27)), radiusA *sin(radians(360/36 * 27)), zA);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
    
  vertex(radiusA *cos(radians(360/36 * 28)), radiusA *sin(radians(360/36 * 28)), zA);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 29)), radiusA *sin(radians(360/36 * 29)), zA);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 30)), radiusA *sin(radians(360/36 * 30)), zA);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 31)), radiusA *sin(radians(360/36 * 31)), zA);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 32)), radiusA *sin(radians(360/36 * 32)), zA);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 33)), radiusA *sin(radians(360/36 * 33)), zA);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 34)), radiusA *sin(radians(360/36 * 34)), zA);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 35)), radiusA *sin(radians(360/36 * 35)), zA);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  vertex(radiusB *cos(radians(360/36 * 36)), radiusB *sin(radians(360/36 * 36)), zB);
  
  vertex(radiusA*cos(radians(0)), radiusA*sin(radians(0)), zA);


/////////////////////////FIFTEENTH LAYER
  
  radiusA = 6;
  radiusB = 5.3;
  zA = -4;
  zB = -3;
  
  vertex(radiusA *cos(radians(0)), radiusA *sin(radians(0)), zA);
  vertex(radiusB *cos(radians(0)), radiusB *sin(radians(0)), zB);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 1)), radiusA *sin(radians(360/36 * 1)), zA);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 2)), radiusA *sin(radians(360/36 * 2)), zA);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 3)), radiusA *sin(radians(360/36 * 3)), zA);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 4)), radiusA *sin(radians(360/36 * 4)), zA);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 5)), radiusA *sin(radians(360/36 * 5)), zA);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 6)), radiusA *sin(radians(360/36 * 6)), zA);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 7)), radiusA *sin(radians(360/36 * 7)), zA);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 8)), radiusA *sin(radians(360/36 * 8)), zA);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 9)), radiusA *sin(radians(360/36 * 9)), zA);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 10)), radiusA *sin(radians(360/36 * 10)), zA);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 11)), radiusA *sin(radians(360/36 * 11)), zA);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 12)), radiusA *sin(radians(360/36 * 12)), zA);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 13)), radiusA *sin(radians(360/36 * 13)), zA);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 14)), radiusA *sin(radians(360/36 * 14)), zA);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 15)), radiusA *sin(radians(360/36 * 15)), zA);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 16)), radiusA *sin(radians(360/36 * 16)), zA);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 17)), radiusA *sin(radians(360/36 * 17)), zA);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);

  vertex(radiusA *cos(radians(360/36 * 18)), radiusA *sin(radians(360/36 * 18)), zA);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 19)), radiusA *sin(radians(360/36 * 19)), zA);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 20)), radiusA *sin(radians(360/36 * 20)), zA);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 21)), radiusA *sin(radians(360/36 * 21)), zA);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 22)), radiusA *sin(radians(360/36 * 22)), zA);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 23)), radiusA *sin(radians(360/36 * 23)), zA);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 24)), radiusA *sin(radians(360/36 * 24)), zA);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 25)), radiusA *sin(radians(360/36 * 25)), zA);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 26)), radiusA *sin(radians(360/36 * 26)), zA);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 27)), radiusA *sin(radians(360/36 * 27)), zA);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
    
  vertex(radiusA *cos(radians(360/36 * 28)), radiusA *sin(radians(360/36 * 28)), zA);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 29)), radiusA *sin(radians(360/36 * 29)), zA);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 30)), radiusA *sin(radians(360/36 * 30)), zA);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 31)), radiusA *sin(radians(360/36 * 31)), zA);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 32)), radiusA *sin(radians(360/36 * 32)), zA);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 33)), radiusA *sin(radians(360/36 * 33)), zA);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 34)), radiusA *sin(radians(360/36 * 34)), zA);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 35)), radiusA *sin(radians(360/36 * 35)), zA);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  vertex(radiusB *cos(radians(360/36 * 36)), radiusB *sin(radians(360/36 * 36)), zB);
  
  vertex(radiusA*cos(radians(0)), radiusA*sin(radians(0)), zA);
  
  
  /////////////////////////SEVENTEENTH LAYER
/*
  radiusA = 5.3;
  radiusB = 4.7;
  zA = -3;
  zB = -2;
  
  vertex(radiusA *cos(radians(0)), radiusA *sin(radians(0)), zA);
  vertex(radiusB *cos(radians(0)), radiusB *sin(radians(0)), zB);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 1)), radiusA *sin(radians(360/36 * 1)), zA);
  vertex(radiusB *cos(radians(360/36 * 1)), radiusB *sin(radians(360/36 * 1)), zB);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 2)), radiusA *sin(radians(360/36 * 2)), zA);
  vertex(radiusB *cos(radians(360/36 * 2)), radiusB *sin(radians(360/36 * 2)), zB);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 3)), radiusA *sin(radians(360/36 * 3)), zA);
  vertex(radiusB *cos(radians(360/36 * 3)), radiusB *sin(radians(360/36 * 3)), zB);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 4)), radiusA *sin(radians(360/36 * 4)), zA);
  vertex(radiusB *cos(radians(360/36 * 4)), radiusB *sin(radians(360/36 * 4)), zB);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 5)), radiusA *sin(radians(360/36 * 5)), zA);
  vertex(radiusB *cos(radians(360/36 * 5)), radiusB *sin(radians(360/36 * 5)), zB);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 6)), radiusA *sin(radians(360/36 * 6)), zA);
  vertex(radiusB *cos(radians(360/36 * 6)), radiusB *sin(radians(360/36 * 6)), zB);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 7)), radiusA *sin(radians(360/36 * 7)), zA);
  vertex(radiusB *cos(radians(360/36 * 7)), radiusB *sin(radians(360/36 * 7)), zB);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 8)), radiusA *sin(radians(360/36 * 8)), zA);
  vertex(radiusB *cos(radians(360/36 * 8)), radiusB *sin(radians(360/36 * 8)), zB);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 9)), radiusA *sin(radians(360/36 * 9)), zA);
  vertex(radiusB *cos(radians(360/36 * 9)), radiusB *sin(radians(360/36 * 9)), zB);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 10)), radiusA *sin(radians(360/36 * 10)), zA);
  vertex(radiusB *cos(radians(360/36 * 10)), radiusB *sin(radians(360/36 * 10)), zB);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 11)), radiusA *sin(radians(360/36 * 11)), zA);
  vertex(radiusB *cos(radians(360/36 * 11)), radiusB *sin(radians(360/36 * 11)), zB);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 12)), radiusA *sin(radians(360/36 * 12)), zA);
  vertex(radiusB *cos(radians(360/36 * 12)), radiusB *sin(radians(360/36 * 12)), zB);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 13)), radiusA *sin(radians(360/36 * 13)), zA);
  vertex(radiusB *cos(radians(360/36 * 13)), radiusB *sin(radians(360/36 * 13)), zB);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 14)), radiusA *sin(radians(360/36 * 14)), zA);
  vertex(radiusB *cos(radians(360/36 * 14)), radiusB *sin(radians(360/36 * 14)), zB);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 15)), radiusA *sin(radians(360/36 * 15)), zA);
  vertex(radiusB *cos(radians(360/36 * 15)), radiusB *sin(radians(360/36 * 15)), zB);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 16)), radiusA *sin(radians(360/36 * 16)), zA);
  vertex(radiusB *cos(radians(360/36 * 16)), radiusB *sin(radians(360/36 * 16)), zB);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 17)), radiusA *sin(radians(360/36 * 17)), zA);
  vertex(radiusB *cos(radians(360/36 * 17)), radiusB *sin(radians(360/36 * 17)), zB);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);

  vertex(radiusA *cos(radians(360/36 * 18)), radiusA *sin(radians(360/36 * 18)), zA);
  vertex(radiusB *cos(radians(360/36 * 18)), radiusB *sin(radians(360/36 * 18)), zB);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 19)), radiusA *sin(radians(360/36 * 19)), zA);
  vertex(radiusB *cos(radians(360/36 * 19)), radiusB *sin(radians(360/36 * 19)), zB);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 20)), radiusA *sin(radians(360/36 * 20)), zA);
  vertex(radiusB *cos(radians(360/36 * 20)), radiusB *sin(radians(360/36 * 20)), zB);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 21)), radiusA *sin(radians(360/36 * 21)), zA);
  vertex(radiusB *cos(radians(360/36 * 21)), radiusB *sin(radians(360/36 * 21)), zB);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 22)), radiusA *sin(radians(360/36 * 22)), zA);
  vertex(radiusB *cos(radians(360/36 * 22)), radiusB *sin(radians(360/36 * 22)), zB);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 23)), radiusA *sin(radians(360/36 * 23)), zA);
  vertex(radiusB *cos(radians(360/36 * 23)), radiusB *sin(radians(360/36 * 23)), zB);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 24)), radiusA *sin(radians(360/36 * 24)), zA);
  vertex(radiusB *cos(radians(360/36 * 24)), radiusB *sin(radians(360/36 * 24)), zB);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 25)), radiusA *sin(radians(360/36 * 25)), zA);
  vertex(radiusB *cos(radians(360/36 * 25)), radiusB *sin(radians(360/36 * 25)), zB);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 26)), radiusA *sin(radians(360/36 * 26)), zA);
  vertex(radiusB *cos(radians(360/36 * 26)), radiusB *sin(radians(360/36 * 26)), zB);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 27)), radiusA *sin(radians(360/36 * 27)), zA);
  vertex(radiusB *cos(radians(360/36 * 27)), radiusB *sin(radians(360/36 * 27)), zB);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
    
  vertex(radiusA *cos(radians(360/36 * 28)), radiusA *sin(radians(360/36 * 28)), zA);
  vertex(radiusB *cos(radians(360/36 * 28)), radiusB *sin(radians(360/36 * 28)), zB);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 29)), radiusA *sin(radians(360/36 * 29)), zA);
  vertex(radiusB *cos(radians(360/36 * 29)), radiusB *sin(radians(360/36 * 29)), zB);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 30)), radiusA *sin(radians(360/36 * 30)), zA);
  vertex(radiusB *cos(radians(360/36 * 30)), radiusB *sin(radians(360/36 * 30)), zB);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 31)), radiusA *sin(radians(360/36 * 31)), zA);
  vertex(radiusB *cos(radians(360/36 * 31)), radiusB *sin(radians(360/36 * 31)), zB);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 32)), radiusA *sin(radians(360/36 * 32)), zA);
  vertex(radiusB *cos(radians(360/36 * 32)), radiusB *sin(radians(360/36 * 32)), zB);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 33)), radiusA *sin(radians(360/36 * 33)), zA);
  vertex(radiusB *cos(radians(360/36 * 33)), radiusB *sin(radians(360/36 * 33)), zB);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 34)), radiusA *sin(radians(360/36 * 34)), zA);
  vertex(radiusB *cos(radians(360/36 * 34)), radiusB *sin(radians(360/36 * 34)), zB);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  
  vertex(radiusA *cos(radians(360/36 * 35)), radiusA *sin(radians(360/36 * 35)), zA);
  vertex(radiusB *cos(radians(360/36 * 35)), radiusB *sin(radians(360/36 * 35)), zB);
  vertex(radiusB *cos(radians(360/36 * 36)), radiusB *sin(radians(360/36 * 36)), zB);
  
  vertex(radiusA*cos(radians(0)), radiusA*sin(radians(0)), zA);
  
*/

  endShape();


////////////////////CURVE
/*
  beginShape();
  curveVertex(-2,-20,0);
  curveVertex(-2,-20,0);
  curveVertex(0,-20,-2);
  curveVertex(2,-20,0);
  curveVertex(0,-20,2);
  curveVertex(-2,-20,0);
  curveVertex(-2,-20,0);
  endShape();
*/

////////////////////BEZIER VERTEX
/*
  beginShape();
  vertex(0,-20,0);
  bezierVertex(-2,-20,0,-2,-20,0,-2,-19,0);
  endShape();
  */
}

