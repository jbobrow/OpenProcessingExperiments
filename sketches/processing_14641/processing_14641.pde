
void setup() {
  
size(200,200);
background(255);
  noLoop();
}
void draw() {
  translate(100,100); 
  strokeWeight(8);
  for( int x=0; x<10; x=x+1 ) {
    if( x<5 ) {
      ellipse(0,x*4,300-x*30,300-x*30);
    } else {
      ellipse(0,0+(5-x)*5,300-x*30,300-x*30);      
    }
  }
}
                
                // translate를 안해서 계속 쏠렸군요...
