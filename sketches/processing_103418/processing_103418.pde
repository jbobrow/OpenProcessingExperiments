
int counter = 0;
float xCoordsForShapes[] =  new float[15];
float yCoordsForShapes[] =  new float[15];

void setup(){
  size(500,500);
  background(255);
  frameRate(10);

}

void draw(){
  translate((counter*50)%width, height/2);
rotate(2*PI*(.01*counter0));
  drawShape();
  drawShape();
  drawShape();
counter++;
}

void drawShape(){

fill(random(255), random(255), random(255), 30);
stroke(255, 0);
strokeWeight(15);
beginShape();
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
vertex(random(1000),  random(1000));
endShape(CLOSE);

}

void mousePressed(){

}
