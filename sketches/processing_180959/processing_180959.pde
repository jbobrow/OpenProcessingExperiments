
float[][] colors = new float[3][4];
float d; 
void setup()
{
  size(400, 400);
  rectMode(CENTER); 
  colorMode(RGB); 
  noStroke(); 
  
  for (int j = 0; j <= 3;){
   for (int i = 0; i <= 2;){
     colors[i][j] = random(0,255);
     i += 1;
   }
   j+=1; 
  }

  d = 50;
}

void draw()
{
  background(colors[0][0],colors[1][0],colors[2][0]);
  fill(colors[0][1], colors[1][1], colors[2][1]);
  ellipse( 100, 200, d, d);
  fill (colors[0][2], colors[1][2], colors[2][2]);
  ellipse( 300, 200, d, d); 
  fill (colors[0][3], colors[1][3], colors[2][3]);
  ellipse( 200, 200, d, d);
}
