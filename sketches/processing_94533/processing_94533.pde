
final int WIDTH = 640;
final int HEIGHT  = 480;
final int PARTICLE_NUM = 128;


ArrayList particles = new ArrayList();

void setup(){

    size(640,480);
    frameRate(60);
    
    for( int i = 0 ;  i < PARTICLE_NUM ; i++){
     
       particles.add(new Particle(i * WIDTH/PARTICLE_NUM,HEIGHT/2)); 
    }
    
};

void draw(){
  
    background(51);
    
    for( int i = 0 ;  i < PARTICLE_NUM ; i++){
     
      Particle particle = (Particle)particles.get(i);
      
      if(random(1000) <= 1 ){
        
          particle.noteOn(int(random(128)));

      }
      
      particle.update();
      particle.draw();
      
    }

};


class Particle{

  final int DEFAULT_SIZE = 1;
  float size = DEFAULT_SIZE;
  
  color col;
  
  PVector initPos = new PVector(0,0);
  PVector pos = new PVector(random(WIDTH),random(HEIGHT));
  PVector vel = new PVector(random(10),random(10));
  PVector acc = new PVector(random(10),random(10));
   
   Particle(float x,float y){
            
     pos.x = x;
     pos.y = y;
     
     initPos.x = pos.x;
     initPos.y = pos.y;
   };
   
   void update(){
     
         //戻る
          pos.x += (initPos.x - pos.x)/8.;
          pos.y += (initPos.y - pos.y)/8.;
       
     
   };
   
   void noteOn(int velocity){
    
    //println("noteOn"); 
    size = velocity * 5 * random(2); 
    
    col = color(int(random(255)),int(random(255)),255);
   }
   
   void draw(){
     
     size += (DEFAULT_SIZE - size)/10.;
     
     noStroke();
     
     colorMode(HSB);
     fill(col);
     
     ellipse(pos.x,pos.y,size,size);
   };

}
