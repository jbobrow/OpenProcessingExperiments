
size(500,500); 
background(255); 
strokeWeight(.7); 
smooth();
int centX = 250; 
int centY = 250;
float x, y;
for (int i = 0; i<100; i++) {	 
  float lastx = -999; 
  float lasty = -999; 
  float radiusNoise = random(10);
  float radius = 10;
  stroke(random(120), random(150), random(170), 40);	
  int startangle = int(random(360)); 
  int endangle = 1440 + int(random(1440)); 
  int anglestep = 2 + int(random(3)); 
  for (float ang = startangle; ang <= endangle; ang += anglestep) {
    colorMode(HSB, 200);
    radiusNoise += 0.09; 
    radius += 0.5; 
    float thisRadius = radius + (noise(radiusNoise) * 200) - 100; 
    float rad = radians(ang); 
    x = centX + (thisRadius * cos(rad)); 
    y = centY + (thisRadius * sin(rad)); 
    if (lastx > -999) {
      stroke(random(180), random(180), random(180));
      line(x,y,lastx,lasty);
    
} 
lastx = x; 
lasty = y;
}
}  

