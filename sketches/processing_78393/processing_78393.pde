
Circle[] circles;

void setup(){
  size(1000,1000);
  background(1255);
  circles = new Circle[1000];
  for(int i=0; i < circles.length; i++){
      circles[i]= new Circle(random(width),random(height),random(-500,500),random(-500,500));
      
  }
}

void draw(){
  for(int i=0; i <circles.length; i++){
    circles[i].move();
    circles[i].displayC();
    
    
  }
}


class Circle{
   float x,y,offx,offy,speedX,speedY,angle;
Circle(float _x,float _y, float _offx, float _offy){
    
    x=_x;
    y=_y;
    offx= _offx;
    offy= _offy;
    speedX=1;
    speedY=1;
}

  void move(){
      
    for(int i=0; i<100; i++){

       
     
      x=500*cos(radians(angle));
      
        y=300*sin(radians(angle/2));
          
           fill(175,405,77);
            
            rect(x-offx+width/2,y+offy*height/2,100,150);
            
            fill(255,149,18); 
         
          rect(x*offx+width/2,y+offy+height/2,10,10);
          
          fill(255,149,180); 
         
            rect(x+offx+width/4,y+offy*height*2,25,50);
        
         angle+=.5;
      }
  }
  
  void displayC(){
    //ellipse(x,y,5,5);
  }


  }



