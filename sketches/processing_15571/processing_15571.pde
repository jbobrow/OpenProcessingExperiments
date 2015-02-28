


void setup (){
  size (1000, 700);

  smooth ();
}



int space = 25;
float influence = 130;
float minRadius = 20;
float maxRadius = 100;

// Definiere Kreis / Wiederholung
void kreis (float kontur, float _r, float _g, float _b, float _alpha) {
 strokeWeight(kontur);
 fill(_r, _g, _b, _alpha);

  for(int x = 15; x < width; x += space){
    for(int y = 15; y < height; y += space){
      
      // TRacking Position einsetzen
      float radius = 1-(min(dist (x,y,mouseX,mouseY),influence)/influence);
      radius = lerp (minRadius, maxRadius,radius);
       ellipse (x,y,radius,radius);
    }
  }
  
}



// Zeichne Kreis
void draw (){
  background (0);
  kreis (0, 255, 255, 255, 100);
}


