
PShape secs1;

void setup (){
  size (700, 700);
   secs1 = loadShape("secs.svg"); 
  smooth ();
    // no se pa que es esto entocnes no lo pongo todavia  
    //noLoop();

}
void draw() {
  background (255);
  //shape(secs, 10, 10, 80, 80);
  secs ();
}

void secs (){
  // osea seis grados  
  float rad = PI/30;
  //float deg = degrees(rad);
  //println(rad + " radians is " + deg + " degrees");
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  fill (100, 100, 100);
  noStroke ();
  translate(width/2, height/2);
  rotate(s*(rad));
  //(la posicion es - la mitad del tamaño del rect)
  //rect(-26,-26, 52, 52);
  shapeMode (CENTER);
  shape(secs1, -40, -40, 80, 80);
}


