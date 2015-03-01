
float delta = 15;
float r = 0;
boolean isClicked=false;
int howManySphere = 0;
Sphere[] s = new Sphere[50];
void setup(){

  size(600,600, P3D);
}

void draw(){
  background(0);
  //translate(width/2, height/2, 0);
  translate(mouseX, mouseY, 0);
 
  rotateX(radians(mouseY));
  rotateY(radians(mouseX));
  


  if(mousePressed){
    if(!isClicked){
      isClicked = true;
      s[howManySphere] = new Sphere(r, color(random(0,255),random(0,255),random(0,255)));
    }
    s[howManySphere].make();
    s[howManySphere].inflate(1);
    s[howManySphere].setColor(color(random(0,255),random(0,255),random(0,255)));
  }
  else{
    if(isClicked){
      r=0;
      howManySphere++;
      isClicked = false;
    } 
  }
  for(int i=0; i<howManySphere; i++){
       s[i].make();
  }
}
class Sphere{
  float r, dz;
  color c;
  Sphere(float r, color c){
    setRadius(r);  
    setColor(c);
    dz = 0;
  }
  void setRadius(float r){
    this.r = r; 
  }
  void setColor(color c){
    this.c = c; 
  }
  void inflate(float deltaR){ //deltar
    this.r+=deltaR;
  }
  void move(){
    dz++;
  }
  void make(){
    for(float deg=0; deg<360; deg +=delta){
      float theta = radians(deg);
       
      for(float deg2 = 0; deg2 < 360; deg2 += delta){      
        float phi = radians(deg2);
        float x = r * sin(phi) * cos(theta);
        float y = r * sin(phi) * sin(theta);
        float z = r * cos(phi);
        stroke(c);
        point(x,y,z+dz);
      }
    }

  }
  
}


