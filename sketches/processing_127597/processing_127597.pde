
//Camila Diaz    
//1/9/14    
//Moving balls (KeyPress)

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
 
 
 
    if (key == 'd'){    //move right
        x = x+1;
    }
     if (key == 's'){    //move down
        y = y+1;
 }
     if (key == 'w'){    //move up
     y = y-1;
        }
     if (key == 'a'){    //move left
     x = x-1;
        }
 
}
