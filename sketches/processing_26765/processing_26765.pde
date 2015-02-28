
boolean hit2 = false;
boolean hit = false;
float oldX, oldY;
int weight = 1;
int weightup = 1;


void setup(){
  size(500,500);
  background(255,255,255);
  strokeWeight(weight);
  smooth();
}


void draw(){
  //background(255,255,255);
   //rectangular button code! this one is the eraser
  rect(10, 10, 20, 20);
  //&& is something and something is true
  if (mouseX > 10 && mouseX < 30 && mouseY > 10 && mouseY < 30) {
        //! = not ___
    if(!hit){
      fill(100);
    }
    
    if(mousePressed){
      fill(255);
      background(255,255,255);
    }else{
      fill(100);
    }
    //if(hit == false){
      //println("hit!"); ----how to test
    hit = true; 
  }else{
    hit = false;
    fill(200);
  }
  
//  rect(470, 10, 20, 20); //--- this is for weight ++
//  //&& is something and something is true
//  if (mouseX > 470 && mouseX < 490 && mouseY > 10 && mouseY < 30) {
//        //! = not ___
//    if(!hit2){
//      fill(100);
//    }
//    
//    if(mousePressed){
//      fill(255);
//      weight = weight += weightup;
//      if(weight >= 10 || weight <= 2){
//        weightup *= -1;
//         strokeWeight(weight);
//      }
//     
//    }else{
//      fill(100);
//    }
//    //if(hit == false){
//      //println("hit!"); ----how to test
//    hit2 = true; 
//  }else{
//    hit2 = false;
//    fill(200);
//  }
  
  
   rect(440, 10, 20, 20); //--- this is for weight -
  //&& is something and something is true
  if (mouseX > 440 && mouseX < 460 && mouseY > 10 && mouseY < 30) {
        //! = not ___
    if(!hit2){
      fill(100);
    }
    
    if(mousePressed){
      fill(255);
      if(weight != 0){
        weight--;
        strokeWeight(weight);
      }
     
    }else{
      fill(100);
    }
    //if(hit == false){
      //println("hit!"); ----how to test
    hit2 = true; 
  }else{
    hit2 = false;
    fill(200);
  }
  
  
   rect(470, 10, 20, 20); //--- this is for weight +
  //&& is something and something is true
  if (mouseX > 470 && mouseX < 490 && mouseY > 10 && mouseY < 30) {
        //! = not ___
    if(!hit2){
      fill(100);
    }
    
    if(mousePressed){
      fill(255);
      if(weight != 10){
        weight++;
        strokeWeight(weight);
      }
      
     
    }else{
      fill(100);
    }
    //if(hit == false){
      //println("hit!"); ----how to test
    hit2 = true; 
  }else{
    hit2 = false;
    fill(200);
  }
  
  
  rect(10, 470 , 20, 20); // this is the color
  //&& is something and something is true
  if (mouseX > 10 && mouseX < 30 && mouseY > 470 && mouseY < 490) {
        //! = not ___
    if(!hit){
      fill(100);
    }
    
    if(mousePressed){
      stroke(random(255),random(255),random(255));
    }else{
      fill(100);
    }
    //if(hit == false){
      //println("hit!"); ----how to test
    hit = true; 
  }else{
    hit = false;
    fill(200);
  }
  
  
  
 
 
  
  
  //drawing program
  if (mousePressed){
    line(mouseX, mouseY, oldX, oldY);
  }
  oldX = mouseX;
  oldY = mouseY;
}

//void mousePressed(){  ---- for absolutes outside of just the ifs
  //background(100,100,255);
//}  

