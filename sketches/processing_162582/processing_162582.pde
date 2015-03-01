
int xPos = 50;
int yPos = 50;
int A = 40;



void setup(){
  
  size(800,600);  
  background(237, 237, 237);
  
  //board
  strokeWeight(1);
  fill(255, 255, 255);
  rect(140, 50, 600, 520);
  
  
  //button
  strokeWeight(1);
  fill(240, 103, 83);
  rect(xPos, yPos, A, A);
  
  fill(249, 166, 83);
  rect(xPos, yPos+A*1.5, A, A);
  
  fill(255, 244, 31);
  rect(xPos, yPos+A*3, A, A);

  fill(137, 229, 83);
  rect(xPos, yPos+A*4.5, A, A);

  fill(102, 193, 255);
  rect(xPos, yPos+A*6, A, A);
  
  fill(23, 94, 142);
  rect(xPos, yPos+A*7.5, A, A);
    
  fill(166, 112, 229);
  rect(xPos, yPos+A*9, A, A);
  
  fill(0, 0, 0);
  rect(xPos, yPos+A*10.5, A, A);
  
  fill(255, 255, 255);
  rect(xPos, yPos+A*12, A, A);
  
}


void draw(){

  
  if(mousePressed){
  
  if( mouseX  > 160  && mouseX  < 780   &&mouseY  > 20  && mouseY  < 780  ){
    noStroke();
    rect( mouseX, mouseY, 30, 30);
  }
  
  if( mouseX  > xPos  && mouseX  < xPos+A   &&mouseY  > yPos  && mouseY  < yPos+A*1.5  ){
  fill(240, 103, 83);    
  }
  
  if( mouseX  > xPos  && mouseX  < yPos+A   &&mouseY  > yPos+A*1.5  && mouseY  < yPos+A*3  ){
  fill(249, 166, 83);
    
  }
  
  if( mouseX  > xPos  && mouseX  < yPos+A   &&mouseY  > yPos+A*3  && mouseY  < yPos+A*4.5  ){
  fill(255, 244, 31);
  
  }
  
  if( mouseX  > xPos  && mouseX  < yPos+A   &&mouseY  > yPos+A*4.5  && mouseY  < yPos+A*6  ){
  fill(137, 229, 83);
  
  }
  
  if( mouseX  > xPos  && mouseX  < yPos+A   &&mouseY  > yPos+A*6  && mouseY  < yPos+A*7.5  ){
  fill(102, 193, 255);
    
  }
  
  if( mouseX  > xPos  && mouseX  < yPos+A   &&mouseY  > yPos+A*7.5  && mouseY  < yPos+A*9  ){
  fill(23, 94, 142);
    
  }
    
  if( mouseX  > xPos  && mouseX  < yPos+A   &&mouseY  > yPos+A*9  && mouseY  < yPos+A*10.5  ){
  fill(166, 112, 229);
    
  }
      
  if( mouseX  > xPos  && mouseX  < yPos+A   &&mouseY  > yPos+A*10.5  && mouseY  < yPos+A*12  ){
  fill(0, 0, 0);
  
  }
  
  if( mouseX  > xPos  && mouseX  < yPos+A   &&mouseY  > yPos+A*12  && mouseY  < yPos+A*13.5  ){
  fill(255, 255, 255);
    
  }
  
 
 }
}
