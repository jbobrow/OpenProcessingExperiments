
PImage blossom;
PImage bubbles;
PImage buttercup;
PImage glitter;


void setup(){
  size(600, 600);
  background(255);
  blossom = loadImage("blossom_head.gif");
  bubbles = loadImage("bubbles_head.gif");
  buttercup = loadImage("buttercup_head.gif");
  glitter = loadImage("glitter.gif");

  
}

void draw(){
  
  
  //conventional round CMYK brush
 
  if((keyPressed == true) && (key == 'c')){
   fill(0, 255, 249, 90);
   noStroke();
   rect(mouseX, mouseY, 20, 20);
  }
  
  if((keyPressed == true) && (key == 'm')){
    fill(201, 0, 255, 90);
    noStroke();
    rect(mouseX, mouseY, 20, 20);
  }
  
  if((keyPressed == true) && (key == 'y')){
    fill(255, 247, 0, 90);
    noStroke();
    rect(mouseX, mouseY, 20, 20);
  }
  
  if((keyPressed == true) && (key == 'k')){
    fill(0, 90);
    noStroke();
    rect(mouseX, mouseY, 20, 20);
  }
  
  //semi-experimental powerpuff girls brush
  
  if((keyPressed == true) && (key == 'p')){
    if(mouseX <= 200){
      image(bubbles, mouseX, mouseY);
    }
    if((mouseX <= 400) && (mouseX >= 200)){
      image(blossom, mouseX, mouseY);
    }
    if((mouseX <= 600) && (mouseX >= 400)){
      image(buttercup, mouseX, mouseY);
    }
  }
   
  //experimental gold explosion brush 
  
  if((keyPressed == true) && (key == 'e')){
    fill(0, 10);
    rect(0,0, 600, 600);  
    image(glitter, random(mouseX, (mouseX - 30)), random(mouseY, (mouseY - 30)));
  
}  
}



