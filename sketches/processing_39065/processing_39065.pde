
int drawn = 0;
void setup()
{
  size(360, 120, P2D); 
  colorMode(RGB, 255, 255, 255, 255);
}

void draw()
{
  if (drawn ==0) {
    background(0);
    for (int i = 0; i < 36; i++)
    {
      fill(HSL2RGB(i * 10.0, 1.0, 0.5));
      rect(10 * i, 0 , 10, height);
    }
    drawn = 1;
  }
}

// Given H,S,L in range of 0-360, 0-1, 0-1  Returns a Color
color HSL2RGB(float hue, float sat, float lum)
{
    float v;
    float red, green, blue;
    float m;
    float sv;
    int sextant;
    float fract, vsf, mid1, mid2;

    red = lum;   // default to gray
    green = lum;
    blue = lum;
    v = (lum <= 0.5) ? (lum * (1.0 + sat)) : (lum + sat - lum * sat);
    m = lum + lum - v;
    sv = (v - m) / v;
    hue /= 60.0;  //get into range 0..6
    sextant = floor(hue);  // int32 rounds up or down.
    fract = hue - sextant;
    vsf = v * sv * fract;
    mid1 = m + vsf;
    mid2 = v - vsf;

    if (v > 0)
    {
        switch (sextant)
        {
            case 0: red = v; green = mid1; blue = m; break;
            case 1: red = mid2; green = v; blue = m; break;
            case 2: red = m; green = v; blue = mid1; break;
            case 3: red = m; green = mid2; blue = v; break;
            case 4: red = mid1; green = m; blue = v; break;
            case 5: red = v; green = m; blue = mid2; break;
        }
    }
    return color(red * 255, green * 255, blue * 255);
}

