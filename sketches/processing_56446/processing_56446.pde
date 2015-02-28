
Star [] Stars;
float G=40;
float Scale = 1;
float MaxInitSpeed = 0.5;
int InitState = 200;
boolean Collider=false;
int InitStar=1;

void setup(){
  size (400,225);
  Stars = new Star[50];
  
  
  for (int i=InitStar; i<Stars.length; i++) {
    Stars[i] = new Star(i, new PVector(0,0), new PVector(random(-MaxInitSpeed, MaxInitSpeed), random(-MaxInitSpeed, MaxInitSpeed)), random(5,20), 0.15);
  }
  //The center of the universe, to keep stars close to 0,0
  Stars[0] = new Star(0, new PVector(0,0), new PVector(0,0), 5000000000,1000000);
}

void draw () {
  background (0);
  
  if (!(InitState>0)) {
    if (Collider == true) {
      for (int i=0; i<Stars.length; i++) { 
        if (Stars[i].Active == true) Stars[i].CheckForCollisions();
      }
    }
    for (int i=InitStar; i<Stars.length; i++) { 
      if (Stars[i].Active == true) Stars[i].UpdateAcceleration();
    }
  }
  
  for (int i=0; i<Stars.length; i++) {
    if (Stars[i].Active == true) Stars[i].Update();
  }
  InitState --;
  //println (Stars[0].Position.x + " " + Stars[0].Position.y + " " + Stars[0].Acceleration.x + " " + Stars[0].Acceleration.y + " " + Stars[0].Speed.x + " " + Stars[0].Speed.y);
}

class Star {
  float Mass=1;
  float Density=1;
  float Radio;
  PVector Position;
  PVector Speed;
  PVector Acceleration;
  int Index;
  boolean Active;

  //painting variables
  float FillStep = 20;
  float StrokeStep = 15;
  int Steps = 5;
  
  Star (int iIndex, PVector iPosition, PVector iSpeed, float iMass, float iDensity) {
    this.Index = iIndex;
    this.Mass = iMass;
    this.Density = iDensity;
    this.Radio = pow(iMass/iDensity,0.5);
    this.Position = iPosition;
    this.Speed = iSpeed;
    this.Acceleration = new PVector(0,0);
    this.Active = true;
    if (this.Index == 0) {
      this.FillStep = 1;
      this.StrokeStep = 2;
    }
    
  }
  
  void Update(){
    if (this.Active == true){
      //Recompute speed
      this.Speed.x = this.Speed.x + this.Acceleration.x;
      this.Speed.y = this.Speed.y + this.Acceleration.y;
      //Recompute position
      this.Position.x = this.Position.x + this.Speed.x;
      this.Position.y = this.Position.y + this.Speed.y;
      //Draw the star
      
      for (int i=1; i<=this.Steps; i++) {
        fill (255,i*this.FillStep);
        stroke (255,i*this.StrokeStep);
        ellipse (width/2 + this.Position.x/Scale, height/2 + this.Position.y/Scale, 4*this.Radio/(i*Scale), 4*this.Radio/(i*Scale));
      }
    }
  }
  
  void UpdateAcceleration(){
    float r;
    float f;
    PVector v = new PVector(0,0);
    this.Acceleration.x = 0;
    this.Acceleration.y = 0;
    for (int i = 0; i<Stars.length; i++) {
      if (Stars[i].Active == true) {
        if (this.Index != Stars[i].Index) {
          r = dist (this.Position.x, this.Position.y, Stars[i].Position.x, Stars[i].Position.y);
          if (abs (1-r /(this.Radio + Stars[i].Radio))<0.2) {
            //They did collide already?
          }
          else {
            if (r < (this.Radio + Stars[i].Radio)) {
              //Are they colliding?
            }
            else {
              if (r > 1.1*(this.Radio + Stars[i].Radio)){
                v.x = (Stars[i].Position.x - this.Position.x)/r;
                v.y = (Stars[i].Position.y - this.Position.y)/r;
                f = G*Stars[i].Mass/(r*r*(Stars[i].Mass + this.Mass));
               // f = G*Stars[i].Mass/(r*(Stars[i].Mass + this.Mass));
                this.Acceleration.x = this.Acceleration.x + v.x*f/this.Mass;
                this.Acceleration.y = this.Acceleration.y + v.y*f/this.Mass;
              }
            }
          }
        }
      }
    }
  }
  
  
  void CheckForCollisions(){
    float r;
    float f;
    PVector v = new PVector(0,0);
    this.Acceleration.x = 0;
    this.Acceleration.y = 0;
    for (int i = this.Index+1; i<Stars.length; i++) {
      if (Stars[i].Active == true) {
        if (this.Index != Stars[i].Index) {
          r = dist (this.Position.x, this.Position.y, Stars[i].Position.x, Stars[i].Position.y);
          if (r == this.Radio + Stars[i].Radio) {
            //They did collide already?
          }
          else {
            if (r < this.Radio + Stars[i].Radio) {
              //Collision! for simplicity, inellastic
              
              println ("Collision! init state");
              println (r);
              
              println (this.Position.x + " " + this.Position.y + " " + this.Acceleration.x + " " + this.Acceleration.y + " " + this.Speed.x + " " + this.Speed.y);
              println (Stars[i].Position.x + " " + Stars[i].Position.y + " " + Stars[i].Acceleration.x + " " + Stars[i].Acceleration.y + " " + Stars[i].Speed.x + " " + Stars[i].Speed.y);
               
              this.Speed.x =( this.Mass*this.Speed.x + Stars[i].Mass*Stars[i].Speed.x)/(this.Mass + Stars[i].Mass);
              this.Speed.y =( this.Mass*this.Speed.y + Stars[i].Mass*Stars[i].Speed.y)/(this.Mass + Stars[i].Mass);
              Stars[i].Speed.x = this.Speed.x;
              Stars[i].Speed.y = this.Speed.y;
              
              v.x = (Stars[i].Position.x - this.Position.x)/r;
              v.y = (Stars[i].Position.y - this.Position.y)/r;
              
              this.Position.x = this.Position.x + v.x*(Stars[i].Mass/(Stars[i].Mass+this.Mass));
              this.Position.y = this.Position.y + v.y*(Stars[i].Mass/(Stars[i].Mass+this.Mass));
              
              Stars[i].Position.x =this.Position.x + v.x*(this.Radio+Stars[i].Radio);
              Stars[i].Position.y = v.y*(this.Radio+Stars[i].Radio);
              Stars[i].Active = false;
              this.Mass = this.Mass + Stars[i].Mass;
              
              this.Radio = pow(this.Mass/this.Density,0.5);  
            }
          }
        }
      }
    }
  }
}
