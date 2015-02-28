
public class Sommet{

  int x;
  int y;
  int iterX;
  int iterY;
  
  public Sommet(int _x,int _y){
    x = _x;
    y = _y;
    iterX = (int)random(-5,5);
    iterY = (int)random(-5,5);
  }
  
  public void update(){
    x+=iterX; 
    if(x>800) {x=0;}
    if(x<0)   {x=600;}        
    
    y+=iterY; 
    if(y>600) {y=0;}    
    if(y<0)   {y=600;}          
}
  
  public void draw(){
    fill(210, 230, 250);
    stroke(100,150,250);
    ellipse(x,y,15,15);
  }
  
  public boolean closeEnough(Sommet s){
    PVector v1 = new PVector(this.x, this.y);
    PVector v2 = new PVector(s.x, s.y);
    if(v1.dist(v2) < 100){
      return true;
    }
    else{
      return false;
    }  
}
}

List list = new ArrayList();

void setup() {  //setup function called initially, only once
  size(800, 600);
  frameRate(30);
  smooth();
 
  background(255);  //set background white
  
  for(int i=0; i<50; i++){
    list.add(new Sommet((int)random(0,800), (int)random(0,600)));
  }
}

void draw() {  //draw function loops 
 
    background(255);
    for(int i=0; i<50; i++){
      Sommet s1 = (Sommet)list.get(i);
      s1.draw();
      s1.update();

      for(int j=0; j<50; j++){
        if(i!=j){
          Sommet s2 = (Sommet)list.get(j);
          if( s1.closeEnough(s2)){
            
            line(s1.x,s1.y,s2.x, s2.y);
          }
        }
      }      
    }

}

