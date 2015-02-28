
Updown updown1;
Updown2 updown2;

void setup(){
  size(800,600); 
  updown1 = new Updown(200,200,230,170,260,200);
  updown2 = new Updown2(200,250,230,280,260,250);
 

}

void draw(){ 
  background(255);
  updown1.update(mouseX,mouseY);
  updown1.display();
  updown2.update(mouseX,mouseY);
  updown2.display();

}

class Updown{
  float x1,y1, x2, y2, x3, y3;
  boolean over;
  Updown(float _x1,float _y1,float _x2,float _y2,float _x3,float _y3){
    x1 = _x1;
    y1 = _y1;
    x2 = _x2;
    y2 = _y2;
    x3 = _x3;
    y3 = _y3;
  
    over = false;
    
  } 
  void update(int mx, int my){
    if(dist(mx,my,x2,y2)  < 40) {
      over = true;
    } else {
      over = false;
    }
 
  }

 
 void display(){
   if(over){
     fill(255,0,0);
   }else {
     fill(0,0,255); 
   }
   triangle(x1,y1,x2, y2,x3,y3);
  
 }
 
 void press(){
    if ((over) && mousePressed){ 
      y1 -= 10;
      y2 -= 10;
      y3 -= 10;
      
    }
    }
    
 }
 
 class Updown2{
  float x4,y4, x5, y5, x6, y6;
  boolean over;
  Updown2(float _x4,float _y4,float _x5,float _y5,float _x6,float _y6){
    x4 = _x4;
    y4 = _y4;
    x5 = _x5;
    y5 = _y5;
    x6 = _x6;
    y6 = _y6;
  
    over = false;
    
  } 
  void update(int mx, int my){
    if(dist(mx,my,x5,y5)  < 40) {
      over = true;
    } else {
      over = false;
    }
 
  }

 
 void display(){
   if(over){
     fill(255,0,0);
   }else {
     fill(0,0,255); 
   }
  
   triangle(x4, y4, x5, y5, x6, y6);
 }
 
 void press(){
    if ((over) && mousePressed){ 
      y4 += 10;
      y5 += 10;
      y6 += 10;
      
    }
    }
    
 }
 
 
 
 void mousePressed(){
   updown1.press(); 
   updown2.press();
 }











  
  

