
.5;
        
void setup() {
  size (900,500);
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
stroke(140+(y1/10), 190-(y2/10+(x1/.5*(x2/HALF_PI))), 100+(y2*PI));
ellipse(x1,y2+(x1), 200,500-(x1/100+(y2-(y1+.1*x1))))  ;
}
          
          
      
void keyPressed() {
  save("japey.tiff");
}

                
                
