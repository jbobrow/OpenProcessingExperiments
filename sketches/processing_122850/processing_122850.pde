
box[] group = new box[20];
 
void setup(){
  size(500,500,P3D);
  for(int i = 0; i<group.length; i++){
  float h = random(30,40);
  float s = random(30,40);
  group[i] = new box(h,s);
}
}
 
 
void draw(){
background(200);
for(int i = 0; i<group.length; i++){
  group[i].move();
  group[i].display();
}
}
 
 
//they appear at different times: DONE
//a random number of pojectiles fall:
 
 
class box {
  float xp;
  float yp;
  float he;
  float si;
  float y;
  //colors
  float a = random(0,255);;
  float b = random(0,120);
  float c = random(0,255);
   
  box(float h, float s){
  yp = y;
  he = h;
  si = s;
  }
   
  void move(){
  if (yp >= 500){
    
    xp = random(5,60);
   float randomnumberup = random(-500,0);
    yp = randomnumberup;
   }
  else{
    yp += 2;
   }
  }
   
  void display(){
    noStroke();
    fill(a,b,c);
    translate(xp,yp);
    box(he);
   // sphere(si);
    
  }
   
 
}

