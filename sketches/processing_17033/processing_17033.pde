
StretchyLine l;
StretchyLine l2;
StretchyLine[] ls;
float k;

float aimingForX;
float aimingForY;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  k = 0.01;
  
  l = new StretchyLine(width/2,height/2,width/2 + 20, height/2 - 20, 0,0);
  
  
  
  
  
}

void draw() {  //draw function loops 
  background(255);
 // l2 = new StretchyLine(l.xFixedEnd,l.yFixedEnd,
  l.update();
  l.drawLine();
  
  
  
  if( mousePressed ){
     aimingForX = mouseX;
     aimingForY = mouseY;
     
     
     l.xv = 0;
     l.yv = 0;
     l.xFreeEnd = mouseX;
     l.yFreeEnd = mouseY;
  }
  
 
}




class StretchyLine{
   float xFixedEnd;
   float yFixedEnd;
   
   float xFreeEnd;
   float yFreeEnd;
   
   float xv;
   float yv;
   
   public StretchyLine(float xfix, float yfix, float xfree, float yfree, float xv, float yv){
      this.xFixedEnd = xfix;
      this.yFixedEnd = yfix;
      this.xFreeEnd = xfree;
      this.yFreeEnd = yfree;
      this.xv = xv;
      this.yv = yv;
   }
   
   
   public void update(){
      xFreeEnd += xv;
      yFreeEnd += yv;
      
      xv += -k*(xFreeEnd - xFixedEnd);
      yv += -k*( yFreeEnd - yFixedEnd);
   }
      
   
   public void drawLine(){
      
      line(xFixedEnd, yFixedEnd, xFreeEnd, yFreeEnd);
   }
   
}
   
                
                
