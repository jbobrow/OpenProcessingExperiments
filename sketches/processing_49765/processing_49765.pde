
size(200,200);
background(#19837D);

float x = 100;
float y = 100;
int nombreDeRayons = 40;
int longueurDesRayons = 60;


float tranche = TWO_PI / nombreDeRayons;
float rads = 0;

strokeWeight(5);
stroke(#FFF700);
while ( rads < TWO_PI ) {
  line(x,y,x+cos(rads) * longueurDesRayons, y + sin(rads) * longueurDesRayons);
  rads = rads + tranche;
  
}               
