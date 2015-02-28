
size(200,200);
background(#0F0076);

float x = 100;
float y = 100;
float longueurDesRayons = 75;

strokeWeight(5);
stroke(#F50007);
fill(#F50007);
ellipse(x,y,longueurDesRayons/2,longueurDesRayons/2);
line(x,y, x + cos(1.25) * longueurDesRayons , y + sin(1.25) * longueurDesRayons );
line(x,y, x + cos(2.5) * longueurDesRayons , y + sin(2.5) * longueurDesRayons );
line(x,y, x + cos(3.75) * longueurDesRayons , y + sin(3.75) * longueurDesRayons );
line(x,y, x + cos(5) * longueurDesRayons , y + sin(5) * longueurDesRayons );
line(x,y, x + cos(6.25) * longueurDesRayons , y + sin(6.25) * longueurDesRayons );
  
                                                
