
void setup() {
  size(400,400);
  frameRate(200);
  xis = 50;
  nxis = 50;
  ratox = 50;
  
  int nbr_circles = 400; 
  float lg_diam = width * .85;
  float lg_rad = lg_diam / 2;
  float lg_circ = PI * lg_diam;
  float sm_diam = (lg_circ / nbr_circles);
  float cx = width/2.0;
  float cy = height/2.0;
  int i = 1;

}

void draw() {
    background(255);

// BOLAZUL
    xis = (xis + 0.3)%(width);  
    float  y = sin(xis/6)*100;
    strokeWeight(1);
    stroke(blue);
    fill( 0, 110, 190 );
    nxis +=(ratox-nxis)/50;
    float posy = y+400/2;
   if (y>90) { ellipse(nxis,posy,60,20); } else
       if (y>80) { ellipse(nxis,posy,55,35); } else
        { ellipse(nxis,posy,50,50); };
                    
  }
