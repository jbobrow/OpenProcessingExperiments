



void setup(){
  
  size(400, 400);
  background(0); //black background
  smooth();
  
  
}


void draw(){
  
  
  
//noStroke();
rect(mouseX, mouseY, 20, 20); //makes the sqare
  
  
  for(int y = 0; y < 400; y += 20){ //vertical line of circles
    ellipse(40, y, 40, 40);
}

for(int x = 0; x < 400; x += 20){ //horizontal line of circles
  ellipse(x, 40, 40, 40);
}
  
  
  if(mouseX > 200){  //if mousex is greater than 200, it'll be purple
    fill(100, 100, 255);
  }else{ 
    fill(255, 100, 100);//anytime it's less than 200, it'll be red
    
    if (mousePressed == true) { //when the mouse is pressed, green
        
         fill(100, 255, 100);
    }
}
}
    
   
    
  
  

  




