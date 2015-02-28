
//Rosa Han
//Feb 17 2013
//assignment 3

void setup() {
 size(500,700);
 background(255);
}
 
void draw() {
  
  noStroke();
  //box 1
  fill(252,54,233);
  rect(0,0,500,200);
  if ((mouseX>250) && (mouseY>5) && (mouseY<170) && (mouseX<490)) {
      
      background(255);
      fill(31,249,255);
      ellipse(mouseX,mouseY,30,30);
     
     
   
}

  
  //box2
   fill(31,249,255);
   rect(0,0,200,500); 
   if ((mouseX>2) && (mouseY>5) && (mouseY<680) && (mouseX<170)) {
       background(255);
       
     if (mousePressed) 
   
       
       fill(31,249,255);
       rect(mouseX,50,30,30);
       fill(252,52,233);
       rect(mouseX,150,30,30);
       fill(254,252,26);
       rect(mouseX,250,30,30);
       fill(97,252,54);
       rect(mouseX,350,30,30);
       
 
}

    //box3
   
      
   if (mousePressed) 
      
      stroke(254,255,26);
      strokeWeight(2);
      fill(254,random(0),26);
      line(350, 500, mouseX, mouseY);


        
      
    
     
      //box4
      noStroke();
       fill(97,255,54);
       rect(0,500,200,200);
   
      
    
      if ((mouseX>2) && (mouseY>500) && (mouseX<140) && (mouseY<698)) {
       fill(254,255,26);
       rect(0,500,200,200);
         
      
   
 

      }
}
