

public class Element{
  float mass;
  float speedX;
  float speedY;
  float acceleration;
  float angle;
  float x;
  float y;
  String name;
  int code;
  
  float r;
  float g;
  float b;
  
  boolean active=true;
  
  float strength=1;
  
  public Element(){
  }
  
  public Element( float m, float sX, float sY, float x, float y, String n){
    mass=m;
    speedX=sX;
    speedY=sY;
    this.x=x;
    this.y=y;
    name=n;
    code=(int)random(100000);
    
    r=random(20)+100;
    g=random(20)+100;
    b=random(20)+100;
  
  
  }
  
  public void render(){
    if(active){
      fill(255*abs(speedX),255*abs(speedY),b,200);
    }
    else fill(255,255,255,255);
    ellipse(x,y,mass,mass);
  
  
  }
  
  
  
  public boolean isEqualTo(Element e){
    return(this.mass==e.mass&&this.name.equals(e.name)&&this.code==e.code);
  }
  
  public boolean hittingSomething(ArrayList elements){
    for(int i=0;i<elements.size();i++){
      if(!isEqualTo((Element)elements.get(i))&&sqrt(squareDistance((Element)elements.get(i)))<=1.05*(((Element)elements.get(i)).mass/2+this.mass/2)) return true;
    }
    return false;
  }
  
  public float squareDistance(Element e){
   return  ((this.x-e.x)*(this.x-e.x)+(this.y-e.y)*(this.y-e.y));
  }
  
  
  public void update(ArrayList elements, boolean b,boolean c,float factor){
    
     if(active){
        for(int i=0;i<elements.size();i++){
          if(b){
            Element e=(Element)elements.get(i);
            if(!isEqualTo(e)){
              speedX+=factor*strength*(e.x-this.x)*e.mass/squareDistance(e);
              speedY+=factor*strength*(e.y-this.y)*e.mass/squareDistance(e); 
            }
          }
        }
        
        if(c){
          if(!hittingSomething(elements)){
            x+=speedX;
            y+=speedY;
          }
          else{
           active=false;
           speedX=0;
           speedY=0;
          }
        }
        else{
           x+=speedX;
           y+=speedY;
        }
      
        
       
        
      
    }




  }
  
  
  
  
}

