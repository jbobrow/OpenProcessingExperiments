
void setup()
{size(800,400); 
background(255); 
stroke(0); 
} 

  void draw(){ 
  background(255);
 rect(50,50,700,300);  
 ellipseMode(CENTER);
 ellipse(170,195,100,100);// soldaki yuvarlak
 line (180,145,50,100); // soldaki ilk çizgi
 line (50,280,185,242); // soldaki alt çizgi
 ellipse(400,195,100,100); // ortadaki yuvarlak
 ellipse(605,195,100,100); // sağdaki yuvarlak
 line (750,270,580,240); // sağdaki aşşağıdaki çizgi
 line (580,150,750,100); // sağdaki yukarıdaki çizgi
 line (400,50,400,350);
  }
 


