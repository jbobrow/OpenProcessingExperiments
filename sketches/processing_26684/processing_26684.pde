
boolean hit = false;
boolean hit2 = false;
boolean hit3 = false;
boolean hit4 = false;
boolean hit5 = false;
boolean hit6 = false;
boolean hit7 = false;
boolean hit8 = false;
boolean hit9 = false;
float oldX;
float oldY;
int sWeight = 2;

void setup(){
  size(500, 500);
  background(255);
}


void draw(){
  strokeWeight(2);
  
  //button for clear screen
  fill(255);
  rect(10, 20, 30, 30);
  quad(11, 20, 10, 21, 39, 50, 40, 49);
  quad(39, 20, 40, 21, 11, 50, 10, 49);
  if(mouseX > 10 && mouseX < 40 && mouseY > 20 && mouseY < 50){
  // if(!hit){  // This tests to see if hit is not true
     //fill(130, 12, 147);
   //}
   if(mousePressed){ // This is where we know the box has been clicked
   background(255);
    fill(255); 
   }else{
    fill(255); 
   }
    hit = true; 
   //println("HIT!");
  }else{
    hit = false;
    fill(255);
  }
  
  //button for black
  fill(0);
  rect(50, 20, 30, 30);
  if(mouseX > 50 && mouseX < 80 && mouseY > 20 && mouseY < 50){
   //if(!hit2){  // This tests to see if hit is not true
    // fill(130, 120, 147);
  // }
   if(mousePressed){ // This is where we know the box has been clicked
    fill(0); 
    stroke(0);
   }else{
    fill(0); 
   }
    hit2 = true; 
   //println("HIT!");
  }else{
    hit2 = false;
    fill(0);
  }
  
  //button for red
  fill(255, 0, 0);
  rect(90, 20, 30, 30);
  if(mouseX > 90 && mouseX < 120 && mouseY > 20 && mouseY < 50){
  // if(!hit2){  // This tests to see if hit is not true
   //  fill(255, 0, 0);
  // }
   if(mousePressed){ // This is where we know the box has been clicked
    fill(255, 0, 0); 
    stroke(255, 0, 0);
   }else{
    fill(255, 0, 0); 
   }
    hit3 = true; 
   //println("HIT!");
  }else{
    hit3 = false;
    fill(255, 0, 0);
  }
  
  //button for yellow
  fill(250, 255, 0);
  rect(130, 20, 30, 30);
  if(mouseX > 130 && mouseX < 160 && mouseY > 20 && mouseY < 50){
  // if(!hit2){  // This tests to see if hit is not true
   //  fill(250, 255, 0);
   //}
   if(mousePressed){ // This is where we know the box has been clicked
    fill(250, 255, 0); 
    stroke(250, 255, 0);
   }else{
    fill(250, 255, 0); 
   }
    hit4 = true; 
   //println("HIT!");
  }else{
    hit4 = false;
    fill(250, 255, 0);
  }
  
  //button for blue
  fill(0, 40, 255);
  rect(170, 20, 30, 30);
  if(mouseX > 170 && mouseX < 200 && mouseY > 20 && mouseY < 50){
  // if(!hit2){  // This tests to see if hit is not true
     //fill(230, 99, 99);
  // }
   if(mousePressed){ // This is where we know the box has been clicked
    fill(0, 40, 255); 
    stroke(0, 40, 255);
   }else{
    fill(0, 40, 255); 
   }
    hit5 = true; 
   //println("HIT!");
  }else{
    hit5 = false;
    fill(0, 40, 255);
  }
  
  //button for green
  fill(0, 255, 0);
  rect(210, 20, 30, 30);
  if(mouseX > 210 && mouseX < 240 && mouseY > 20 && mouseY < 50){
  // if(!hit2){  // This tests to see if hit is not true
     //fill(230, 99, 99);
  // }
   if(mousePressed){ // This is where we know the box has been clicked
    fill(0, 255, 0); 
    stroke(0, 255, 0);
   }else{
    fill(0, 255, 0); 
   }
    hit6 = true; 
   //println("HIT!");
  }else{
    hit6 = false;
    fill(0, 255, 0);
  }
  
  //button for purple
  fill(111, 10, 201);
  rect(250, 20, 30, 30);
  if(mouseX > 250 && mouseX < 280 && mouseY > 20 && mouseY < 50){
  // if(!hit2){  // This tests to see if hit is not true
     //fill(230, 99, 99);
  // }
   if(mousePressed){ // This is where we know the box has been clicked
    fill(111, 10, 201); 
    stroke(111, 10, 201);
   }else{
    fill(111, 10, 201); 
   }
    hit7 = true; 
   //println("HIT!");
  }else{
    hit7 = false;
    fill(111, 10, 201);
  }
  
  //button for orange
  fill(255, 166, 0);
  rect(290, 20, 30, 30);
  if(mouseX > 290 && mouseX < 320 && mouseY > 20 && mouseY < 50){
  // if(!hit2){  // This tests to see if hit is not true
     //fill(230, 99, 99);
  // }
   if(mousePressed){ // This is where we know the box has been clicked
    fill(255, 166, 0); 
    stroke(255, 166, 0);
   }else{
    fill(255, 166, 0); 
   }
    hit8 = true; 
   //println("HIT!");
  }else{
    hit8 = false;
    fill(255, 166, 0);
  }
  
   //button for aqua
  fill(0, 249, 255);
  rect(330, 20, 30, 30);
  if(mouseX > 330 && mouseX < 360 && mouseY > 20 && mouseY < 50){
  // if(!hit2){  // This tests to see if hit is not true
     //fill(230, 99, 99);
  // }
   if(mousePressed){ // This is where we know the box has been clicked
    fill(0, 249, 255); 
    stroke(0, 249, 255);
   }else{
    fill(0, 249, 255); 
   }
    hit8 = true; 
   //println("HIT!");
  }else{
    hit8 = false;
    fill(0, 249, 255);
  }
  
  fill(255); // lowest weight
  rect(10, 60, 30, 30);
  fill(0);
  rect(25, 60, 0.7, 30);
  if(mouseX > 10 && mouseX < 40 && mouseY > 60 && mouseY < 90){
    if(mousePressed){
      sWeight = 2;
    }
  }
  
  fill(255); // Mid weight
  rect(50, 60, 30, 30);
  fill(0);
  rect(64, 60, 3, 30);
  if(mouseX > 50 && mouseX < 80 && mouseY > 60 && mouseY < 90){
    if(mousePressed){
      sWeight = 5;
    }
  }
  
  fill(255); // Heavy weight
  rect(90, 60, 30, 30);
  fill(0);
  rect(102.5, 60, 6, 30);
  if(mouseX > 90 && mouseX < 120 && mouseY > 60 && mouseY < 90){
    if(mousePressed){
      sWeight = 8;
    }
  }
 
  
  if(mousePressed){ // This draws
  strokeWeight(sWeight);
  line(mouseX, mouseY, oldX, oldY);
  }  
  oldX = mouseX;
  oldY = mouseY;
}

/*void mousePressed(){
  This is the function of mouse clicks throughout the program.
}*/

