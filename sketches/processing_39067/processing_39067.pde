
// creates a star
// drag Right mouse to control number of sides
// drag Left mouse up/down for outer radius and left/right for inner radius
int nSides = 36;
int drawn = 0;
int innerRad = 20;
int outerRad = 130;

void setup()
{
size(300,300, P2D);
}

void draw()
{
  if (drawn ==0) {
    background(0);
    pushMatrix();
    translate(width / 2, height /2);
    //  star(nSides, innerRad, outerRad, true);
    star(nSides, innerRad, outerRad, false);
    popMatrix();
    drawn = 1;
  }
}
void mouseDragged() 
{
  if (mouseButton == LEFT)
  {
    innerRad = mouseX ;
    outerRad = mouseY;
  }
  else 
  {
    nSides = mouseX / 5;
  }
  drawn = 0;
}

void mouseClicked() {
  nSides++;
  drawn = 0;
}

void star(int nPoints, float rad1, float rad2, boolean filled)
{
float angle = TWO_PI / nPoints;
float angle2 = angle / 2;
float origAngle = 0.0;
float o1 = rad1 / 2 ;
float o2 = rad2 / 2 ;
float col = 0;
float colN = 360.0 / (nSides * 2.0);

if (filled)  
{
  beginShape();
  fill(HSL2RGB(0.0, 1.0, 1.0 ));
  stroke(HSL2RGB(0.0, 1.0, 1.0 ));
  strokeWeight(1);
}
else
  strokeWeight(2);
for (int i = 0; i < nPoints; i++)
  {
  float y1 = rad1 * sin(origAngle);
  float x1 = rad1 * cos(origAngle);
  float y2 = rad2 * sin(origAngle + angle2);
  float x2 = rad2 * cos(origAngle + angle2);
  float y3 = rad1 * sin(origAngle + angle);
  float x3 = rad1 * cos(origAngle + angle);
  if (filled)
  {
    vertex(x1, y1);
    vertex(x2, y2);
  }
  else
  {
    stroke(HSL2RGB(col, 1.0, 0.5 )); col += colN;
    line(x1, y1, x2, y2);
    stroke(HSL2RGB(col, 1.0, 0.5 )); col += colN;
    line(x2, y2, x3, y3);
  }
  origAngle += angle;
  }
if (filled)  endShape(CLOSE);
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

