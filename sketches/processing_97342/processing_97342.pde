
Particle[] particle ;
int NUMPARTICLES = 500 ;
Wind wind ;
float fadeColor;
float fadeLevel;
 
void setup() { 
  background( 0 ) ;
  size( 600, 1000 ) ;
  smooth() ;
  frameRate(60);
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
 fade( color(0), 20 ) ;
 for ( int i = 0 ; i < NUMPARTICLES ; i++ ) {
    particle[i].render() ;
    particle[i].addToVector(wind.windAtLocation(particle[i].x(),particle[i].y(), frameCount)) ;
    particle[i].updateLocation() ;
    particle[i].steerToTarget(new PVector(mouseX, mouseY)) ;
 }
filter(DILATE) ;
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
  //line(x,y,250,250);
  //ellipse(x,y,20,20);
  degree++;
  //delay(300);
}
  
void draw3(){
 //red circle
    noFill();
     stroke(55,20,147,175);
     for (int i = 0; i <= 600; i+= 10) {
     ellipse(300,random(3,1000),100-i,random(300));
     stroke(115,20,47,75);
    //ellipse(300,500,200-i,random(600-i));
     //stroke(255,32);
//ellipse(random(200,400),random(500,700-i),2,2);
}
 }
 
 
 void drawleaf(){
   noFill();
  stroke(70,150,47,130);
  strokeWeight(0.2);
 for (int i = 0; i <= 400; i+= 20) {
bezier(width/2,0,0,500, 0+i,500,width/2,height*3/4);
bezier(width/2,0,600,500, 600-i,500,width/2,height*3/4);
//stroke(70,130,47,22);
bezier(width/2,5,0,500, 0+i,500,width/2,height*3/4);
bezier(width/2,5,600,500, 600-i,500,width/2,height*3/4);  
//stroke(70,110,47,22);
bezier(width/2,15,0,500, 0+i,500,width/2,height*3/4);
bezier(width/2,15,600,500, 600-i,500,width/2,height*3/4);  
//stroke(70,190,47,122);
bezier(width/2,25,0,500, 0+i,500,width/2,height*3/4);
bezier(width/2,25,600,500, 600-i,500,width/2,height*3/4);  
//noLoop();
//noStroke();
bezier(width/2,25,0,500, 0+i,500,width/2,height*3/5);
bezier(width/2,25,600,500, 600-i,500,width/2,height*3/5);


   }}
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
    stroke ( 130,90 ) ;
    strokeWeight(0.2) ;
    if(location.x<width/2+10){
     line ( location.x,location.y, location.x+vector.x,location.y+vector.y ) ;
     line( (width-location.x),location.y, (width-(location.x+vector.x)),location.y+vector.y ) ;
    }
  }
   
  int x() {
    return int(location.x) ;}
   
  int y() {
    return int(location.y) ;}

}
 class Wind {
  int horizontalSeed ;
  int verticalSeed ;
  float SCALE = 0.02 ;
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
