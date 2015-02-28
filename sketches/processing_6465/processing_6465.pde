
PImage tree;

class Firefly {
  
 float xpos, ypos;
 float trans, inc;
 float howBig, howSpread;
 
 Firefly () {
   
   trans = 0;
   inc = random (3,9); 
   xpos = random (0, width);
   ypos = random (0, height);  
   howBig = int (random ( 1, 3 ));
   howSpread = int (random (30, 60));
 }
 
 void display () {
  
   noStroke();
   fill (0, 255, 0, trans);
   rect (xpos, ypos, howBig, howBig);
   trans = trans+inc;
   
   if (trans >= 255){    
    inc *= -1;
  } 
  
    
    if (trans <= 0) {
    inc *= -1;
    xpos = xpos + (mouseX - xpos) / random (3, 7);
    ypos = ypos + (mouseY - ypos) / random (3, 7);
    
    if (xpos <= mouseX + 40 && xpos >= mouseX -40 && ypos <= mouseY + 40 && xpos >= mouseY -40){
    
    xpos = mouseX + random (-howSpread, howSpread);
    ypos = mouseY + random (-howSpread, howSpread);
    
    }
    
  }
   
 }
 
 
}

Firefly[] fireflies; 
 
void setup (){
  
  size (1024, 683);
  
  int howMany = 500;
 
  fireflies = new Firefly [howMany];
  
     for ( int i = 0; i < fireflies.length; i++ )
   {
       fireflies[i] = new Firefly();
   }

  tree = loadImage ("tree.jpg");
}

void draw (){
  
  image (tree, 0, 0);
  
    for ( int i = 0; i < fireflies.length; i++ )
   {
       fireflies[i].display();
   }
  
}


   
 


