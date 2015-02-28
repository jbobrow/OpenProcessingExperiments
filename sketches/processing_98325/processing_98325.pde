


int total = 1000;
ArrayList fs = new ArrayList();

void setup(){
  size(500,500);
  
  for(int i=0;i<total;i++) {
    
    //extraemos el objeto que contiene
    follower b = new follower();
    fs.add(b);
  
  
  }

}

void draw(){
  background(0);
  
  for(int i=0; i<fs.size(); i++){
    follower b = (follower) fs.get(i);
    if (mousePressed) { 
      b.repuls();
    } else {
      b.atrac();

}



}

}
class follower{

  float speed = random(100,120);
  PVector pos = new PVector(mouseX,mouseY);
  int sz = 5;

  follower (){

  }
  
  void atrac(){
    //calculamos la distÃ¡ncia entre el mouse y la bola 
   
    PVector mouseVec = new PVector(random(width),random(700));
    PVector dis = PVector.sub(mouseVec, pos);
    dis.div(speed);
    pos.add(dis);  

   
    float ang = atan2(dis.y,dis.x);

    
    pushMatrix();
    
    translate(pos.x,pos.y);
    
    rotate(ang);
    
    noStroke();
    fill(255);
    ellipse(pos.x/4,pos.y/4,sz,sz);
    
    popMatrix();
  }
  
  void repuls() {
    
    PVector mouseVec = new PVector(random(width),random(700));
    PVector dis = PVector.sub(mouseVec, pos);
    dis.div(speed);
    pos.sub(dis);  

   
    float ang = atan2(dis.y,dis.x);

    
    pushMatrix();
    
    translate(pos.x,pos.y);
    
    rotate(ang);
    noStroke();
    fill(255);
    ellipse(pos.x/4,pos.y/4,sz,sz);
    
    popMatrix();
  
  
  
  }
}


