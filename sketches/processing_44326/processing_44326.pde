
float x1 = 0;
float y1 = 0;
float x2 = 0;
float y2 = 0;
float xspeed1 = 1.2;
float yspeed1 = 1.5;
float xspeed2 = .9;
float yspeed2 = 1.2;
        
void setup() {
  size (600,600);
  frameRate(30);
}
        
void draw(){
         
  
  x1 = x1 + xspeed1;
  y1 = y1 + yspeed1;
  x2 = x2 + xspeed2;
y2 = y2+ yspeed2;  
  
  
         
  if ((x1 > width) || (x1 < 01 )) {
    xspeed1 = -xspeed1;
  }
       
xspeed1 = xspeed1+.01;

        
  if ((x2 > width) || (x2 < 1 )) {
    xspeed2 = -xspeed2;
  }
       

           
    if (( y1 > height) || (y1 < 1)) {
      yspeed1 = - yspeed1 ;
    }
    
      if (( y2 > height) || (y2 < 1)) {
      yspeed2 = - yspeed2 ;
    }
           
    strokeWeight(5);
    stroke( 170-(y2/8),250-(x2/6+(y1)),200-(y2*4));
noFill();
   // ellipse (x1-(y2/100),y1,100-(x1/5), 50+(y2/30));
stroke(140+(y1/10), 190-(y2/10+(x1/.5*(x2/2))), 100+(y2*4));
ellipse(x1,y2+(x1), 5,500-(x1/10+(y2-y1)))  ;
}
          
          
      
void keyPressed() {
  save("japey.tiff");
}



                
                
