
class Ellipse {
  
   PVector pos;
   PVector raio;
   
   Ellipse(float x, float y, float raioX, float raioY) {
     pos  = new PVector(x,y);
     raio = new PVector(raioX,raioY);
   }
  
   void run() {
     render();
     //update();
   }
   
   void update(int x, int y){
     raio.x+=x;
     raio.y+=y; 
   }
   
   
   void render(){
     ellipse(pos.x,pos.y,raio.x,raio.y); 
   }
  
}

