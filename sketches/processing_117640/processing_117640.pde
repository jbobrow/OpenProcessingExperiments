
int myState;
PImage up; 
PImage down;
PImage right; 
PImage left; 
PImage googley;

void setup() {
  size (700,250);
  up = loadImage("up.jpg");
  down = loadImage("down.jpg");
  right = loadImage("right.jpg");
  left = loadImage("left.jpg");
  googley = loadImage("googley.jpg");
}

void draw() {
 image (up, 0, 0, 700, 250);
 image (down, 0, 0, 700, 250);
 image (right, 0, 0, 700, 250);
 image (left, 0, 0, 700, 250);
 image (googley, 0, 0, 700, 250);
  
  switch(myState) {
    
    case 0:
    image (up, 0, 0, 700, 250);
    break;
    
    case 1:
    image (down, 0, 0, 700, 250);
    break ;
    
    case 2:
    image (right, 0, 0, 700, 250);
    break;
    
    case 3:
    image (left, 0, 0, 700, 250);
  break ;
  
   case 4:
    image (googley, 0, 0, 700, 250);
  break ;
    
  }
}
  

void mousePressed(){}

void keyPressed(){
     switch(keyCode) {
     
    case 38:
    myState=0;//up
    break;
     
    case 39:
    myState=2;//right
    break;
     
    case 40:
    myState=1;//down
    break;
     
    case 37:
    myState=3;//left
    break;
    
  }
}




