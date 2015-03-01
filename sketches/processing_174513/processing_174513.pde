
int x, y;
int eSize;
   
void setup(){
  size(600, 600);
  background(0);
  smooth();

}
    
void draw() {
}
  
void mouseDragged(){
  stroke(0,random(100),random(100));
  line(300,300,mouseX, mouseY); 
}
 
void keyPressed() {
   
   
  switch(key) {
    case 'd': 
      fill(0,random(100,255),random(100)); 
     ellipse(mouseX,mouseY,random(5),random(40)) ;
      break;
       
    case 'f': 
      fill(0,random(100),random(100,255),80);
      rect(mouseX,mouseY,20,30);
      break;
       
    case 'z': 
      background(0);  
      break;
  }
}


