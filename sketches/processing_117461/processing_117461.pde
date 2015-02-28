
int myState = 12;
PImage guy;
PImage guy2;

void setup() { 
  size(500,480);
  smooth() ;
  guy = loadImage("ladder.png");
  guy2 = loadImage("ladder2.png");
}


void keyPressed() {
  
  switch(keyCode) {

  case 38:
    //up
    
  myState = myState - 1;
  
  if (myState < 0)
  {myState = 22;}
  
 break;
 
   case 40:
    //down
    
  myState = myState + 1;
  
  if (myState > 22)
  {myState = 0;}
 
}
}
void draw() {
  background(#59D7F5);
    fill(0);
    rect(200,0,5,480);
    rect(250,0,5,480);
    rect(200,465,50,5);
    rect(200,435,50,5);
    rect(200,405,50,5);
    rect(200,375,50,5);
    rect(200,345,50,5);
    rect(200,315,50,5);
    rect(200,285,50,5);
    rect(200,255,50,5);
    rect(200,225,50,5);
    rect(200,195,50,5);
    rect(200,165,50,5);
    rect(200,135,50,5);
    rect(200,105,50,5);
    rect(200,75,50,5);
    rect(200,45,50,5);
    rect(200,15,50,5);
  
  
  switch(myState) {
    
    case 0:
    image(guy2, 190, -180);
    break;
    
    case 1:
    image(guy, 190, -150);
    break;
    
    case 2:
    image(guy2, 190, -120);
    break;
    
    case 3: 
    image(guy, 190, -90);
    break;
    
    case 4:
    image(guy2, 190, -60);
    break;
    
    case 5:
    image(guy, 190, -30);
    break;
 
    case 6:
    image(guy2, 190, 0);
    break;
    
    case 7:
    image(guy, 190, 30);
    break;
    
    case 8:
    image(guy2, 190, 60);
    break;
    
    case 9: 
    image(guy, 190, 90);
    break;
    
    case 10:
    image(guy2, 190, 120);
    break;
    
    case 11:
    image(guy, 190, 150);
    break;
    
    case 12:
    image(guy2, 190, 180);
    break;
    
    case 13:
    image(guy, 190, 210);
    break;
    
    case 14: 
    image(guy2, 190, 240);
    break;
    
    case 15:
    image(guy, 190, 270);
    break;
    
    case 16:
    image(guy2, 190, 300);
    break;
    
    case 17:
    image(guy, 190, 330);
    break;
    
    case 18:
    image(guy2, 190, 360);
    break;
    
    case 19: 
    image(guy, 190, 390);
    break;
    
    case 20:
    image(guy2, 190, 420);
    break;
    
    case 21:
    image(guy, 190, 450);
    break;
    
    case 22:
    image(guy2, 190, 480);
    break;
    

  }
}







