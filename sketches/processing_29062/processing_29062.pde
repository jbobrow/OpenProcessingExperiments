
int x = 1;
int y = 100;
int z = 140;

// This is a boolean (true or false) that is used to classify
// if the person is going up or down
boolean goingUp = true;

void setup() {
  size(500,500);
  background(200);
  smooth();
  fill(200);
}

void draw() {
    background(200);


    // These are ouor boundary conditions that let us change when the
    // person should switch from going up to going down.
    
        if(goingUp) {
          y-=10;
          z-=10;

        } else {
          y+=10;
          z+=10;

        }
    // This one is for the top
    if(y == 20 && goingUp == true) {
      goingUp = false;

     // This one is for the bottom
    } else if(y == 100 && goingUp == false) {
      goingUp = true;
    }
    

    ellipse(x,y,20,20);
    line(x,y,x,z);
    line(x,y+25,x+20,y+20);
    line(x,y+25,x-20,y+20);
    line(x,z,x+10,z+30);
    line(x,z,x-10,z+30);
    fill(0);

}

void keyPressed(){
  if(key == CODED){
    if(keyCode == RIGHT){
      x+=10;
    }
    else if(keyCode == LEFT){
      x-=10;  
    }
    else if(keyCode == UP){

      // Here is what we do depending on the value of the boolean.
      // You can try playing with the numbers here to see what changes.
    
    }
  }
}
 
                                
