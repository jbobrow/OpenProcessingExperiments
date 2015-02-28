
//set global variables
float r = 0;
float g = 0;
float b = 0;
boolean button = false;
boolean flashred = false;
boolean flashgreen = false;
boolean flashblue = false;
boolean flashyellow = false;
boolean redpress = false;
boolean greenpress = false;
boolean bluepress = false;
boolean yellowpress = false;


void setup () {
  size (500, 500);
  frameRate(30);
}


void draw () {
  
  //greenpress = false;
  //redpress = false;
  //bluepress = false;
  //yellowpress = false;
  background (r, g, b);
  fill(255,150,150);
  rect(0, 0, width/2, height/2);
  fill(150,255,150);
  rect(width/2, 0, width/2, height/2);
  fill(150,150,255);
  rect(0, height/2, width/2, height/2);
  fill(255,255,150);
  rect(width/2, height/2, width/2, height/2);
  

//upper right - green
if (mouseX > width/2 && mouseY < height/2 && mousePressed) {
  //fill(0,255,0);
  //rect(width/2, 0, width/2, height/2);
  flashgreen = true;
  greenpress = true;

}

//upper left - red
else if (mouseX < width/2 && mouseY < height/2 && mousePressed) {
  
  //fill(255,0,0);
  //rect(0, 0, width/2, height/2);
  flashred = true;
  redpress = true;
}

//lower left - blue
else if (mouseX < width/2 && mouseY > height/2 && mousePressed) {
  
  //fill(0,0,255);
  //rect(0, height/2, width/2, height/2);
  flashblue = true;
  bluepress = true;
 
}

//lower right - yellow
else if (mouseX > width/2 && mouseY > height/2 && mousePressed) {
  
  //fill(255,255,0);
  //rect(width/2, height/2, width/2, height/2);
  flashyellow = true;
  yellowpress = true;
  
}

if (flashgreen) {
  
  fill(0,255,0);
  rect(width/2, 0, width/2, height/2);
  flashgreen = false;
  
  
}

else if (flashred) {
  
  fill(255,0,0);
  rect(0, 0, width/2, height/2);   
  flashred = false;
  
}

else if (flashblue) {
  
  fill(0,0,255);
  rect(0, height/2, width/2, height/2);
  flashblue = false;
    
}

else if (flashyellow) {
  
  
  fill(255,255,0);
  rect(width/2, height/2, width/2, height/2);
  flashyellow = false;

}


}


void step1() {
  
  flashred = true;
  if (redpress) {
   
   println("Correct");
   redpress = false;
   
   
   
   
    
  } 

}      
