
//Tomas Altermatt
// SECTION 1
 
int counter;
int x = 20;
int y = 20;
 
 
 
 
//SECTION 2
void setup() {  //setup function called initially, only once
  size(600, 600);
  }
 
 
//SECTION 3
void draw() {  //draw function loops 
 
    background(255);    // makes it black
 
    fill(255,0,0);
 
    ellipse(mouseX,mouseY,50,50);
 
    fill(0,255,0);
 
    ellipse(x,y,50,50);
 
 
 
    if (key == 'd'){
        x = x+10;
    }
     if (key== 'a'){
         x = x-10
    }
    
     if(key=='s'){
        y = y+10     
    }
     if(key=='w'){
       y= y-10;
    }
    }
