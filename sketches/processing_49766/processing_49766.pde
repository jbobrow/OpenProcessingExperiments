
size(200,200);
background(#19837D);
smooth();

float x = 100;
float y = 100;
int nombreDeRayons = 40;
int longueurDesRayons = 60;


float tranche = TWO_PI / nombreDeRayons;
float rads = 0;
float ratio = 0.75;

strokeWeight(5);
stroke(#FFF700);
while ( rads < TWO_PI ) {
 float x1 = x+cos(rads) * longueurDesRayons * ratio;
 float y1 = y + sin(rads) * longueurDesRayons * ratio;
 float x2 = x+cos(rads) * longueurDesRayons;
 float y2 = y + sin(rads) * longueurDesRayons;
  line(x1,y1,x2,y2 );
  rads = rads + tranche;
  
}               
