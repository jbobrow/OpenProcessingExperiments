
float x,y;
float a=0;

//................
void setup(){
  size(600,500);
  background(0);
  
  x=width/12;
  y=height/12;
  
}

//................

void draw(){
  
  background(0);
  
  for(int i = 0; i < 31; i++){
    for(int j = 0; j < 31; j++){
    
    float lx = i*20;
    float ly = j*20;
    
  float dx = mouseX - lx; // cateto adyacente
  float dy = mouseY - ly; // cateto opuesto
  
  a = atan2(dy,dx);
  
  puntas(lx,ly,a);
  
   }
  
  }
  
}

//.................
void puntas(float x, float y, float ang){
  
  pushMatrix();
  translate(x,y);
  rotate(ang);
  noStroke();
  fill(x,y,x-y);
  triangle(0,-5,0,5,15,0);
 popMatrix();
  
  
}

