
float x1 = 0;
float y1 = 0;
float x2 = 0;
float y2 = 0;
float xspeed1 = 1;
float yspeed1 = 1;
float xspeed2 = 1.3;
float yspeed2 = 1;
        
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
           
    strokeWeight(25);
    stroke((y1/5)-x1,(150-x1-y2)+(y1*.9)/5,60+(.5*y1)/x1);
noFill();
    ellipse (x1,y1,50, 1+(x2/3));
stroke(y1, x1, x2);
ellipse(x2,y2, 300, 25+(y1*.1));
stroke(y1-y2,x1-x2, y1/10);           
           
}
          
          
      
void keyPressed() {
  save("japey.tiff");
}


                
                
