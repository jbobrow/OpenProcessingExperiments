
Obj[] obj;
int[] x;
int[] y;

void setup(){



  obj = new Obj[100];
  x= new int[100];
  y= new int[100];
  for (int i=0;i<100;i++){
    obj[i]=new Obj(i*10,x[i],y[i]);

  }




}

void draw(){
  background(255);

  for(int i=0;i<100;i++){
    obj[i].display(i);
    obj[i].move(pmouseX,pmouseY,mouseX,mouseY);
    obj[i].display(i);
  }




}

void mousePressed(){
  for (int i=0;i<100;i++){
    obj[i].reset(i);
  }
}

class Obj{
  int I = 0;
  float x=(I%10)*40;
  float y=(I-(I%10))*4;





  Obj(int I,int X,int Y){    
  }

  void move(int PX,int PY,int X,int Y){    
    x=x + random(-abs(X-PX)/3-1,abs(PX-X)/3+1) + (X-x)/100; 
    y=y+ random(-abs(Y-PY)/3-1,abs(PY-Y)/3+1) + (Y-y)/100;    
  }

  void display(int I){
   stroke(0);
    strokeWeight(10);
    point (x,y); 
   strokeWeight(5);
   stroke(255);
  point(x,y);  
  }

  void reset(int I){
    x=(I%10)*40;
    y=(I-(I%10))*4;
  }

}


