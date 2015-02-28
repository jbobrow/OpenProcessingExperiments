
float Cx, Cy;
float Vx, Vy;
float Radius;

void setup() {
   size(600, 400);
   Cx = 300;
   Cy = 200;
   Radius = 30;
   Vx = 2;
   Vy = 3;
}

void draw() {
   float noiseScale = 0.02;
   Radius += lerp(-1, 1, noise(frameCount*noiseScale));
   Radius = constrain(Radius, 10, 50);
  
   Vx += lerp(-0.25, 0.25, noise(noiseScale*Cx, noiseScale*Cy));
   Vy += lerp(-0.25, 0.25, noise(noiseScale*Cy, noiseScale*Cx));

   Cx += Vx;
   Cy += Vy;
   if ((Cx-Radius < 0) || (Cx+Radius >= width)) {
      Vx = -Vx;
      Cx += 2 * Vx;
   }
   if ((Cy-Radius < 0) || (Cy+Radius >= height)) {
      Vy = -Vy;
      Cy += 2 * Vy;
   }

   //background(128, 103, 103);
   //noStroke();
   stroke(0);
   fill(224, 199, 37);
   ellipse(Cx, Cy, Radius*2, Radius*2);
}
