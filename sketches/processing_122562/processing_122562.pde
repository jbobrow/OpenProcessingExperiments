
int x, y,c; 
 
  
void setup() {
  size(600, 600);
  background(200);
  noStroke();
  smooth();
  c=0;
  
}
  
  
void draw() {
  fill(c);
//   fill(255);
// ellipse(mouseX, mouseY, 20, 20);
}
void mouseMoved(){ 
  if(key=='1'){c += 1;
  if(c > 200) { 
    c = 200;
  }
  }
  if(key=='2'){c -= 1;
  if(c < 0) { 
    c = 0;
  }
  }
}
 

void mouseDragged(){
   
  if(key == 'a'){
    fill(200);
  }else if( key == 's'){
    fill(0);
  }
else if( key == 'd'){
    fill(255);
  }


 ellipse(mouseX, mouseY, 20, 20);
  
}
 



