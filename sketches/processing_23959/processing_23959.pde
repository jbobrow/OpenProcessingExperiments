
//MIDTERM


//use keyPress
//use mousePressed
//use cursor




void setup(){
  size (800, 600);
}

void draw(){
background (0);
if(mousePressed) {
    background(255);
  } else {
    background(0);
  }
  
stroke (255);
if(mousePressed) {
    stroke(0);
  } else {
    stroke(255);
  }


  
//First Line

//Blue
if (keyPressed == true) {
  fill(73, 6, 142);
  } else {
     fill(17, 10, 247);
}

strokeWeight(5);
smooth();
ellipse (100, 100, 100, 100);



//Yellow 
if (keyPressed == true) {
  fill(252, 67, 5);
  } else {
      fill(211, 201, 0);
}
  
strokeWeight(5);
smooth();
ellipse (400, 100, 100, 100);



//Red
if (keyPressed == true) {
 fill(255, 8, 140);
 } else {
    fill(237, 0, 4);
}
 
strokeWeight(5);
smooth();
ellipse (700, 100, 100, 100);

 

//Secon Line

//Purlpe
if (keyPressed == true) {
 fill(17, 10, 247);
 } else {
     fill(73, 6, 142);
}
 
strokeWeight(5);
smooth();
ellipse (100, 500, 100, 100);


//Orange
if (keyPressed == true) {
 fill(211, 201, 0); 
 } else {
     fill(252, 67, 5);
}

strokeWeight(5);
smooth();
ellipse (400, 500, 100, 100);


//Pink
if (keyPressed == true) {
 fill(237, 0, 4);
 } else {
     fill(255, 8, 140);
}

strokeWeight(5); 
smooth();
ellipse (700, 500, 100, 100);


//Random Moving Ball, Just cause

if (keyPressed == true) {
  fill(0);
  } else {
      fill(255);
}

strokeWeight(5);
smooth();
ellipse(mouseX,mouseY,100,100);

 


}


//In my code I used basic colors and basic shapes.  
//I also used basic code to creat a colorfulinteractive art peice.
//I wanted to create symmetry in the shapes, and in the exchange of colors between shapes.
//


