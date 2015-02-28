
int eSize;
int x, y;

void setup() {
  size(600, 600);
  noStroke();
  background(255);
  fill(0);
}

void draw() {
  }

void mouseDragged(){
   ellipse(mouseX, mouseY, 15, 15);
}


void keyPressed(){
  switch(key) {
  
    
  case 'w':  //w=White aut 
  background(255);       
  break;  //masshiro

    
    
  case 'q':
  fill(255);
  println("q");
  break;//nakasiro
 
 case '1':   
  stroke(255,0,0); 
      break;//1=Red   
      
    
    
 case '2':
 stroke(0,0,255); 
 break; //2=Blue    
  
 
 case '3':   
 stroke(0,255,0); 
 break;  //3=Green 
 
    
  }
}


