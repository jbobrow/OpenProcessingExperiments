
int i;                                
float z;
int x = 0;                                        //Defines x variable
int y = 0;                                        //Defines y variable
int value = 0;                                    //Defines value

void setup(){
  size(750, 450);                                 //750 pixels wide and 450 pixels high
  background(0);                                  //Set background color to gray
  frameRate(20);                                  //Change color slowly
  fill(255, 0, 0);                                //Set heart's color ro red
  smooth();                                        
}

void draw(){    
  y = (y+5) % 600;                                //Moves it down           
  background(0);                                  //Set to background color
  hearts(0, y-100);                               //Draws first heart
  hearts(50, y-50);                               //Draws second heart
  hearts(100, y-0);                               //Draws third heart
  hearts(150, y-100);                             //Draws fourth heart
  hearts(200, y-50);                              //Draws fifth heart
  hearts(250, y-0);                               //Draws sixth heart
  hearts(300, y-100);                             //Draws seventh heart
  hearts(350, y-50);                              //Draws eight heart
  hearts(400, y-0);                               //Draws ninth heart
  hearts(450, y-100);                             //Draws tenth heart
  hearts(500, y-50);                              //Draws eleventh heart
  hearts(550, y+0);                               //Draws twelfth heart
  hearts(600, y-100);                             //Draws thirteenth heart
  hearts(650, y-50);                              //Draws fourteenth heart
  hearts(700, y-0);                               //Draws fifteenth heart
  hearts(750, y-100);                             //Draws sixteenth heart
  fill(value);
}

void hearts(int x, int y){
  if (random(0,1) < 0.5){
    stroke(180, 180, 255);
  } else{
    stroke(200, 200, 255);
  }
  for(i=0; i< 10; i++){
    z= random(10, 20);                                   
  noStroke();                                            //Makes line go away
  ellipse(x+10, y+20, 15, 15);                           //First circle
  ellipse(x+25, y+20, 15, 15);                           //Second circle
  triangle(x+3, y+24, x+18, y+39, x+32, y+24);           //Bottom part of heart
  rect(x+12, y+20, 10, 10);                              //Draw rectange in the middle
  }
}

void keyReleased() {
  if (value == 0) {                                      //Click on the image to give it focus,
    value = 255;                                         //and then press any key
  } else {
    value = 0;
  }
}

