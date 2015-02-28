

int angle;
int outerRadius,innerRadius;
PImage img;

void setup() {
  angle = 0;
  size( 500, 400 );
  img = new PImage();
  colorMode(RGB,100);
  outerRadius = 130;
  innerRadius = 60;
}

void draw() {
  ellipseMode(CENTER);
  
  if( mousePressed ) {
    fill(20,70,10,50);
  }else{
    fill(60,40,55,90);
  }
  rect(0,0,width,height);
  //image( img , 0, 0 );
  angle++; 
  if (angle > 360) { angle -= 360; }
 // ellipse( noise(0, millis() *pointer) *width , noise( millis() *pointer) *height , 20, 20 );
  //img = get();
  int oX = width/2;
  int oY = height/2;
  int r = mousePressed ? outerRadius : innerRadius;
  for( int i = 0; i < 50; i++ ) {
    stroke( random(100-i), random(i) , random( i/2) , i);
    strokeWeight(2);
    noFill();
    bezier( oX, oY, 
            //100+(random(100)-50), 100+(random(50)-25), 
            oX, oY,
            
           (cos(radians(angle))*(r/4))  +(random(r)-(r/4)) + oX, 
           
           (sin(radians(angle))*(r/4))  +(random(r)-(r/4)) + oY, 
           
            //mouseX+(random(r)-(r/2)), mouseY+(random(r)-(r/2))
            
           (cos(radians(angle))*(r*2))+(random(r)-(r/2)) + oX, 
          
           (sin(radians(angle))*(r*2))+(random(r)-(r/2)) +oX 
           //,
           
           //(r*4) + random(20)-10
            
            );
  }
}
