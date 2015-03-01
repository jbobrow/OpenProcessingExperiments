
int x,y;

void setup(){
  size(500,500);
  background(0);
  smooth();
  noStroke();
}

void draw(){
  
}

void mouseDragged(){
  
  rect(mouseX,mouseY,10,10);
  
}

void keyPressed(){
  switch(key){
    case 'd':
    background(0); 
    break;
    
    case 'r':
    stroke(#e22b30); 
    break;
    
    case 'b':
    stroke(#2743d2); 
    break;
    
    case 'w':
    stroke(#d3dde9); 
    break;
    
    case 'o':
    stroke(#f39939); 
    break;
    
    case 'g':
    stroke(#01a860); 
    break;
    
    case 'p':
    stroke(#9238be);
    break;
    
    case 'P':
    stroke(#fd99e1);
    break;

    case 'B':
    stroke(#515558);
    break;
    
    case 'y':
    stroke(#ffe43f); 
    break;
    
    case 'f':
    stroke(#b4e04b); 
    break;
    
    case 'l':
    stroke(#01adb9); 
    break;
    
    case 'c':
    stroke(#a6126a); 
    break;
 
 
 
  }
}




