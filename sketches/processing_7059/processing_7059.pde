
/*
**  
** Spring 2D Class bais was taken from Chain simulate example in Processing
** This example runs better with OPENGL
**
**    (c) Xavier Bastida 2010 (for tha image DOFI5.jpg)
**
**    You can use the code under GPL license
**
*/

float gravity = 2; float mass = 1; 
float ampleBanner=320, llargBanner=240;       // Compte en conservar la proporció 4:3 o la que pertoqui
int numFils=(int) ampleBanner/10+1, llargCadena=(int) llargBanner/10+1;  
float distFils, alsadaElement;
float coefX, coefY;
float rotx=0, roty=0;
PImage img;
Spring2D [ ][ ] s=new Spring2D [numFils][llargCadena];

void setup(){
  size(640, 480,P2D);  

  noSmooth();
  img = loadImage("DOFI5.jpg");                            // Foto
  img.loadPixels();                                                     // img.pixels[y*img.width+x]  
  distFils=ampleBanner/numFils;                          // Amplada del fil donada la imatge
  alsadaElement= llargBanner/(llargCadena-1)-0.02;       // Alçada de l'element del fil donada la imatge  el 0.02 corregeix l'alçada del element donada l'elasticitat
  coefX=ampleBanner/img.width;  coefY=llargBanner/(img.height);   // Factors de reducció per adaptar la trama al tamany del banner
                                                                       // inicialitza la matriu de la bandera
  for(int j=0;j<numFils;j++) for(int i=0;i<llargCadena;i++) { s[j][i]=new Spring2D(j*distFils, i*alsadaElement, mass, gravity);}    // Inputs: x, y, mass, gravity
}

void draw(){
  float newX, newY;
  background(255); colorMode(RGB); noCursor();
 
  translate(0, 0);
  for(int j=0;j<numFils;j++){
    noStroke(); textureMode(IMAGE); beginShape(QUAD_STRIP); texture(img);      // Definició dels punts del fil (veta)
    newX=mouseX+distFils*j; 
    newY=mouseY-alsadaElement;
    s[j][0].update(newX, newY);
    s[j][0].puntsFil(0, j, distFils, alsadaElement, coefX, coefY);
    for(int i=1;i<llargCadena;i++) {
      s[j][i].update(s[j][i-1].x, s[j][i-1].y);
      s[j][i].puntsFil(i, j, distFils, alsadaElement, coefX, coefY);
    }
    endShape(CLOSE);
  }
}


class Spring2D {
  float vx=0, vy=0;   // The x- and y-axis velocities
  float x, y;         // The x- and y-coordinates
  float gravity;
  float mass;
  float radius = 1;
  float stiffness = 0.2;
  float damping = 0.6;
  color scolor=0xff0000ff;
  
  Spring2D(float xpos, float ypos, float m, float g) {
    x = xpos;
    y = ypos;
    mass = m;
    gravity = g;
  }
  
  void update(float targetX, float targetY) {
    float forceX = (targetX - x) * stiffness;          // Rigidesa
    float ax = forceX / mass;                          // F = m· a
    vx = damping * (vx + ax);                          // Esmorteiment
    x += vx;
    float forceY = (targetY - y) * stiffness;
    forceY += gravity;
    float ay = forceY / mass;
    vy = damping * (vy + ay);
    y += vy;
  }
  
  void puntsFil(float vPos, float hPos, float ample, float alt, float cX, float cY) {    
             // vPos, index vertical de l'element              // hPos, Index Horitzontal del fil
             // ample, Ample Fil                               // alt, Alçada de cada element del fil
             // cX coeficient de reducció ample trama          // cY coeficient de reducció llarg trama
      vertex(x,       y, hPos*ample/cX,     vPos*alt/cY); 
      vertex(x+ample, y, (hPos+1)*ample/cX, vPos*alt/cY);     
  }
}




