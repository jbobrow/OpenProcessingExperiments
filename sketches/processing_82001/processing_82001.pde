
int resolution = 256;


void setup() { 

noStroke();
size(resolution,resolution);
colorMode(HSB, 1);
}

float rs = resolution / TWO_PI;
float kx_a,ky_a,deg_a=0,ph_a=0;
float kx_b,ky_b,deg_b=0,ph_b=0;
float kx_c,ky_c,deg_c=0,ph_c=0;
float kx_d,ky_d,deg_d=0,ph_d=0;
float color_offset=0;

int frames = 0;
int farb_select;
float c,d,c_a,c_b,c_c,c_d;
color punkt_farbe;
float e = 0;

//-------------------- vorgaben -------------
float force_a=0.374;
float g_a = 0.82;
float deg_speed_a = 0.0113;
float ph_speed_a = 0.045;

float force_b=0.356;
float g_b = 0.74;
float deg_speed_b = -0.00645;
float ph_speed_b = 0.0154;

float force_c=0.354;
float g_c = 0.965;
float deg_speed_c = 0.00946;
float ph_speed_c = 0.015;

float force_d=0.386;
float g_d = 0.887;
float deg_speed_d = -0.00865;
float ph_speed_d = -0.045;

float prozent_schwarz = 0.2;



void draw(){

frames=frames+1;
if (frames>=5000) 
{
exit();
}

// Drehwinkel variieren
deg_a=deg_a+deg_speed_a;
kx_a=sin(deg_a)*force_a/rs;
ky_a=cos(deg_a)*force_a/rs;

deg_b=deg_b+deg_speed_b;
kx_b=sin(deg_b)*force_b/rs;
ky_b=cos(deg_b)*force_b/rs;

deg_c=deg_c+deg_speed_c;
kx_c=sin(deg_c)*force_c/rs;
ky_c=cos(deg_c)*force_c/rs;

deg_d=deg_d+deg_speed_d;
kx_d=sin(deg_d)*force_d/rs;
ky_d=cos(deg_d)*force_d/rs;


// Phasenlage variieren
ph_a = ph_a + ph_speed_a;
ph_b = ph_b + ph_speed_b;
ph_c = ph_c + ph_speed_c;
ph_d = ph_d + ph_speed_d;

// Farbpalette rotieren
color_offset = color_offset + 0.01;

if (color_offset >= 1.0)
{color_offset = 0.0;}



for (int x = 0; x < resolution; x++) {
  for (int y = 0; y < resolution; y++) {

    c_a=sin(kx_a * x  + ky_a * y + ph_a);
    c_b=sin(ky_b * x  + kx_b * y + ph_b);
    c_c=sin(kx_c * x  + ky_c * y + ph_c); 
    c_d=sin(kx_d * x  + ky_d * y + ph_d); 

    c = ((c_a * c_b * c_c * c_d)+1)/2;   // liefert ergebnisse von 0 bis 1 
//    c = ((c_a)+1)/2;   // liefert ergebnisse von 0 bis 1 

//  -------- Zeit für Farbe ---------

    d=c + color_offset;
    if (d>=1.0) 
    {d=d-1.0;}
    
    e=c-prozent_schwarz;
    if (e<0.0)
    {e=0.0;}
    e=e*(1/(1-prozent_schwarz));  // normalisieren auf bereich 0.0 bis 1.0
    
    stroke (d,1,e*2);
    point(x, y);
//    point(x*2+1, y*2);
//    point(x*2, y*2+1);
//    point(x*2+1, y*2+1);
  }
  
}
}

//sin(kx * x + ky *y +phase)
//2pi /wellenlänge
