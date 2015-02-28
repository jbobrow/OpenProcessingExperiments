
PImage bola_red;
void setup() {
  size(351,351);
  background(12, 12, 12, 0);
  bola_red=loadImage("bola_red.png");
 
}
void draw() {
   
  background(15, 15, 15, 0);
  image(bola_red,0,0);
  // ponteiro dos segundos 
  fill(abs(255*sin(millis()/1000.0)),random(240),random(210) );
  pushMatrix();
  translate(width/2, height/2);
  rotate( second() *  2*PI/60 );
  stroke(abs(255*sin(millis()/1000.0)), abs(255*sin(millis()/1000.0)), abs(255*sin(millis()/1000.0)));
  strokeWeight(3);
  line(0, 0, 0, -width/2 + 15);
  ellipse(0, -width/2 + 15, 15, 15);
  popMatrix();

  // ponteiro dos minutos
  pushMatrix();
  translate(width/2, height/2);
  rotate( minute() * 2*PI/60 );
  stroke(200, abs(255*sin(millis()/10000.0)), abs(255*sin(millis()/1000.0)));
  strokeWeight(4);
  line(0, 0, 0, -width/2 + 15);
 ellipse( 0, -width/2 + 15,20,20);
  popMatrix();

  // ponteiro das horas
  pushMatrix();
  translate(width/2, height/2);
  rotate( hour() *2*PI/12); 
  stroke(abs(255*sin(millis()/1000.0)), abs(255*sin(millis()/10000.0)), 16);
  strokeWeight(5);
 line(0, 0, 0, -width/2 + 15);
  ellipse( 0, -width/2 + 15, 25,25);
  popMatrix();
    ellipse(175.5,175.5,15,15);
 
}



