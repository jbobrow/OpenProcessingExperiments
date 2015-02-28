
//The House on the Random Plain.
//Hit any Key to activate a new sequence.

void setup(){
  size(800,800);
  smooth();
  
  
}

void draw(){
  background(0);
fill(200,50,20);

rect(100, 300-100, 100,100);
  noStroke();
  fill(255,50);
 
 for(int i=0; i<250; i++){
 int num=floor(random(0,100));


ellipse(num*8,300,8, 8 ) ;


ellipse(num*8,308+i*4,8, 8 ) ;  
noLoop();
}
}
void keyPressed(){
redraw();
}

