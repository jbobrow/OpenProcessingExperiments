
class FallingBall {
  float X, Y, dY, R;
  float maxR;
  color C;
  boolean removeMe;
  FallingBall(float _X, float _Y, float _dY, float _R){
    X=_X;
    Y=_Y;
    dY=_dY;
    maxR=_R;
    R = 0;
    C = color(random(128,255),random(128,255),random(128,255));
    removeMe = false;
  } 
  void simulate(int myID){
    if( R < maxR && !shrink ){
      boolean oktogrow  = true;
      for( int i=fallers.size()-1;i>=0;i--){
        FallingBall temp = (FallingBall) fallers.get(i);
        if( i != myID && !temp.removeMe ){
          if( dist( temp.X, temp.Y, X+1, Y+1) < temp.R + R ){
            oktogrow = false;
            maxR = R;
          }  
        }
      }
      if( oktogrow ){
        R++;
      }
      return;
    }
    if( R < MIN_VISABLE_RADIUS ){
      removeMe = true;
      return;
    }
    Y+=dY;
    if( Y > height + 30 ){
      Y = -30;
      shrink = true;
      mouseC = C;
    }
    if( !removeMe && (2*dist(mouseX, mouseY, X, Y) < R + mouseR )){
      removeMe = true;
      if( fallers.size() < MAX_FALLERS ){
        float R1 = random(30,50);
        float R2 = random(30,50);
        fallers.add( new FallingBall( random(0+R1,width-R1), random(0+R1,height-R1), 1, R1) );
        fallers.add( new FallingBall( random(0+R2,width-R2), random(0+R2,height-R2), 1, R2) );
      }
    }
    if( shrink ){
      R--; 
    }
    if( R <= 0 ){
      removeMe = true;
    }
  }
  void render(){
    fill(mousePressed?color(random(255),random(255),random(255)):C);
    if( R < MIN_VISABLE_RADIUS ){ fill(0,0,0,0); }
    ellipse(X,Y,R,R);
  }
  boolean alive(){
    return !removeMe;
  }
}

int MAX_FALLERS = 100;
int MIN_VISABLE_RADIUS = 10;
boolean shrink = false;
ArrayList fallers;
float mouseR = 25;
color mouseC = color(random(128,255),random(128,255),random(128,255));

void setup(){
  size(400,400);
  ellipseMode(CENTER);
  noStroke();
  fallers = new ArrayList();
  fallers.add( new FallingBall( random((width/2.0)-100)+50, random((width/2.0)-100)+50, 1, 50) );
}
void draw(){
  simulate();
  render();
}
void simulate(){
  for( int i=fallers.size()-1;i>=0;i--){
    ((FallingBall) fallers.get(i)).simulate(i);
  }
  if( shrink && fallers.size() == 0 ){
    shrink = false;
    fallers.add( new FallingBall( random((width/2.0)-100)+50, random((width/2.0)-100)+50, 1, 50) );
  }
}
void render(){
  background(mousePressed?color(random(255),random(255),random(255)):0);
  for( int i=fallers.size()-1;i>=0;i--){
    FallingBall temp = (FallingBall) fallers.get(i);
    if( temp.alive() ){
      temp.render();
    } 
    else {
      fallers.remove(i);
    }
  }
  fill(mousePressed?color(random(255),random(255),random(255)):mouseC);
  ellipse(mouseX, mouseY, mouseR, mouseR);
}

