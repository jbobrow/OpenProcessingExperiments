
Sperm[] mySperm;
Egg myEgg;
int winnerIndex = -1; // -1 means no winner
float zoomFactor = 1;
void setup() {
  size( 800, 400 );

  // defining the length of the array
  mySperm = new Sperm[15];


  for ( int i=0; i<mySperm.length; i++) {
    // find new x position
    mySperm[i] = new Sperm( width, height/2 );
  }
  
  myEgg = new Egg( 150, height/2 );
  
  //background(0);
}


void draw() {
  //fill(220, 10);
  //smooth();
  //ellipse(width/2, height/2, 200, 200);
  fill(0, 10);
  rect(0, 0, width, height);
  //background(0);
  
  //scale(zoomFactor);
  
  myEgg.update();
  myEgg.display();
  
  if( winnerIndex == -1 ){
    // no winner yet, update all and check for completion
    for ( int i=0; i<mySperm.length; i++) {
      mySperm[i].update();
      mySperm[i].display();
    }
    checkForCompletion();
  } else {
    // winner found!!!
    //mySperm[winnerIndex].update();
    zoomFactor = zoomFactor * 1.01;

    mySperm[winnerIndex].x = myEgg.x;
    mySperm[winnerIndex].y = myEgg.y;
    mySperm[winnerIndex].display();
    //mySperm[winnerIndex].sdfsdfs();

  }
  
}


void checkForCompletion () {
  for ( int i=0; i<mySperm.length; i++) {
    float goalDist = dist(mySperm[i].x,mySperm[i].y,myEgg.x,myEgg.y);
    if( goalDist < 10 ){
      winnerIndex = i;
    }
  }

}
class Egg {
  float x;
  float y;
  
  // constructor 
  Egg( float theX, float theY ){
    x = theX;
    y = theY;
  }
  
  void update(){
    x = x + random(-1,1.1);
    y = y + random(-2,2);
  }
  void display(){
    noStroke();
    fill( #F5EEBC );
    ellipse( x, y, 100*zoomFactor, 100*zoomFactor );
  }  
}

class Sperm {
  float x;
  float y;
  boolean in=false;
  
  // constructor 
  Sperm( float theX, float theY ){
    x = theX;
    y = theY;
  }
  
  void update(){
    x = x + random(-3,1);
    y = y + random(-1,1);
    if(x<250){
       //println(x+":"+y);
       //in = true;
       x=x+random(-1,3);
    }
  }
  
  void display(){
    // tail
    float controlX = x+10*zoomFactor;
    float controlY = y;
    float tailEndX = x+14*zoomFactor;
    float tailEndY = y+4*zoomFactor;
    noFill();
    strokeWeight(1*zoomFactor);
    stroke(#0D3779);
    curve( controlX, controlY , x, y, tailEndX, tailEndY, tailEndX, tailEndY);
    // head
    noStroke();
    fill(#A0AEC4);
    ellipseMode(CENTER);
    ellipse( x, y, 7*zoomFactor, 5*zoomFactor );
   
  }  
}



