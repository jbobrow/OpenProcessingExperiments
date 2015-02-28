


int total = 100;
ArrayList fs = new ArrayList();
ArrayList crc = new ArrayList();

void setup(){
  background(255);
  size(800,800);
  
  for(int i=0;i<total;i++) {
    
    //extraemos el objeto que contiene
    follower b = new follower();
    fs.add(b);
    
    circulo c = new circulo();
    crc.add(c);
  
  
  }

}

void draw(){
  
  
  for(int i=0; i<fs.size(); i++){
    follower b = (follower) fs.get(i);
    circulo c = (circulo) crc.get(i);
 
      b.atrac();
      c.generate();

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
   
    PVector mouseVec = new PVector(random(width),random(height));
    PVector dis = PVector.sub(mouseVec, pos);
    dis.div(speed);
    pos.add(dis);  

   
    float ang = atan2(dis.y,dis.x);

    
    pushMatrix();
    
    translate(pos.x,pos.y);
    
    rotate(ang);
    
    noStroke();
    fill(0,30);
    rect(dis.x*2,dis.y*2,sz*6,sz/3);
    
    popMatrix();
  }
  
 
}
class circulo{

  float speed = random(100,120);
  PVector pos = new PVector(random(100,800),random(100,800));
  int sz = 5;

  circulo (){

  }
  
  void generate(){
    //calculamos la distÃ¡ncia entre el mouse y la bola 
   
    PVector mouseVec = new PVector(random(200,800),random(100,800));
    PVector dis = PVector.sub(mouseVec, pos);
    dis.div(speed);
    pos.add(dis);  

   
    float ang = atan2(dis.y,dis.x);

    
    pushMatrix();
    
    translate(pos.x,pos.y);
    
    rotate(ang);
    
    noStroke();
    fill(0,30);
    ellipse(dis.x,pos.y,sz/3,sz*4);
    
    popMatrix();
  }
}


