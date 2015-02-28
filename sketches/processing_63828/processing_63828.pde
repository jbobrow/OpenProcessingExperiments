
ArrayList obj;
void setup() {
  size(250, 250);
  background(255);
  colorMode(HSB);
  obj= new ArrayList();
  Particle p = new Particle(40,40);
  obj.add(p);     
}
void mouseClicked(){  
  Particle p = new Particle(mouseX,mouseY);
  obj.add(p);    
}

void draw() {
  for (int i=0;i<=obj.size();i++){
     Particle p=(Particle)obj.get(i);
     p.update();     
     p.draw();       
   }  
}

public class Particle{
int x,y;
Particle(int x,int y){
  this.x=x;
  this.y=y;  
}
public void update(){
  y=y+1;
  x=x+1;  
}
public void draw(){
  ellipse(x,y,20,20);
}
}
