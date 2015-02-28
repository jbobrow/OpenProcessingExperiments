
Particle[] particle ;
int NUMPARTICLES = 200 ;
Wind wind ;
float fadeColor;
float fadeLevel;
 
void setup() { 
  background( 0 ) ;
  size( 600, 1000 ) ;
  smooth() ;
  frameRate(10);
  noFill();
  particle = new Particle[NUMPARTICLES] ;
  for ( int i = 0 ; i < NUMPARTICLES; i++) {
    particle[i] = new Particle(int(random(0,width)), int(random(0,height)),
                                    new PVector(0.0,0.0), color(random(0,255),
                                    0,min(random(0,500),25)));
                                    stroke(255,20,147,75);}
    wind = new Wind() ;
cursor(CROSS) ;

}

void draw() { 
 draw2(); 
 draw3();
 drawleaf();
drawme(); 
//drawwhite();
 fade( color(0), 20 ) ;
 for ( int i = 0 ; i < NUMPARTICLES ; i++ ) {
    particle[i].render() ;
    particle[i].addToVector(wind.windAtLocation(particle[i].x(),particle[i].y(), frameCount)) ;
    particle[i].updateLocation() ;
    particle[i].steerToTarget(new PVector(mouseX, mouseY)) ;
 }
filter(DILATE) ;
}
void clearImage(){
  fill(0);
  noStroke();
  rect(0,0,width,height);
}
void mousePressed(){
  clearImage();
}

// Fades the screen towards colour fadeColour, with opacity fadeLevel
void fade( color fadeColor , int fadeLevel ) {
  noStroke(); 
  fill(fadeColor, fadeLevel) ;
  rect(0,0, width,height) ;
 }
int radius=90;
int degree=-90;

 void draw2() {
  float angle = radians(degree);
  float x =400 + (cos(angle) * radius);
  float y =400 + (sin(angle) * radius);
  stroke(255,80);
  //line(300,500,250,250);
  //ellipse(x,y,20,20);
  degree++;
  //delay(300);
}
  void draw3(){
 //red circle
  //stroke(55,20,147,5);
     for (int i = 0; i <= 600; i+= 10) {
     ellipse(300,random(100,1000),10,10);
     stroke(155,20,47,75);
    noFill();
    stroke(55,147,87,25);
    ellipse(300,500,200-i,random(600-i));
//     for (int i = 0; i <= 800; i+= 10) {
//    //ellipse(300,random(3,1000),100-i,random(300));
//     
//     ellipse(300,500,40,random(60,200));
//    //ellipse(random(200,400),random(500,700-i),2,2);
//    stroke(20,15);
}
 }
 
 
 void drawleaf(){
  noFill();
  stroke(70,110,47,130);
  strokeWeight(0.05);
 for (int i = 0; i <= 400; i+= 20) {
bezier(width/2,random(50,80),0,500, 0+i,500,width/2,height*4/5);
bezier(width/2,random(50,80),600,500, 600-i,500,width/2,height*4/5);

   }}
   float diam=1000;

void drawme(){

  fill(237,156,183,12);
  for(int j=0;j<height/diam;j++){
    int x=int(diam/4);
    int y=int(diam/2+j*diam);
    
    for(int i=0;i<width/diam;i++){
      float distance=dist(x,y,mouseX+100,mouseY+100);
      stroke(237,156,183,4);
      ellipse(x+50,y-10,distance,distance);
       ellipse(x+50,y-10,10,10);
      x=x+30;
    }
  }
}
class Particle {
 
  int MAXVELOCITY = 5 ;
   
  PVector location ;
  PVector vector ;
  color particleColor ;
   
 // Creates an particle at location (x,y), with vector v and color c
  Particle(int x, int y, PVector v, color c) {
    location = new PVector(x,y) ;
    vector = v ;
    particleColor =  c ;
  }
   
  void addToVector(PVector vectorToAdd) {
    vector.add(vectorToAdd) ;                                                                   //NOTE - PLAYING AROUND WEIRD WAYS WITH SPEED ACCORDING TO COLOUR
    vector.limit(MAXVELOCITY*(1.5+red(particleColor)/255.0-blue(particleColor)/255.0)) ;       //    vector.limit(MAXVELOCITY) ;
  }
   
  void updateLocation() {
    location.add( vector ) ;
    location.x = ( location.x + width ) % width ;
    location.y = ( location.y + height ) % height ;
  }
   
  void steerToTarget(PVector target) {
    vector.limit(PVector.dist(target,location)) ;
     
  }
   
   
   void render() {
    stroke ( 130,120 ) ;
    strokeWeight(0.2) ;
    if(location.x<width/2+10){
     line ( location.x,location.y, location.x+vector.x,location.y+vector.y ) ;
     line( (width-location.x),location.y, (width-(location.x+vector.x)),location.y+vector.y ) ;
    }
  }
   
  int x() {
    return int(location.x) ;
  }
   
  int y() {
    return int(location.y) ;}

}
 
 
class Wind {
  int horizontalSeed ;
  int verticalSeed ;
  float SCALE = 0.002 ;
  PVector directionalWind = new PVector(0,0) ;
 
  Wind() {
    horizontalSeed = int(random(0,10000)) ;
    verticalSeed = int(random(0,10000)) ;
  }
   
  PVector windAtLocation(int x, int y, int time) {
    PVector returnWind ;
    returnWind = new PVector( noise(x*SCALE, y*SCALE, (horizontalSeed + time)*SCALE) - 0.5,
                        noise(x*SCALE, y*SCALE, (verticalSeed + time)*SCALE) - 0.5) ;
    returnWind.add(directionalWind) ;
    return returnWind ;
  }
  
   
}
