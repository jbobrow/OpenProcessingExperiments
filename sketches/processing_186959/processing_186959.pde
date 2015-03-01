

void setup(){ //function where we set initial values - runs only once

  size(400,400); //size of sketch

  background(232,131,131);  //background color

}

void draw(){ 
    background(232,131,131); 
  stroke(0);
  //lines to show where different clicks will work
  
  line (200,0,200,200);
  line (200,200,400,200);
  line (200,200,0,200);
  
  //saying if the rightmouse is pressed in the top left box a ellipse will show up
  if(mousePressed && mouseButton == RIGHT && mouseX<width/2 && mouseY<height/2){
 noStroke();        
  ellipse(mouseX,mouseY,50,50);
    fill(0); 
    
  }else{             
    noFill();        
  }
  //saying if the leftmouse is pressed in the top right box a rectangle will show up
  if(mousePressed && mouseButton == LEFT && mouseX>width/2 && mouseY<height/2){
    fill(0);
 rect(mouseX,mouseY,50,50);
  
}
//to make the random green flashing effect
for (int i = 0; i < 150; i++){
  float ran = random (50);
  float ran2 = random (25);
  float ran3 = random (255);
  stroke(ran*5);
//saying if the centemouse is pressed in the bottom box a rectangle will show up
  if(mousePressed && mouseButton == CENTER && mouseY>height/2){
    fill(ran, ran3,ran2);
 rect(mouseX,mouseY,150,150);
}
}
}


