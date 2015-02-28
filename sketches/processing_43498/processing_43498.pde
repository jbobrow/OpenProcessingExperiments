
int i;
int j;

int edge = 900;

int radius = 50;
float repulsion = 0.000015;
float xforce;
float yforce;
float damping = 0.999;
float lim = 1;

float dia = 5;

int elnum = 200;

float[] x = new float[elnum];
float[] y = new float[elnum];
float[] xnew = new float[elnum];
float[] ynew = new float[elnum];

float[] xvel = new float[elnum];
float[] yvel = new float[elnum];


  
void setup() {
  size(900, 450);
  background(100);
  
  xvel[j] = 0;
  yvel[j] = 0;
  
  for (i=0; i<elnum; i++) {
    x[i] = random(0, (edge-1)/4); 
    y[i] = random(0, (edge-1)/4);
    noStroke();
    ellipse(x[i], y[i], dia, dia);
  }
}

void draw() {
  background(100);
  update();
}


void update() {
  for (j=0; j<elnum; j++) {
    
    for(i=0; i<elnum; i++) {
     if (sq(x[i] - x[j]) + sq(y[i] - y[j]) < sq(radius) && i != j) {
        xforce = 1 / ((x[j] - x[i]) * abs(x[j] - x[i]));
        yforce = 1 / ((y[j] - y[i]) * abs(y[j] - y[i]));
        
        if (xforce > lim)
        xforce = lim;
        else if (xforce < -lim)
        xforce = -lim;
        else if (yforce > lim)
        yforce = lim;
        else if (yforce < -lim)
        yforce = -lim;
       
        xvel[j] = (xvel[j] + repulsion/ xforce) * damping;
        yvel[j] = (yvel[j] + repulsion / yforce) * damping;
      }
    }
   
   xnew[j] = x[j] + xvel[j]; 
   ynew[j] = y[j] + yvel[j];
   
   if (xnew[j] < 0)
   xvel[j] = -(xvel[j]);
   else if (xnew[j] > width)
    xvel[j] = -(xvel[j]);
   
   if (ynew[j] < 0)
    yvel[j] = -(yvel[j]);
   else if (ynew[j] > height)
   yvel[j] = -(yvel[j]);
   
   noStroke();
   ellipse(xnew[j], ynew[j], dia, dia);
  }
  for(i=0; i<elnum; i++) {
  x[i] = xnew[i];
  y[i] = ynew[i];
  }
}
    
    
                                                                
