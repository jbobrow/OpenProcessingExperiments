
//draw background
//boolean to test if left or right arrow key is pressed and move ship

//draw ship

int shipX = 256; 
int shipY = 256;

void setup() {
  size ( 512,512 );
}

void draw() {
  background(0);
  smooth();
  display();


}

void keyPressed() {
  if (key == CODED){
  }else if (keyCode == 'B') {
      stroke(255);
      rect (shipX+10, shipY-40, 5, 5);
  }
      if (keyCode == LEFT) {
    shipX = shipX-5;
  }else if (keyCode == RIGHT) {
    shipX = shipX+5;
  }else if (keyCode == DOWN) {
    shipY = shipY+5;
  }else if (keyCode == UP) {
    shipY = shipY-5;
    
  }
}
    

void display() {
  
  ellipseMode (CENTER);
  rectMode (CENTER);
  frameRate (30);
  
  //ship's color is white
  stroke(255);
  
  //draw base
  rect ( shipX+10, shipY+10, 15, 60 );
  
   //draw fuselage
  fill( 10, 30, 210, 100 );
  rect (shipX+10, shipY+5, 15, 15);
  
  //draw wings
  fill (255);
  rect ( shipX+10, shipY+20, 80, 10 );
  
 //draw left turrets
  line ( shipX-25, shipY, shipX-25, shipY+15 );
  line ( shipX-10, shipY, shipX-10, shipY+15 );

//draw right turrets 
  line ( shipX+30, shipY, shipX+30, shipY+15 );
  line ( shipX+45, shipY, shipX+45, shipY+15 );
}


