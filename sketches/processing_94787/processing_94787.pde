
//make program with for loops


int numberBubbles; //define numberBubbles
int moveup = 400; //set int bubs to 400

void setup(){
 size(400,400); //size of the window
 background(159,177,242); //color of background baby blue 
 noStroke(); //gets rid of lines around cicles
 ellipseMode(CENTER); //x,y points are the center of circle
 frameRate(3); //display at 3 frames per second
}

void draw(){
  background(159,177,242); //redraws background color
  bubble(); //call bubble function
  bubble2(); //call bubble2 function
  bubble3(); //call bubble3 function
  bubble4(); //call bubble4 function
  bubble5(); //call bubble5 function

}

void bubble(){ //draws 1st bubble
    for (int i=0; i<3; i++){ //set i to 0, i should be less than 3, add 1 to i
      color c= color(random(0,255), random(0,255), random(0,255)); //set random color for c
      int x= (int)random(0,400); //set x to random int between 0,400
      int y= (int)random(300,420); //set y to random int between 300, 420
      int w= (int)random(20,50); //set w to random int between 20,50
      int h= w; //set h to what w is
      moveup= (moveup-1)%400; // set moveup to moveup-1 and divide by 400 when it reaches 0
      moveup= min(0,moveup); //min is when moveup reaches 0
      fill(c); //fill in color of ellispe
      ellipse(x,y+moveup,w,h); //draw ellipse with the number set above
    }
}

void bubble2(){ //draws 1st bubble
    for (int i=0; i<3; i++){ //set i to 0, i should be less than 3, add 1 to i
      color c= color(random(0,255), random(0,255), random(0,255)); //set random color for c
      int x= (int)random(0,400); //set x to random int between 0,400
      int y= (int)random(200,300); //set y to random int between 200, 300
      int w= (int)random(20,50); //set w to random int between 20,50
      int h= w; //set h to what w is
      moveup= (moveup-1)%300; // set moveup to moveup-1 and divide by 300 when it reaches 0
      moveup= min(0,moveup); //min is when moveup reaches 0
      fill(c); //fill in color of ellispe
      ellipse(x,y+moveup,w,h); //draw ellipse with the number set above
    }
}

void bubble3(){ //draws 1st bubble
    for (int i=0; i<3; i++){ //set i to 0, i should be less than 3, add 1 to i
      color c= color(random(0,255), random(0,255), random(0,255)); //set random color for c
      int x= (int)random(0,400); //set x to random int between 0,400
      int y= (int)random(150,420); //set y to random int between 150, 420
      int w= (int)random(20,50); //set w to random int between 20,50
      int h= w; //set h to what w is
      moveup= (moveup-1)%400; // set moveup to moveup-1 and divide by 400 when it reaches 0
      moveup= min(0,moveup); //min is when moveup reaches 0
      fill(c); //fill in color of ellispe
      ellipse(x,y+moveup,w,h); //draw ellipse with the number set above
    }
}

void bubble4(){ //draws 1st bubble
    for (int i=0; i<3; i++){ //set i to 0, i should be less than 3, add 1 to i
      color c= color(random(0,255), random(0,255), random(0,255)); //set random color for c
      int x= (int)random(0,400); //set x to random int between 0,400
      int y= (int)random(150,300); //set y to random int between 150, 300
      int w= (int)random(20,50); //set w to random int between 20,50
      int h= w; //set h to what w is
      moveup= (moveup-1)%300; // set moveup to moveup-1 and divide by 300 when it reaches 0 to go back
      moveup= min(0,moveup); //min is when moveup reaches 0
      fill(c); //fill in color of ellispe
      ellipse(x,y+moveup,w,h); //draw ellipse with the number set above
    }
}

void bubble5(){ //draws 1st bubble
    for (int i=0; i<3; i++){ //set i to 0, i should be less than 3, add 1 to i
      color c= color(random(0,255), random(0,255), random(0,255)); //set random color for c
      int x= (int)random(0,400); //set x to random int between 0,400
      int y= (int)random(300,420); //set y to random int between 300, 420
      int w= (int)random(20,50); //set w to random int between 20,50
      int h= w; //set h to what w is
      moveup= (moveup-1)%420; // set moveup to moveup-1 and divide by 420 when it reaches 0 to go back
      moveup= min(0,moveup); //min is when moveup reaches 0
      fill(c); //fill in color of ellispe
      ellipse(x,y+moveup,w,h); //draw ellipse with the number set above
    }
}






