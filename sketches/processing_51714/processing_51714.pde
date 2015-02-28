
//Mauricio Orantes
//Eyes Balls Exercise

int y;
int x;
// new set of commands for change of color 
int Irx;//Interruption for X
int Iry;//Interuption for Y
color value=#FF6600;

//setup here
void setup() {
  size(500, 500);
  smooth();
  //background(#000000);
  //x=400;
  //noLoop();//This will mess you up! DO NOT INCLUDE IF YOU WANT SOMETHING TO MOVE! 
}

//draw here

void draw() {
  
  
  background(255);
  fill(255);
  for (int x=10; x<500; x=x+20) {
    for (int y=10; y<500; y=y+20) {
      ellipse(x, y, 20, 20);//for the eyeballs
    }
  }
fill(value);
for (int x=10; x<500; x=x+20){
   for (int y=10; y<500; y=y+20){
     ellipse(x,y,10,10);//iris
  
   }
}
   fill(#000000);
   for (int x=10; x<500; x=x+20){
     for (int y=10; y<500; y=y+20){
       ellipse(x,y,5,5);//pupil
    }
}

 if(mouseX>=1 && mouseX<=500){
  println("X=" + mouseX); //prints the line for X
     if(mouseY >=1 && mouseY <=500){
        println("Y=" + mouseY); //print the line for Y
  }
  
  } else { println("you're not on the screen"); }
    
}// END OF DRAW
//}  // fill(#ffffff);
   //} attempting to get it to change color
 void mouseMoved() {
  value = value * 50;
  if (value <= #999933) {
    value = #FF6600;
  }
      }     

