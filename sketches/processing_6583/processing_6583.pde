
Panel p;
ArrayList panels = new ArrayList();

void setup(){
  size(250,250);
strokeWeight(3);
}

void draw(){
  background(200);
  
//  sinelineH(20,20,130,20);
  
  Iterator i = panels.iterator();
  while(i.hasNext()){
     Panel pan = (Panel)i.next();
    if(pan != null) pan.draw(); 
  }
  if(p != null) p.draw();    
}

void keyPressed(){
   if(key == ' '){
       panels = new ArrayList();

   } 
}

void mousePressed(){
  if(mouseButton == LEFT) {
    p = new SquarePanel(mouseX, mouseY); 
  } else {
        p = new TriPanel(mouseX, mouseY); 
  }
}
void mouseDragged(){
  if(p != null){
    p.move(mouseX,mouseY);
  } 
}
void mouseReleased(){
   panels.add(p);
  p = null; 
}

abstract class Panel {
    abstract void draw();
    abstract void move(float x, float y);
}

class TriPanel extends Panel{
  float x0,y0,x1,y1;
  float h,a;
  TriPanel(float x, float y){
    x1= x0=x; y1= y0 = y;
  }
  void move(float x, float y){
        h = mag(x-x0,y-y0)*1.25;
      a = atan2(y0-y,x0-x)-PI;
          x1=x; y1 = y;
  }
  void draw(){
    float x2 = x0 + cos(a+PI/2)*h;
    float y2 = y0 + sin(a+PI/2)*h;
    float x3 = x0 + cos(a-PI/2)*h;
    float y3 = y0 + sin(a-PI/2)*h;
    

    stroke(255);
    fill(128,64,0);
    
    triangle(x1,y1,x2,y2,x3,y3);
    
    
    
  }
  
}

class SquarePanel extends Panel{
  float x1,y1,x2,y2; 
  float w,h,a;
    SquarePanel(float x, float y){
    x1 = x;
    y1 = y;
    move(x,y);
  } 
  void move(float x,float y){
    x2 = x; 
    y2 = y; 

  //  h = sqrt( pow(x2-x1,2) + pow(y2-y1,2)   );
    h = mag(x2-x1,y2-y1) * pow(2,.5)/2;
    w = h;
    
    
    a = atan2(y2-y1,x2-x1)-PI/4;
  }


  void draw(){
    
    
    stroke(96,48,0);
    fill(128,64,0);
    pushMatrix();
      translate(x1,y1);
    rotate(a);
   // noStroke();
        rect(0,0,w,h);
    stroke(255);
    if(w >= 4 && h >= 4){
       sinelineH(5,5,w-5,5);
       sinelineH(5,h-5,w-5,h-5);
       sinelineV(5,5,5,h-5);
       sinelineV(w-5,5,w-5,h-5);
    }
    popMatrix();

  }

}

void sinelineH(float x1, float y1,float x2,float y2){
  float lastx = x1; float lasty = y1; 
  for(int i = 0; i < 100; i++){
      float x = lerp(x1,x2,i/100.0);
      float y = lerp(y1,y2,i/100.0);
     y += 5.0*sin(x*3/4);
     line(lastx,lasty,x,y);
     lastx =x ;
     lasty = y;
   }
  
}

void sinelineV(float x1, float y1,float x2,float y2){
  float lastx = x1; float lasty = y1; 
  for(int i = 0; i < 100; i++){
      float x = lerp(x1,x2,i/100.0);
      float y = lerp(y1,y2,i/100.0);
     x += 5.0*sin(y*3/4);
     line(lastx,lasty,x,y);
     lastx =x ;
     lasty = y;
   }
  
}



