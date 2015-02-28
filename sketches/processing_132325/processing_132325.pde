
//Global Variables

int x;
int y;
int d = 10;

//Run through once
void setup(){
   size(400,400);
   x = width/2;
   y = height/2;
}

//Runs through continuously
void draw(){
  
if(mousePressed == true) {
  stroke(random(0,255),random(0,255),random(0,255)); 
  strokeWeight(random(0,20));
  ellipse(mouseX, mouseY, 10, 10);
  
}
else if (keyPressed){
  stroke(0,0,0);
}
else{
  noStroke();
}

fill(random(0,255),random(0,255),random(0,255));  
    ellipse(mouseX, mouseY, d, d);
    
}


