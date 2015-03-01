

boolean rectOver = false;

color baseColor;

void setup() {
  size(200, 200);
  baseColor = color(102);
  
}



void draw() {
   update(mouseX, mouseY);
   fill(0,255,0);
  if(rectOver){
   fill(0); 
  }else{
    fill(255);
    
  }
  rect(0, 0, 200, 200);
  
  
  
// if (mousePressed) { //cambiar condicion. 
//   fill(0);
 // } else {
 //   fill(0,0,255);
//  }
 // rect(0, 0, 200, 200);
  
  
  
  
}


void update(int x, int y) {
  
if ( overRect(5, 5, 190, 190) ) {
    rectOver = true;
    
  } else {
     rectOver = false;
  }
  
}

boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

