
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////


// ------------------- //
// |||||||||||||||||| //
// example sketch by  // 
// stephen monslow  //
//||||||||||||||||||||


// number of circles
int num = 50;

// making an array classes
// particle is the new instance name of the class ball
// 
ball[] particle = new ball[num];


void setup(){
  // changing color mode to do a color shifting trick
  colorMode(HSB);
  size(900,300);
  // anti alaising for smoother lines
  smooth();
 // initiate each instance of the array using a for loop
  for ( int i =0; i < num; i++){
    // every different object will have a random origin
    PVector origin = new PVector( random(width), random(height),0);
    // each new object will have a random size and speed
    particle[i] = new ball( origin , random(100),random(-1,1),random(-1,1),random(-1,1));
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
void draw(){
  // 
//  background(0);
  fill(0,20);
  noStroke();
  rect(0,0,width,height);

  // 
  for ( int i =0; i < num; i++){
  particle[i].run();
  }
  
}


class ball{
  
  float b,ex,rad,speed,speed2,speed3,strokeW;
  PVector test = new PVector();
  
  ball(PVector origin, float siz, float _speed, float _speed2, float _speed3){
    test = origin;
    speed = _speed;
    speed2= _speed2;
    speed3= _speed3;
    b = random(255);
    strokeW = random(8);
    rad = siz;
  }
  
  void run(){
    // this creates the color shift
    if(b > 255) b = 0;
    b+=0.2;
    // the individual speeds are added here
    PVector acc = new PVector(speed,speed2,speed3);  
    test.add(acc);
    
    // pacman style 
    if( test.x > width ) test.x =0;
    if( test.y > height ) test.y =0;
    if( test.x < 0 ) test.x =width;
    if( test.y < 0 ) test.y =height;
  // making it look nice
  noFill();
    strokeWeight(strokeW);
//    stroke(b,255,255);
stroke(255);
    ellipse(test.x,test.y,rad+(ex*3),rad+(ex*3));
   // puslations
    ex = sin ( frameCount * PI / (rad*2)  ) * sin( rad ) * rad*2 ;
  }
}


////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
                
                                
