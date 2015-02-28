
// 22/9/2013
// Ashely (Choi Chi Fung)
// 53075411
// Assignment2.

void setup(){
  size(500, 500); // The window size
}
 
void draw(){
  //for structures
  for (int x = 0; x < 500; x = x + 10){ //for-loop 1
    for(int y = 0; y < 500; y = y + 20){ //for-loop 2
      fill((int)60, random(100), random(200));
      strokeWeight(5);
      stroke(0);
      rect((int)x+10 , y+10, x+10, y+10);
       
      //if-else structure
      if(mousePressed){ //condition of pressing the mouse
          
         smooth();
         fill((int)random(200, 105));
         strokeWeight(10);
         stroke(10); 
        triangle(50,150,50,250,100,200);    
        triangle(100,200,300,400,300,100);
         
        
         rect(400, 100, 80, 40);
         rect(400, 200, 80, 40);
         rect(400, 300, 80, 40);
         rect(400, 400, 80, 40);
          
          //text part
          textSize(40);
          fill((int)random(255, 255),random(255, 255), random(255, 255), random(255));
          text("Action!", 40, 480);
    
        }else{//when the mouse was not pressed

          background(0);//black background  
          fill(255);//colour of the text :white
          textSize(30);//text
          text("Everyone Ready!3~!2~!1!", 50, 350);
         
          fill(0); //the Continuity plate
          strokeWeight(5);
          stroke(200);
          
     
            fill(0);
          strokeWeight(10);
          stroke(255);
          line(mouseX+10, mouseY+10, 150, 100);
          line(mouseX+20, mouseY+20, 150, 100);
          
          rect(mouseX+10, mouseY+10, 250, 150);
          
          fill(0);
          strokeWeight(10);
          rect(mouseX+10, mouseY+10, 200, 100);
       
          strokeWeight(10);
          rect(mouseX + 35, mouseY+35, 150, 70);
      
          
    
      }
  }
}
}


