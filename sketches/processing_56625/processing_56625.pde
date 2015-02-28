
Star [] Stars;
float G=40;
float Scale = 1;
float MaxInitSpeed = 0.5;
int InitState = 200;
boolean Collider=false;
int InitStar=1;
boolean Play=true;
PVector Rectangle1 = new PVector (10,10);
PVector Rectangle2 = new PVector (15,15);
PVector Rectangle3 = new PVector (10,30);
PVector Rectangle4 = new PVector (15,15);
 
void setup(){
  size (800,450);
  Stars = new Star[50];
   
  for (int i=0; i<InitStar; i++){
    Stars[i] = new Star(i, new PVector(0,0), new PVector(0,0), 5000, 10, 255, 200,200);
  }
  for (int i=InitStar; i<Stars.length; i++) {
    Stars[i] = new Star(i, new PVector(0,0), new PVector(random(-MaxInitSpeed, MaxInitSpeed), random(-MaxInitSpeed, MaxInitSpeed)), random(5,50), 0.15, 255, 200,200);
  }
}
 
void draw () {
  background (0);
  if (Play) {
    if (!(InitState>0)) {
      if (Collider == true) {
        for (int i=InitStar; i<Stars.length; i++) {
          if (Stars[i].Active == true) Stars[i].CheckForCollisions();
        }
      }
      for (int i=InitStar; i<Stars.length; i++) {
        if (Stars[i].Active == true) Stars[i].UpdateAcceleration();
      }
    }
    InitState --;
     
  }
  for (int i=0; i<Stars.length; i++) {
    if (Stars[i].Active == true) Stars[i].Update(Play);
  }
  
  
  //buttons
  if (Play) {
    fill (200,0,0);
    stroke (50,0,0);
    rect (Rectangle1.x, Rectangle1.y, Rectangle2.x/3, Rectangle2.y);
    rect (Rectangle1.x + 2*Rectangle2.x/3, Rectangle1.y, Rectangle2.x/3, Rectangle2.y);
  }
  else {
    fill (0,200,0);
    stroke (0,50,0);
    triangle (Rectangle1.x, Rectangle1.y, Rectangle1.x, Rectangle1.y+Rectangle2.y, Rectangle1.x+Rectangle2.x, Rectangle1.y+Rectangle2.y/2);
  }
  //instruccions
  text("Mouse click moves a star to your mouse position", Rectangle1.x + Rectangle2.x + 5, Rectangle1.y + Rectangle2.y); 
  //Checkbox
  if (Collider){
    fill (200,200,200, 100);
    stroke (50,0,0);
    rect (Rectangle3.x, Rectangle3.y, Rectangle4.x, Rectangle4.y);
    stroke (255,255,255,255);
    line (Rectangle3.x, Rectangle3.y, Rectangle3.x+Rectangle4.x, Rectangle3.y+Rectangle4.y);
    line (Rectangle3.x+Rectangle4.x, Rectangle3.y, Rectangle3.x, Rectangle3.y+Rectangle4.y);
  }
  else
  {
    fill (200,200,200,100);
    stroke (50,0,0);
    rect (Rectangle3.x, Rectangle3.y, Rectangle4.x, Rectangle4.y);
  }
  text("Stars do collide", Rectangle3.x + Rectangle4.x + 5, Rectangle3.y + Rectangle4.y); 
  
  //println (Stars[0].Position.x + " " + Stars[0].Position.y + " " + Stars[0].Acceleration.x + " " + Stars[0].Acceleration.y + " " + Stars[0].Speed.x + " " + Stars[0].Speed.y);
}

int lastMoved = 0;
void mousePressed() {
  //el botó?
  if (mouseX>Rectangle1.x && mouseX<Rectangle1.x+Rectangle2.x && mouseY>Rectangle1.y && mouseY<Rectangle1.y+Rectangle2.y){
    Play = !Play;
  }
  else if (mouseX>Rectangle3.x && mouseX<Rectangle3.x+Rectangle4.x && mouseY>Rectangle3.y && mouseY<Rectangle3.y+Rectangle4.y){
    Collider = !Collider;
  }
  else{
    Stars[lastMoved].Position.x = mouseX-width/2;
    Stars[lastMoved].Position.y = mouseY-height/2;
    Stars[lastMoved].Speed.x = 0;
    Stars[lastMoved].Speed.y = 0;
    Stars[lastMoved].Active = true;
    lastMoved = (lastMoved+1) % Stars.length;
  }
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
  int R, G, B;
   
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
    this.R = 255;
    this.G = 255;
    this.B = 255;
  }
  
    
  Star (int iIndex, PVector iPosition, PVector iSpeed, float iMass, float iDensity, int iR, int iG, int iB) {
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
    this.R = iR;
    this.G = iG;
    this.B = iB;
  }
   
  void Update(boolean biMove){
    if (this.Active == true){
      if (biMove) {
        //Recompute speed
        this.Speed.x = this.Speed.x + this.Acceleration.x;
        this.Speed.y = this.Speed.y + this.Acceleration.y;
        //Recompute position
        this.Position.x = this.Position.x + this.Speed.x;
        this.Position.y = this.Position.y + this.Speed.y;
      }
      //Draw the star
       
      for (int i=1; i<=this.Steps; i++) {
        fill (R,G,B,i*this.FillStep);
        stroke (R,G,B,i*this.StrokeStep);
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
    PVector Dn, Dt, mT, v1, v2, vln, vlt;
    float delta, m1, m2, M;
    for (int i = this.Index+1; i<Stars.length; i++) {
      if (Stars[i].Active == true) {
        if (this.Index != Stars[i].Index) {
          r = dist (this.Position.x, this.Position.y, Stars[i].Position.x, Stars[i].Position.y);
          if (r == this.Radio + Stars[i].Radio) {
            //They did collide already?
          }
          else {
            if (3*r < this.Radio + Stars[i].Radio) {
              //Collision!

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
