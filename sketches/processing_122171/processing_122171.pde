
void setup(){
  size(600, 600);
  background(29,84,63);
}
 
void draw(){
  /*white_line*/
  if (mousePressed){
    if(keyPressed){
      switch(key) {
    case'w':
    stroke(240,240,240);  
    strokeWeight(10);
    line(pmouseX, pmouseY, mouseX, mouseY);
    println("w");
      break;
    }
  }
}   
  /*red_line*/
  if (mousePressed){
    if(keyPressed){
      switch(key) {
    case'r':
    stroke(204,180,178);  
    strokeWeight(10);
    line(pmouseX, pmouseY, mouseX, mouseY);
    println("r");
      break;
    }
  }
}
  /*blue_line*/
  if (mousePressed){
    if(keyPressed){
      switch(key) {
    case'b':
    stroke(131,181,218);  
    strokeWeight(10);
    line(pmouseX, pmouseY, mouseX, mouseY);
    println("b");
      break;
    }
  }
}
  /*green_line*/
  if (mousePressed){
    if(keyPressed){
      switch(key) {
    case'g':
    stroke(127,218,141);  
    strokeWeight(10);
    line(pmouseX, pmouseY, mouseX, mouseY);
    println("g");
      break;
    }
  }
}
  /*yellow_line*/
  if (mousePressed){
    if(keyPressed){
      switch(key) {
    case'y':
    stroke(210,223,143);  
    strokeWeight(10);
    line(pmouseX, pmouseY, mouseX, mouseY);
    println("y");
      break;
    }
  }
}
  /*keshigomu_line10*/
  if (mousePressed){
    if(keyPressed){
      switch(key) {
    case'1':
    stroke(29,84,63);  
    strokeWeight(10);
    line(pmouseX, pmouseY, mouseX, mouseY);
    println("1");
      break;
    }
  }
}
  /*keshigomu_line20*/
  if (mousePressed){
    if(keyPressed){
      switch(key) {
    case'2':
    stroke(29,84,63);  
    strokeWeight(20);
    line(pmouseX, pmouseY, mouseX, mouseY);
    println("2");
      break;
    }
  }
}
  /*keshigomu_line30*/
  if (mousePressed){
    if(keyPressed){
      switch(key) {
    case'3':
    stroke(29,84,63);  
    strokeWeight(30);
    line(pmouseX, pmouseY, mouseX, mouseY);
    println("3");
      break;
    }
  }
}
  /*all d*/
  if (keyPressed){
    switch(key) {
    case'a':
    background(29,84,63);
    println("a");
      break;
    }
  }
}



