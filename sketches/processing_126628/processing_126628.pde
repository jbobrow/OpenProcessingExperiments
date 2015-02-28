
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/2357*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

color c = color(255);
particule[] Z = new particule[1000];

float colour = (0);
long time = 1;

Continent amerique;
Continent europe;
Continent afrique;
Continent asie;
Continent oceanie;


void setup(){
 size(1000, 600); 
 background(255);
 smooth();
 noStroke();
 //Création des continents
 amerique = new Continent(200, 320, 48, c);
 europe = new Continent(450, 200, 34, c);
 afrique = new Continent(450, 400, 54, c);
 asie = new Continent(700, 200, 172, c);
 oceanie = new Continent(780, 480, 10, c);
 
  float r, phi, x, y, xx, yy;
  
  for(int i = 0; i < Z.length; i++) {
    r = random(8)+7;
    phi = random(TWO_PI);
    x = width/2+r*cos(phi);
    y = height/2+r*sin(phi);
    xx = width/2+r*cos(phi+0.1);
    yy = height/2+r*sin(phi+0.1);
    Z[i] = new particule( (width/2), (height/2), 5, findAngle(x-xx,y-yy), 0.5 );

  }
}

void draw(){

background(200);
 float r;

  colorMode(HSB,1);
  for(int i = 0; i < Z.length; i++) {
    Z[i].gravitate( new particule( 200,320, 0, 0, 380 ) );
    Z[i].gravitate( new particule( 450,200, 0, 0, 240) );
    Z[i].gravitate( new particule( 450,400, 0, 0, 440 ) );
    Z[i].gravitate( new particule( 700,200, 0, 0, 1170 ));
    Z[i].gravitate( new particule( 780,480, 0, 0, 14 ) );
    Z[i].update();
    r = float(i)/Z.length;
    stroke( colour, pow(r,0.1), 1-r, 0.15 );
    Z[i].display();
  }
      
  colorMode(RGB,255);
  
  time++;


   //Amérique
   amerique.dessiner();
   //Europe
   europe.dessiner();
   //Afrique
   afrique.dessiner();
   //Asie
   asie.dessiner();
   //Océanie
   oceanie.dessiner();
   
   if (amerique.infected){
     amerique.decroitre();
   }
   else {
     amerique.croitre();
   }
   
   if (europe.infected){
     europe.decroitre();
   }
   else {
     europe.croitre();
   }
   if (afrique.infected){
     afrique.decroitre();
   }
   else {
     afrique.croitre();
   }
    if (asie.infected){
     asie.decroitre();
   }
   else {
     asie.croitre();
   }
   if (oceanie.infected){
     oceanie.decroitre();
   }
   else {
     oceanie.croitre();
   }

}


void mousePressed() {
  
  if (dist(amerique.x,amerique.y, mouseX, mouseY) < amerique.diametre/2) {
    amerique.infecter();
  }
  else if (dist(europe.x, europe.y, mouseX, mouseY) < europe.diametre/2) {
    europe.infecter();
  }
  else if (dist(afrique.x, afrique.y, mouseX, mouseY) < afrique.diametre/2) {
    afrique.infecter();
  }
  else if (dist(asie.x, asie.y, mouseX, mouseY) < asie.diametre/2) {
    asie.infecter();
  }
  else if (dist(oceanie.x, oceanie.y, mouseX, mouseY) < oceanie.diametre/2) {
    oceanie.infecter();
  }
}
class Continent {

  float x, y;
  float diametre;
  boolean infected;
  color c;

  Continent(float _x, float _y, float _diametre, color _c) {
   x = _x;
   y = _y;
   diametre = _diametre;
   infected = false;
   c = _c;
  }

  void dessiner() {
    fill(c);
    ellipse(x, y, diametre, diametre);
    noStroke();
  }

  void croitre() {
    diametre = diametre + 0.2;
  }

  void decroitre() {    
    if (diametre < 1){  diametre = 0; }
    diametre = diametre - 0.4;
  }

  void infecter() {
    c = color(255, 0, 0);
    infected = true;
  }

}
class particule {
  
  float x;
  float y;
  float px;
  float py;
  float magnitude;
  float angle;
  float mass;
  
  particule( float dx, float dy, float V, float A, float M ) {
    x = dx;
    y = dy;
    px = dx;
    py = dy;
    magnitude = V;
    angle = A;
    mass = M;
  }
  
  void reset( float dx, float dy, float V, float A, float M ) {
    x = dx;
    y = dy;
    px = dx;
    py = dy;
    magnitude = V;
    angle = A;
    mass = M;
  }
  
  void gravitate( particule Z ) {
    float F, mX, mY, A;
    if( sq( x - Z.x ) + sq( y - Z.y ) != 0 ) {
      F = mass * Z.mass;
      //if( sq( x - Z.x ) + sq( y - Z.y ) > 1 ) {
        F /= sq( x - Z.x ) + sq( y - Z.y );
      //}
      mX = ( mass * x + Z.mass * Z.x ) / ( mass + Z.mass );
      mY = ( mass * y + Z.mass * Z.y ) / ( mass + Z.mass );
      A = findAngle( mX - x, mY - y );
      
      mX = F * cos(A);
      mY = F * sin(A);
      
      mX += magnitude * cos(angle);
      mY += magnitude * sin(angle);
      
      magnitude = sqrt( sq(mX) + sq(mY) );
      angle = findAngle( mX, mY );
    }
  }
    void display() {
    line(px,py,x,y);
    px = x;
    py = y;
  }
  
  void update() {
    
    x += magnitude * cos(angle);
    y += magnitude * sin(angle);
    if(x<0||x>width){
      //
    magnitude *= -1;
  }
    if(y<0||y>height){
    magnitude *= -1;
  }
  }
  

  
  
}

float findAngle( float x, float y ) {
  float theta;
  if(x == 0) {
    if(y > 0) {
      theta = HALF_PI;
    }
    else if(y < 0) {
      theta = 3*HALF_PI;
    }
    else {
      theta = 0;
    }
  }
  else {
    theta = atan( y / x );
    if(( x < 0 ) && ( y >= 0 )) { theta += PI; }
    if(( x < 0 ) && ( y < 0 )) { theta -= PI; }
  }
  return theta;
}
 


