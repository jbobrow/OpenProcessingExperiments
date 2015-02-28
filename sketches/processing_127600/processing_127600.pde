
// Name:
// Date
// Keypress project

// SECTION 1
 
int x = 20;
int y = 20;
 
 
 
 
//SECTION 2
void setup() {  //setup function called initially, only once
  size(500, 400);
  }
 
 
//SECTION 3
void draw() {  //draw function loops 
 
    background(255);    // makes it black
 
    fill(255,0,0);
 
    ellipse(mouseX,mouseY,20,20);
 
    fill(0,255,0);
 
    ellipse(x,y,20,20);
 
 
 
    if (key == 'd'){
        x = x+1;
    }
  if (key == 's'){
        y = y+1;
    }
    
     if (key == 'w'){
        y = y-1;
    }
    
     if (key == 'a'){
        x = x-1;
    }
        
     if (key == 'c'){
        x = x+7;
    }
}
