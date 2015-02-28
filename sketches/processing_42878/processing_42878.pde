
float NoiseScale = 0.0006;
float NoiseOffsetX, NoiseOffsetY;

void setup() 
{
   size(800, 600, P2D);
   background(255);
   smooth();
   noFill();
   stroke(0, 0, 155, 7);
   for (int i=0; i<300; i++) 
   {
      NoiseOffsetX += 25;
      NoiseOffsetY += 7.1;
      drawOneStream();
   }
}

void drawOneStream() 
{
   float px = 0;//(начинается)расположение по x
   float py = height-50;//расположение по y
   float vx = 1;
   float vy = 0;
   int pcnt = 0;
   while ((px>=0) && (px<width) && (py<height) && (py>=0)) //весь холст
   {
      point(px, py);
      float xNoise = noise((pcnt+NoiseOffsetX) * NoiseScale);
      float yNoise = noise((pcnt+NoiseOffsetY) * NoiseScale);
      //vx = ((2*vx) + 1 + map(xNoise, 0, 1, -1, 1))/4.0;
      vx = ((2*vx) + 1 + map(xNoise, 0, 1, -1, 1))/14.0;
      vy = ((3*vy) + map(yNoise, 0, 1, -1, 1))/4.0;
      //vy = ((3*vy) + map(yNoise, 0, 1, -1, 1))/3.5;
      px += vx;
      py += vy;
      pcnt++;
   }
}
               
