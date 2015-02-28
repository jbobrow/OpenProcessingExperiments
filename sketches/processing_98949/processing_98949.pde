
int total = 1;
ArrayList fs = new ArrayList();

 
void setup(){
  background(255);
  size(800,800);
   
  for(int i=0;i<total;i++) {
     
    //extraemos el objeto que contiene
    follower b = new follower();
    fs.add(b);
     
    

   
   
  }
 
}
 
void draw(){
   
   
  for(int i=0; i<fs.size(); i++){
    follower b = (follower) fs.get(i);
    
  if(mousePressed) {
      b.atrac();
  
  }
}
 
 
 
}



class follower{
 
  float speed = random(100,120);
  PVector pos = new PVector(random(600),random(800));
  int sz = 5;
 
  follower (){
 
  }
   
  void atrac(){
    //calculamos la distÃ¡ncia entre el mouse y la bola
    
    PVector mouseVec = new PVector(mouseX,mouseY);
    PVector dis = PVector.sub(mouseVec, pos);
    dis.div(speed);
    pos.add(dis); 
 
    
    float ang = atan2(dis.y,dis.x);
 
     
    pushMatrix();
     
    translate(pos.x,pos.y);
     
    rotate(ang);
     
    noStroke();
    fill(random(200,255),100,50,random(20,50));
    rect(dis.x*2,dis.y*2,sz*30,sz/3);
     
    popMatrix();
  }
   
  
}



