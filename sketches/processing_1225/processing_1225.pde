
/*
Alba G. Corral
 Marzo 2009, Barcelona
 Motion
 */
float angle = 0.0; // Current angle
float speed = 0.01; // Speed of motion
float radius = 130.0; // Range of motion
float sx ;
float sy ;
float hh = 0;
color col;
void setup() {
  size(925, 475);
  noStroke();
  smooth();
  inicia( random(5.0),random(2.0));
}

void draw() {
  // EVENTOS
  if(keyPressed){
    if(key == '1') {
      inicia(5.0,random(1));
    }
    if(key == '2') {
      background(255);
      inicia(random(1),2);

    }
  }

  angle += speed; // Update the 
  println("angle:;"+angle);

  float sinval = sin(angle/sy);
  float cosval = cos(angle);

  // Set the position of the small circle based on new
  // values from sine and cosine
  float x = width/2 + (cosval * radius);
  float y = height/2 + (sinval * radius);
  fill(255);


  // Set the position of the large circles based on the
  // new position of the small circle
  float x2 = x + cos(angle * sx) * radius ;
  float y2 = y + sin(angle * sy) * radius ;
  ellipse(x2, y2, 1, 1); // Draw larger circle

  //line 
  if(hh<255){
    hh+=1;
  } 
  else{
    hh=0;
  }
  col = color(0,0,100+hh,15);
  stroke(0,random(10,40));
  line(x,y,x2,y2);

}

void inicia(float _sx, float _sy ){
  background(255);
  sy=_sx;
  sx = _sy;
  println("inicia : sx:   "+sx +"  sy:" + sy);
}



