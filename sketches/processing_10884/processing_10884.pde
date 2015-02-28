
//first attempt at processing!

boolean rings = false;
void setup(){
  smooth(); //!important
  size(600,600);
  background(255);
}

void draw(){
  if(rings == true){
    PVector pos = new PVector();
    pos.x = mouseX;
    pos.y = mouseY;
   
    fill(200, 50);
    stroke(255, 100, 0); //orange
    ellipse(pos.x, pos.y, 75, 75);
    
  }
   //mouseReleased 
   else{
     PVector pos = new PVector();
     pos.x = mouseX;
     pos.y = mouseY;
   
    fill(150, 50);
    stroke(200, 200, 0); //green
    ellipse(pos.x, pos.y, 100, 100);
   
  }  
   
}

//boolean reference to "rings"
void mousePressed(){
  rings = true;
}
 
void mouseReleased(){
  rings = false;
}

//clears screen with spacebar
void keyPressed(){
  if(key == ' '){
    noStroke();
    fill(255);
    rect(0, 0, width, height);
  }
}

