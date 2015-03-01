
Somecircle c= new Somecircle(20,5);

void setup(){
  size(600,600);
}

void draw(){
    background(#A09999);
    c.display();
}

//void mouseClicked(){
//  c.display();
//}

class Somecircle{
  float diam,speed;
  Somecircle(float r,float s){
    diam=r;
    speed=s;
  }
  
  void display(){
    diam+=speed;
    if(diam>width){
      diam=20;
    }
    fill(#A09999);
    ellipse(width/2,height/2,diam,diam);  
  }


}


