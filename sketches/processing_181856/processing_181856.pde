
/*

A simple drawing program, 
demonstrating mouse interaction and 
determining whether a point is inside a rect.

*/

int w;  //ellipse width
int resetX, resetY, resetH, resetW; //button dimensions

void setup(){
  //set canvas size
  size(400,400);
 
  //initialize variables
  w = 20;  
  resetX = 350;
  resetY= 350;
  resetH = 15;
  resetW = 15;

  background(125, 125, 125); //fill background w. 50% grey
}

void draw(){  
  stroke(255,255,255); //set the stroke to white
  
  if(mousePressed){      //if the mouseButton is down...
    fill(255,255,255);  //...set the fill...
  }else{                //...otherise...
    noFill();           //...no fill
  }  
  
  ellipse(mouseX, mouseY, w, w); //draw an ellipse at the mouse location
  
  //reset box
  if((mouseX >= resetX && mouseX <= resetX + resetW &&
    mouseY >= resetY && mouseY <= resetY + resetH) )   //hover state: check if we're over the button...
    {
      fill(255,0,0);  //... if so, set the fill to red
    }
  else fill(125,125,125); //... if not, make it greye

  rect(350, 350, 15, 15);  //draw the button
}

void mouseClicked(){
  //check if mouse is inside reset
  if(mouseX >= resetX && mouseX <= resetX + resetW &&
     mouseY >= resetY && mouseY <= resetY + resetH){
       background(125, 125, 125);  //if so, fill the canvas w. grey
     }
}


