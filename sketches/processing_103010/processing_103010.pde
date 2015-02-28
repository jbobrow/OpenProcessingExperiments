
float DEGREES_TO_RADIANS = PI / 180;
float[] sine_table = new float[360];
color[] color_table = new color[256];
int constant = 0;

void FillSineTable()
{
  for (int x = 0; x < 360; x++)
  {
    sine_table[x] = sin((float) x * DEGREES_TO_RADIANS); 
  } 
}

void FillColorTable()
{
  for (int i = 0; i < 64; i++)
  {
     color_table[i] = color(0, 0, i * 3);
     color_table[i + 64] = color(0, i * 3, (63 - i) * 3);
     color_table[i + 64 + 64] = color(i * 3, (63 - i) * 3, 0);
     color_table[i + 64 + 64 + 64] = color((63 - i) * 3, 0, 0);
  } 
}

void setup()
{
  size(640, 360);
  background(0);
  FillSineTable();
  FillColorTable();
}

void draw()
{ 
  loadPixels();
  
  for (int x = 0; x < width; x++)
  {
    float horz_val = 20 * sine_table[ (x*2 + constant)     % 360] +
                     30 * sine_table[ (x   + constant / 2) % 360] +
                     40 * sine_table[ (x/2 + constant * 2) % 360];
    
    for (int y = 0; y < height; y++)
    {
      float vert_val = 40 * sine_table[ (y*2 + constant) % 360] +
                       30 * sine_table[ (y   + constant/2) % 360] +
                       20 * sine_table[ (y/2 + constant*2) % 360];
                         
      float final_val = abs(horz_val + vert_val);
      if (final_val > 255) final_val = 255;
      color c = color_table[(int) final_val];
      
      //stroke(c);
      //point(x, y);
      
      pixels[(y * width) + x] = c;
    }  
  }
  
  updatePixels();
  
  constant++;
}


