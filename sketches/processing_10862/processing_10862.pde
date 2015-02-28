
int a = 500;
int b = 500;

float i = 0;
float j = 0;
float x = 0;
float y = 0;
float x2 = 0;
float y2 = 0;



// constants

int rep = 40;
int r = 200; // Radius 1
int r2 = 20; // Radius 2
int offset = r + 50;



void setup() {

size (a,b);
stroke(0);
background(255, 204, 0);
zeichneHauptkurve(132,120); // just to start with something beautiful
}

void draw() {

}

void zeichneHauptkurve(float theta, float phi) {


for (float i = 0; i < rep*PI; i = i+ 0.01) {
  x = r*sin(theta*i)*cos(phi*i) + offset;
  y = r*sin(theta*i)*sin(phi*i) + offset;
   
   
   
  if(i != 0) { 
    
    point(x,y); 
  }
  ;
}
  
}

void zeichneNebenwindung(float theta, float phi) {
  for (float j = 0; j < rep*PI; j = j + 0.001) {
  x2 = r2*sin(100*theta*j)*cos(100*phi*j) + r * sin(theta*j)*cos(phi*j) + offset;
  y2 = r2*sin(100*theta*j)*sin(100*phi*j) + r * sin(theta*j)*sin(phi*j) + offset;

  if(j != 0) {  
    point(x2,y2);  
  }
  }
}

void mouseClicked() {
 background(255, 204, 0);

float theta = mouseX * (PI/180); 
float phi = mouseY * (PI/180);

text(mouseX, 50, 50);
text(mouseY, 50, 70);

 zeichneHauptkurve(theta,phi);
 
 if(keyPressed) {
    if (key == 'b' || key == 'B') {
      zeichneNebenwindung(theta,phi);
    }
 }
 
}



