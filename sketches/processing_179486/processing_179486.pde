
//by Anna Chim SID 53150427
//Demostrating the beauty of geomotry using recursion

int slide = 1;
float theta; 

void setup() {
  size(600,600);
  smooth();
  noFill();
}

void draw(){
  
  theta = PI/4; // default rotation as 1/4 PI
  background(0);
  stroke(255);
  translate(width/2,height/2); //move the grid
  rectMode(CENTER);
  fill(155,20);
  rect(0, 0,100,100);
  
  if(slide == 1){
  rectMode(CENTER);
  rect(0, 0,100,100);
  }
  
  if(slide == 2){
    rectSet1(100);
  }
  
    
  if(slide == 3){
    rectSet2(100);
  }
  
    if(slide == 4){
    rectSet3(100);
  }

    if(slide == 5){
    rectSet4(100);
  }
    if(slide == 6){
    rectSet5(100);
  }
  
      if(slide == 7){
    rectSet6(100);
  }
  
        if(slide == 8){
    rectSet7(100);
  }
        if(slide == 9){
    rectSet8(100);
  }
        if(slide == 10){
    rectSet9(100);
  }
        if(slide == 11){
    rectSet10(100);
  }
}

  
void mousePressed() {
  slide++; // change slide everytime when mouse is pressed
  if (slide > 10) slide = 1;
}


void rectSet1(float size){
  rect(mouseX, mouseY, size, size); //use mouse to move starting cordinate
  translate(0,+size);
  size *= 0.75;
  if (size>30){
  pushMatrix(); //transformation
  rotate(theta);
  rectSet1(size);
  popMatrix();
  }
}


void rectSet2(float size){
  rect(mouseX, mouseY, size,size);
  size *= 0.75;
  if (size>30){
  pushMatrix();
  translate(0, size);
  rotate(theta);
  rectSet2(size);
  popMatrix();
  
  pushMatrix();
  rotate(theta*4);
  rectSet2(size);
  popMatrix();
  }
}

void rectSet3(float size){
  rect(mouseX, mouseY, size,size);
  size *= 0.75;
  if (size>30){
    
  pushMatrix();
  translate(0, size);
  rotate(theta);
  rectSet3(size);
  popMatrix();
  
  pushMatrix();
  rotate(-theta);
  rectSet3(size);
  popMatrix();
  
  pushMatrix();
  rotate(-theta*4);
  rectSet3(size);
  popMatrix();
  
  pushMatrix();
  rotate(theta*4);
  rectSet3(size);
  popMatrix();
  
  }
}

void rectSet4(float size){
  rect(mouseX, mouseY, size , size);
  size *= 0.75;
  if (size>30){
    
   pushMatrix();
  translate(0, size);
  rotate(theta);
  rectSet4(size);
  popMatrix();
  
  pushMatrix();
  rotate(theta*2);
  rectSet4(size);
  popMatrix();
  
  pushMatrix();
  rotate(theta*3);
  rectSet4(size);
  popMatrix();
  
  pushMatrix();
  rotate(theta*4);
  rectSet4(size);
  popMatrix();
  
  }
}

void rectSet5 (float size){
  rect(mouseX, mouseY, size, size);
  size *= 0.75;
  if (size>30){
    
  pushMatrix();
  translate(0, size);
  rotate(theta);
  rectSet5(size);
  popMatrix();
    pushMatrix();
  translate(0, size);
  rotate(-theta);
  rectSet5(size);
  popMatrix();
  
  pushMatrix();
  rotate(theta*2);
  rectSet5(size);
  popMatrix();
    pushMatrix();
  rotate(-theta*2);
  rectSet5(size);
  popMatrix();
  
  pushMatrix();
  rotate(theta*3);
  rectSet5(size);
  popMatrix();
    pushMatrix();
  rotate(-theta*3);
  rectSet5(size);
  popMatrix();
  
  pushMatrix();
  rotate(theta*4);
  rectSet5(size);
  popMatrix();
    pushMatrix();
  rotate(-theta*4);
  rectSet5(size);
  popMatrix();
  
  
  }
}


void rectSet6 (float size){
  rect(mouseX, mouseY, size*2, size*2);
  size *= 0.75;
  if (size>40){
    
  pushMatrix();
  translate(0, size);
  rotate(theta);
  rectSet6(size);
  popMatrix();
    pushMatrix();
  translate(0, size);
  rotate(-theta);
  rectSet6(size);
  popMatrix();
  
  pushMatrix();
  rotate(theta*2);
  rectSet6(size);
  popMatrix();
    pushMatrix();
  rotate(-theta*2);
  rectSet6(size);
  popMatrix();
  
  pushMatrix();
  rotate(theta*3);
  rectSet6(size);
  popMatrix();
    pushMatrix();
  rotate(-theta*3);
  rectSet6(size);
  popMatrix();
  
  pushMatrix();
  rotate(theta*4);
  rectSet6(size);
  popMatrix();
    pushMatrix();
  rotate(-theta*4);
  rectSet6(size);
  popMatrix();
  
  
  }
}

void rectSet7(float size){
  rect(mouseX, mouseY, size*3, size*3);
  size *= 0.75;
  if (size>30){
    
   pushMatrix();
  translate(0, size);
  rotate(theta);
  rectSet7(size);
  popMatrix();
  
  pushMatrix();
  rotate(theta*2);
  rectSet7(size);
  popMatrix();
  
  pushMatrix();
  rotate(theta*3);
  rectSet7(size);
  popMatrix();
  
  pushMatrix();
  rotate(theta*4);
  rectSet7(size);
  popMatrix();
  
  }
}

void rectSet8(float size){
  rect(mouseX, mouseY, size*4,size*4);
  size *= 0.75;
  if (size>30){
    
  pushMatrix();
  translate(0, size);
  rotate(theta);
  rectSet8(size);
  popMatrix();
  
  pushMatrix();
  rotate(-theta);
  rectSet8(size);
  popMatrix();
  
  pushMatrix();
  rotate(-theta*4);
  rectSet8(size);
  popMatrix();
  
  pushMatrix();
  rotate(theta*4);
  rectSet8(size);
  popMatrix();
  
  }
}

void rectSet9(float size){
  rect(mouseX, mouseY, size*5,size*5);
  size *= 0.75;
  if (size>30){
  pushMatrix();
  translate(0, size);
  rotate(theta);
  rectSet9(size);
  popMatrix();
  
  pushMatrix();
  rotate(theta*4);
  rectSet9(size);
  popMatrix();
  }
}

void rectSet10(float size){
  rect(mouseX, mouseY, size*6, size*6);
  translate(0,+size);
  size *= 0.75;
  if (size>30){
  pushMatrix();
  rotate(theta);
  rectSet10(size);
  popMatrix();
  }
}


