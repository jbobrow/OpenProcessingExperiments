
Rocket[] rocket= new Rocket[60];


void setup(){
  size(800, 800);
  for(int i=0;i<rocket.length;i++){
   rocket[i]=new Rocket (random(width),600,#1FDED9); 
  }    

}

void draw(){
  background(0);
  for(int i=0;i<rocket.length;i++){
  rocket[i].launch(i); 
  
  }
  saveFrame("anything-######.jpg"); 
}
class Rocket {
  float x;
  float y;
  color c;
  
  Rocket (float rocketx, float rockety, color rocketc) {
    x = rocketx;
    y = rockety;
    c = rocketc;
  }

  void launch(int speed) {
    y = y - speed;
    if(y<-800){
      y=800;
    }
    fill(c);
    rect(x, y, 50, 200);
  }
}


