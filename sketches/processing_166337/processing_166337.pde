
float a=0;                    //declare the variable 'a'

void setup(){
  size(200,200);              //set the screen size to 200x200px
  background(255);            //set the background colour to RGB 255,255,255
}

void draw(){
  line(0,a,a,100);            //draw the first line (along the left side)
  line(100,a,a,0);            //draw the second line (along the top)
  a++;                        //increment the variable a by 1 each loop
  stroke(a,0,a);              //change the RGB stroke based on the increments on the variable a
  println(a);                 //print the increments in the message bar
}


