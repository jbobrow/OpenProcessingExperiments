
/////////kind of command////////////

int r,g,b;
int x,y;

/////////basic setting//////////////

void setup(){
  size(600,600);
  background(255);
  noStroke();
  smooth();
  fill(0);
  x = 5;
  y = 5;
}



/////////paint command////////////////

void draw(){
  fill(r,g,b);
}


///////drag for drawing config////////

void mouseDragged() {
  ellipse(mouseX, mouseY, x, y);
}



///////system controll command/////////

void keyPressed(){
  if(key == CODED){
    if(keyCode == CONTROL){       //clear command//
      background(255);
    }
    
    if(keyCode == SHIFT){         //elaser command//
      r = 255;
      g = 255;
      b = 255;
    }
    if(keyCode == UP){            //size change front//
      y += 2;
    }
    else if(keyCode == DOWN){
      y -= 2;
    }
    else if(keyCode == LEFT){     //size change cross//
      x -= 2;
    }
    else if(keyCode == RIGHT){
      x += 2;
    }      
  }



/////////color change command//////////
  
  switch(key) {
   case 'k': //←kore ×[;]  //black//
     r = 0;
     g = 0;
     b = 0;
   break;
   
   case 'b':               //blue//
     r = 0;
     g = 0;
     b = 255;
   break;
   
   case 'r':               //red//
     r = 255;
     g = 0;
     b = 0;
   break;
   
   case 'g':               //green//
     r = 0;
     g = 180;
     b = 0;
   break;
   
   case 'p':               //pink//
     r = 255;
     g = 100;
     b = 100;
   break;
   
   case 'c':               //cian//
     r = 50;
     g = 180;
     b = 255;
   break;
   
   case 'l':               //light green//
     r = 0;
     g = 255;
     b = 0;
   break;
   
   case 'v':               //violet//
     r = 180;
     g = 0;
     b = 180;
   break;
   
   case 't':               //brown//
     r = 130;
     g = 20;
     b = 0;
   break;
   
   case 'y':               //yellow//
     r = 230;
     g = 230;
     b = 150;
   break;
  }
}


