

int angle;
int outerRadius,innerRadius;
PImage img;

void setup() {
  angle = 0;
  size( 500, 400 );
  img = new PImage();
  colorMode(RGB,100);
  outerRadius = 120;
  innerRadius = 80;
}

void draw() {
  ellipseMode(CENTER);
  
  if( mousePressed ) {
    fill(20,20,20,50);
  }else{
    fill(90,90,90,90);
  }
  rect(0,0,width,height);
 
  angle++; 
  if (angle > 360) { angle -= 360; }

  int oX = width/2;
  int oY = height/2;
  int r = mousePressed ? outerRadius : innerRadius;
  for( int i = 0; i < 50; i++ ) {
    stroke( random(100-i), random(i) , random( i/2) , i);
    strokeWeight(2);
    noFill();
    bezier( oX, oY, 
         
            oX, oY,
            
           (cos(radians(angle))*(r/4))  +(random(r)-(r/4)) + oX, 
           
           (sin(radians(angle))*(r/4))  +(random(r)-(r/4)) + oY, 
           

          
           (sin(radians(angle))*(r*2))+(random(r)-(r/2)) +oX ,
           
           (r*4) + random(20)-10
            
            );
  }
}
