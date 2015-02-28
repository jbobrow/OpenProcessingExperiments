
PImage redeglobo;
void setup() {
  size(423, 423);
  background(12, 12, 12, 0);
  redeglobo= loadImage("Redeglobo.png");
}
void draw() {
  background(255, 255, 255, 0);

  image(redeglobo, 0,0);
  // ponteiro dos segundos 
  pushMatrix();
  translate(width/2, height/2);
  rotate( second() *  2*PI/60 );
  stroke(abs(255*sin(millis()/1000.0)), abs(255*sin(millis()/1000.0)),abs(255*sin(millis()/1000.0)));
  strokeWeight(3);
  line(0, 0, 0, -width/2 + 15);
  popMatrix();

  // ponteiro dos minutos
  pushMatrix();
 translate(width/2, height/2);
  rotate( minute() * 2*PI/60 );
  stroke(200, abs(255*sin(millis()/10000.0)),abs(255*sin(millis()/1000.0)));
  strokeWeight(4);
  line(0, 0, 0, -width/2 + 15);
  popMatrix();
  
  // ponteiro das horas
  pushMatrix();
 translate(width/2, height/2);
  rotate( hour() *2*PI/12); 
  stroke(abs(255*sin(millis()/1000.0)), abs(255*sin(millis()/10000.0)) , 16);
  strokeWeight(5);
  line(0, 0, 0, -width/2 + 15);
  popMatrix();
  
}



