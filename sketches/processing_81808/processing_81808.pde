
tadpole[] p=new tadpole[30];
PImage backdrop;
float time,lastTime;

void setup(){
  size(800,800);
  background(255);
  strokeWeight(5);
  backdrop=loadImage("pondBackground.png");
  
  for(int i=0;i<p.length;i++)
  p[i]=new tadpole();
}

void draw(){

time=millis()-lastTime;
lastTime=millis();
 background(0);
  image(backdrop,0,0);
  
    //stroke(255,255);
  //ellipse(mouseX,mouseY,p[0].radius,p[0].radius);
  
  for(int i=0;i<p.length;i++){
      p[i].update();
      p[i].display();
  }
  
  
}

     void mousePressed(){
      
       for(int i=0;i<p.length;i++)
       p[i].clickTimer=0;

       
     }
class ripple{

int[] radii;
color c;
PVector pos;
  
}

class tadpole{
  PVector position,velocity,acceleration,dacceleration,mouse;
  PVector[]trail;
  color c;
  int radius=80;
  int clickTimer,siz;
  boolean clicked;
  PImage tadImg;
  
  tadpole(){
    position=new PVector(random(800),random(800));
    velocity=new PVector(random(0,0),random(0,0));
    acceleration=new PVector(random(-1,1),random(-1,1));
    dacceleration=new PVector(random(-1,1),random(-1,1));
    trail=new PVector[floor(random(20,30))];
    c=color(50,floor(random(50,125)),floor(random(125)));
    for(int i=0;i<trail.length;i++)trail[i]=new PVector(position.x,position.y);
    clickTimer=100;
    siz=50;
    tadImg=loadImage("tadHead.png");
  }
  
  void display(){
    strokeWeight(siz);
    
    stroke(c);
    makeTrail();
   pushMatrix();translate(position.x,position.y);rotate(velocity.heading2D());
       point(0,0); 
       image(tadImg,-siz/2,-siz/2,siz,siz);
      popMatrix();
   
  }
  
  void update(){
    dacceleration=new PVector(random(-4,4),random(-4,4));
    acceleration.add(dacceleration);
    if(clickTimer>100)
      {
        acceleration.add(toMouse());
        acceleration.limit(2);
        velocity.add(acceleration);
        velocity.limit(6); 
      }
    else {
      acceleration.add(awayMouse());
      acceleration.limit(6);
      velocity.add(acceleration); 
      velocity.limit(6); 
    }
    
    PVector temp=new PVector(velocity.x,velocity.y);
    temp.mult(time*0.03);
    position.add(temp);
    clickTimer++;
    bounce();
  }
  
  void bounce(){
    
     if(position.y>800 && velocity.y>0){
       velocity=new PVector(velocity.x,-velocity.y);
        acceleration=new PVector(acceleration.x,-acceleration.y);
     }
        
   if(position.y<0 && velocity.y<0){
     velocity=new PVector(velocity.x,-velocity.y);
   acceleration=new PVector(acceleration.x,-acceleration.y);
   }
  
   if(position.x>800 && velocity.x>0){
     velocity=new PVector(-velocity.x,velocity.y);
    acceleration=new PVector(-acceleration.x,acceleration.y);
   }
    
     if(position.x<0 && velocity.x<0){
       velocity=new PVector(-velocity.x,velocity.y);
       acceleration=new PVector(-acceleration.x,acceleration.y);
     }
  }
  
       void makeTrail(){
       for(int i=0;i<trail.length-1;i++){
           trail[i]=new PVector(trail[i+1].x,trail[i+1].y);
       }
       trail[trail.length-1]=new PVector(position.x,position.y);
       
       for(int i=0;i<trail.length-1;i+=2){
         stroke(c,i*255/trail.length);
         strokeWeight(i*siz/trail.length);
         line(trail[i].x,trail[i].y,trail[i+1].x,trail[i+1].y);
       }
     }
     
     PVector toMouse(){
       PVector m=new PVector(mouseX-position.x,mouseY-position.y);
       PVector n=new PVector(mouseX-position.x,mouseY-position.y);
       n.normalize();
       if(m.mag()>radius)
         n.mult(10000);
       else
         n.mult(40);
       n.div(m.mag()*m.mag());
       
      return n;
     }
     
     PVector awayMouse(){
       PVector n=new PVector(mouseX-position.x,mouseY-position.y);
       PVector m=toMouse();
       m=new PVector(-m.x,-m.y);
       m.mult(10000/((n.mag()*n.mag())+1)*(100/(clickTimer+1)));
      return m;
     }
     

  

}

