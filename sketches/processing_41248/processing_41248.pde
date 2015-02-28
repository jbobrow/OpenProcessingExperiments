
int x = 0;
int c= 0;

void setup(){
  size(381,381);
  smooth();
}
  void draw(){   
    
    println(mouseX);
    fill(225,400,400);
    rect(0,0,400,400);

    
    
    for (int y =0; y<width; y++) {
    for (int i =0; i<width; i++) {
    stroke(225,i,i);
    point(i-60, y);
   }
   }
    
    
    strokeWeight(1);

    
    for(int x =0; x<= width; x = x+6)  {
    for(int y =0; y<= width; y = y+6)  {
    point(x,y);
   }
    
    
    }
    
    for(int x =-3; x<= width; x = x+6)  {
    for(int y =-3; y<= width; y = y+6)  {
    point(x,y);
   }
   }
    
   
   
    
    for(int x=0; x<= width; x = x+80)   {
    for(int y =0; y<= height; y = y+80) {
      
    strokeWeight(1);
    line(x,y,x+20,y-20);
    line(x+20,y,x,y-20);
    
    strokeWeight(3);
    line(x+10,y+5,x+10,y-25);
    line(x-5,y-10,x+25,y-10);
    
    if(x>=180){
     c=255;
    stroke(0,c,c);
    }else if (x<180){
    stroke(c,c,0);
    }
    
  }
  }

    
    
    
    for(int x =40; x<= width; x = x+80)  {
    for(int y =40; y<= height; y = y+80) {
      
    strokeWeight(1);
    line(x,y,x+20,y-20);
    line(x+20,y,x,y-20);
    
    strokeWeight(3);
    line(x+10,y+5,x+10,y-25);
    line(x-5,y-10,x+25,y-10);
    
    if(x>=180){
    c=255;
    stroke(0,0,c);
    }else if (x<180){
    stroke(c,0,0);}
   
   }
   }
    
   
    }
    
  
    
  
   
    
    

  

