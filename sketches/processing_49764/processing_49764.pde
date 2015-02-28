

size(200,200);
background(#076071);

float x = 100;
float y = 100;
int nombreDeRayons = 40;
int longueurDesRayons = 60;


float tranche = TWO_PI / nombreDeRayons;
float repetitionCourante = 0;
strokeWeight(5);
stroke(#FF9100);

translate(x,y);
while ( repetitionCourante < nombreDeRayons ) {
  rotate(tranche);
  line(0,0,longueurDesRayons, 0);
  repetitionCourante = repetitionCourante + 1;
}
