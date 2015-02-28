

size(600, 600);
background(0,15,25);
smooth();
noStroke();

float diameter = min(width, height) * 1;
int[] angs = {10, 80, 10, 80, 0, 20, 80, 10};
float lastAng = 3.6;

for (int i = 0; i < angs.length; i++){
  fill(angs[i] * 5.9);
  arc(width/2, height/2, diameter, diameter, lastAng, lastAng+radians(angs[i]));
  lastAng += radians(angs[i]);  
}

saveFrame ("semi circunferencia.png");

