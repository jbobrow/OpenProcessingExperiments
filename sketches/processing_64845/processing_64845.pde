
//MIDTERM v.02

ArrayList circ;
PImage logo; 
 
void setup() {
   
  size(800,300);
  logo=loadImage("ledplux1.png");
  smooth();
   
  circ = new ArrayList();
 
}
 
 
void draw() {
   
  background(0);
  image(logo,width/3,height/3); 

   for ( int i = 0 ; i < circ.size() ; i++ ) {
     circ b = (circ) circ.get(i);
     b.draw();
   }
    //mouse pressed
   if (mousePressed) {
  color c = color(random(323),245,320);
  circ b = new circ(mouseX,mouseY,c);
  circ.add(b);
}
}
 
 
 
void keyPressed() {
   
  if ( circ.size() > 0 ) {
    circ.remove( circ.size()-1 );
     
  }
   
}
 
class circ {
  
 
 float x;
 float y;
 color c;
 
  circ ( float x , float y , color c ) {
    
   this.x = x;
   this.y = y;
   this.c = c;
     
  }
   
   
  void draw() {
     
    x = x + random(-2,2);
    y = y + random(-2,2);
     
    noStroke();
    fill(c);
    rect( x , y , 6 , 6 );
     
  }
   
   
   
}


