
class Particle
{
  PVector pos;
  PVector speed;
  int     diameter;  
  boolean[] links;
  int     id;
  int nbParticles;
  
  
  Particle(float x, float y, float initSpeed, int particles ){
    pos = new PVector(x, y);
    speed = new PVector(random(-initSpeed, initSpeed), random(-initSpeed,initSpeed));
    nbParticles = particles;
    
    links = new boolean[nbParticles];
  }
  
  void move(){
    if (pos.x - diameter/2 <= 0 || pos.x+diameter/2>=width)
      speed.x = -speed.x;
    if (pos.y - diameter/2 <= 0 || pos.y+diameter/2>=height)
      speed.y = -speed.y;
      
    pos.add(speed);
  }
  
  void draw(){
    diameter = 10 + getNbLinks()*5;  
    
    float  ratio = (float(getNbLinks())/float(nbParticles))*10000;
   // println(ratio);  
    fill(ratio, 50+ratio, 0,20+ratio);
    stroke(ratio, 0, 0,0);
    
    ellipse(pos.x, pos.y, diameter, diameter);
  }
  
  void linkTo(int i){
    links[i] = true;
    
    if(id == 0) println(id+" is now linked to "+i+" ("+getNbLinks()+" links)");
  }
  
  void unlinkTo(int i){
    links[i] = false;    
    if(id == 0) println(id+" is no longer linked to "+i+" ("+getNbLinks()+" links)");
  }
  
  int getNbLinks(){
    int nb = 0;
    for(int i=0; i<links.length; i++){
      if(links[i]) nb++;
    }
    return nb;
  }
}

