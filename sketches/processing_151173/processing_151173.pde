
/* letra "v" cambia de color
    letra "r" limpia la pantalla"*/

// variables to store the delay and target counts
int delayCount;
int targetCount;
color rojo =#ff3333;
color verde=#00d5ac;
color gris=#333333;

// setup function
void setup() {
  size(1000, 500);
  background(gris);
smooth();
  delayCount = 0;
  targetCount = int(random(1,3)); // set target count to a random integer between 10 and 50
}

// draw function
void draw() {

  /* draw a rectangle on your mouse point while you pressing 
   the left mouse button*/

  int style; 

  delayCount++; // increment delay count (shorthand for delayCount = delayCount + 1)

  if (delayCount == targetCount) {
    style = int(random(2));
    delayCount = 0;
    targetCount = int(random(1,3));
  }
  
  else {
    style = 0;
  }


  if (mousePressed) {

     
        for (int i=0;i<4;i++){

    // switch statement
    switch(style) {
    case 0:
      // draw a point
      if(keyPressed==true && key== 'v'){
             stroke(verde); 
      }else{
              stroke(rojo); 
      }
      
        strokeWeight(6);
        i=(int)random(4);
      
          line(pmouseX-i*10, pmouseY+i*10,mouseX-i*10,mouseY+i*10);
        
        break;


    case 1:
       
        stroke(0,0);
        strokeWeight(random(2));
        line(pmouseX, pmouseY,mouseX,mouseY);
        
        break;
   
    } // end of switch statement
  }
}

   // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    background(gris);
  }
}
