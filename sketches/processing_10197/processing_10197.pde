
ArrayList as;
B b;
void setup(){
  smooth();
  size(400,400);
  noStroke();
  as=new ArrayList();
  b=new B();
  fill(255);
}
  
void draw(){
    background(33);
    for(int i=as.size()-1;i>=0;i--){
      A a=(A)as.get(i); 
      a.display();
      if(a.finished()){as.remove(i);}
    }
    b.display();
}

class A {
  float x1,x2,y1,y2,a;
  A(){x1=b.x1;y1=b.y1;x2=b.x2;y2=b.y2;a=0.5;b.x2=b.y2=0;}
  boolean finished(){
    y1+=a;a=a*1.03; if(y1>height+abs(y2)){return true;} else {return false;}
  }
  void display(){rect(x1, y1, x2, y2);}
}

class B {
  int x1,x2,y1,y2;
  B(){x1=mouseX;y1=mouseY;x2=0;y2=0;}
  void display(){rect(x1, y1, x2, y2);}
  void dragg(){ x2=mouseX-x1;y2=mouseY-y1; }
}
  
void mousePressed(){ b=new B(); b.display(); }
void mouseDragged(){ b.dragg();}
void mouseReleased(){as.add(new A());}


