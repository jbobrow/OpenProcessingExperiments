
// The Mandelbrot Set Fractal
// (see http://en.wikipedia.org/wiki/Mandelbrot_set)
// implemented by Jakob Thomsen

size(512,512);
int w = width;
int h = height;
int N = 15, u, v, n;
float x, y, cx, cy, zx, zy, nx, ny;  
for(v = 0; v < h; v++)
{
  for(u = 0; u < w; u++)
  {
    x = 2.0 * (float)u / (float)w - 1.0;
    y = 2.0 * (float)v / (float)h - 1.0;
    cx = x * 1.5 - 0.5;
    cy = y * 1.5 + 0.0;
    zx = 0;            
    zy = 0;            
    /*
    zx = x * 2.0 - 0.0;
    zy = y * 2.0 + 0.0;
    cx = -0.95;            
    cy = 0.25;  
    */
    for(n = 0; n < N && zx * zx + zy * zy < 4.0; n++)
    {
        nx = zx * zx - zy * zy + cx;
        ny = 2 * zx * zy       + cy;
        zx = nx;
        zy = ny;
    }
    stroke(255 * n / N);
    point(u, v);
  }
}

// saveFrame("mandelbrot.tif");
