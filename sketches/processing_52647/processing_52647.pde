
int numLoops;


void setup(){
  size(800,600);
  noFill();
  strokeWeight(.1);
  

}


void draw(){
  background(255);
  translate(width/2,height/2);  
  for(int i = 0; i < numLoops; i++){
   rotate(radians(1));
   line(0,0,200,200);
  }
}

void keyPressed(){
  if(key == 'a'){
   numLoops++;    
  } else if(key =='s'){
    numLoops--;
  }
 
}

void mouseReleased(){
  numLoops += 10;
}

