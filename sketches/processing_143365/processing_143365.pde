
Obstr obstr;
Drop[] drops;
int dropCount;
float spaceing;

void setup(){
  size(500,300);
  background(255);
  //frameRate(4);
  
  dropCount = 50;
  spaceing = width/(dropCount-1);
  obstr = new Obstr();
  drops = new Drop[dropCount];
  
  for(int i = 0; i < dropCount; i++){
    drops[i] = new Drop(obstr, spaceing*i, 0);    
  }

}

void draw(){
  background(255);

  for(int i = 0; i < dropCount; i++){
    
    drops[i].update();
    drops[i].display();
    obstr.display();
  }
}

//create drops and mak them move
class Drop{
  Obstr ob;
  //float x;
  //float y;
  PVector location;
  float speed = 5;
  PVector speedV = new PVector(0,speed);
  //PVector accel;
  
  Drop(Obstr _ob, float x, float y){
  ob = _ob;
  location = new PVector(x,y);
  
  }  
//move drops downdwords and along the obstruction
  void update (){
  float ob_y = ob.Fx(location.x);
    if (location.y < ob_y){
      location.add(speedV);

    }
    //check if circles colide with obstructions
    else {
      //make circles direction change based on geometry of obstructions
      PVector new_tan = ob.downSlope(location.x);
      new_tan.mult(speed);
      location.add(new_tan);
    }
    location.y = Math.min(location.y,ob_y);
    
  }
  
  void display(){
    noStroke();
    fill(0,100,255,40);
    ellipse(location.x,location.y,10,10);
    
  }
    
}

//create a curve to act as an obstruction
class Obstr{
  float freq = 2*PI*3/width; 
  float amp = 50;  // amplitude
  float pos = 2*height/3; // position along the y axis
  float eps = 0.1;  
  
  float Fx(float x){
    float y = pos+sin(x*freq)*amp;
    return y;
  }
  
  //find tangent vectors
  PVector downSlope(float x){
    PVector tanV = new PVector(1,cos(x*freq)*freq*amp);
    tanV.normalize();
    if (tanV.y < 0)
      tanV.mult(-1);
    if (tanV.y < eps)
      tanV.x = tanV.y = 0.0;
    return tanV;
  }


  void display(){
    stroke (160);
    strokeWeight (.5);
    noFill();
    beginShape();
      for (int i = 0; i <= width; i += 1) {
        vertex(i,pos+sin(i*freq)*amp);
      }
    endShape();
  }
}

