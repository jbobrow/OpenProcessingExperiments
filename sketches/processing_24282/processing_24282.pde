
void setup(){
  size(300,300);
  smooth();
  background(255);
  
  for(int i = 0; i < width; i+=30){
     for(int j = 0; j < height; j+=30){
       
        line(0,i,width,i);
        line(j,0,j,height);
      }
  }

fill(0, 0, 0);
text("1", 10, 20);
fill(0, 0, 0);
text("2", 40, 20);
fill(0, 0, 0);
text("3", 70, 20);
fill(0, 0, 0);
text("4", 100, 20);
fill(0, 0, 0);
text("5", 130, 20);
fill(0, 0, 0);
text("6", 160, 20);
fill(0, 0, 0);
text("7", 190, 20);
fill(0, 0, 0);
text("8", 220, 20);
fill(0, 0, 0);
text("9", 250, 20);
fill(0, 0, 0);
text("10", 275, 20);
}

void draw(){
  if (mouseX > 0 && mouseX < 30 && mouseY < 30 && mouseY > 0){
    fill(230,70,58);  /// function 1
    rect(90,90,30,30);
    rect(90,120,30,30);
    rect(90,150,30,30);
    
    fill(255,255,255); /// clears function 2
    rect(270,270,30,30);
    rect(240,270,30,30);
    rect(210,270,30,30);
    
    fill(255,255,255); /// clears function 3
    rect(120,120,30,30);
    rect(150,150,30,30);
    
    fill(255,255,255); /// clears function 4
    rect(270,90,30,30);
    rect(270,120,30,30);
    rect(240,120,30,30);
    
    fill(255,255,255); /// clears function 5
    rect(0,210,30,30);
    rect(0,240,30,30);
    rect(30,240,30,30);
    
    fill(255,255,255); /// clears function 6
    rect(150,30,30,30);
    rect(180,60,30,30);
    rect(210,30,30,30);
    
    fill(255,255,255); /// clears function 7
    rect(90,240,30,30);
    rect(60,270,30,30);
    rect(120,270,30,30);
    
    fill(255,255,255); /// clears function 8
    rect(180,150,30,30);
    rect(210,120,30,30);
    rect(240,90,30,30);
    
    fill(255,255,255); /// clears function 9
    rect(30,30,30,30);
    rect(60,60,30,30);
    rect(30,90,30,30);
    
    fill(255,255,255); /// clears function 10
    rect(150,210,30,30);
    rect(120,240,30,30);
    rect(150,270,30,30);
    
}
  if (mouseX > 30 && mouseX < 60 && mouseY < 30 && mouseY > 0){
    fill(230,70,58); /// function 2
    rect(270,270,30,30);
    rect(240,270,30,30);
    rect(210,270,30,30);
    
    
    fill(255,255,255); /// clears function 1
    rect(90,90,30,30);
    rect(90,120,30,30);
    rect(90,150,30,30);
    
    fill(255,255,255); /// clears function 3
    rect(90,90,30,30);
    rect(120,120,30,30);
    rect(150,150,30,30);
    
    fill(255,255,255); /// clears function 4
    rect(270,90,30,30);
    rect(270,120,30,30);
    rect(240,120,30,30);
    
    fill(255,255,255); /// clears function 5
    rect(0,210,30,30);
    rect(0,240,30,30);
    rect(30,240,30,30);
    
    fill(255,255,255); /// clears function 6
    rect(150,30,30,30);
    rect(180,60,30,30);
    rect(210,30,30,30);
    
    fill(255,255,255); /// clears function 7
    rect(90,240,30,30);
    rect(60,270,30,30);
    rect(120,270,30,30);
    
    fill(255,255,255); /// clears function 8
    rect(180,150,30,30);
    rect(210,120,30,30);
    rect(240,90,30,30);
    
    fill(255,255,255); /// clears function 9
    rect(30,30,30,30);
    rect(60,60,30,30);
    rect(30,90,30,30);
    
    fill(255,255,255); /// clears function 10
    rect(150,210,30,30);
    rect(120,240,30,30);
    rect(150,270,30,30);
    
  }
  
    if (mouseX > 60 && mouseX < 90 && mouseY < 30 && mouseY > 0){
    fill(230,70,58); /// function 3
    rect(90,90,30,30);
    rect(120,120,30,30);
    rect(150,150,30,30);
  
      
      
    fill(255,255,255); /// clears function 2
    rect(270,270,30,30);
    rect(240,270,30,30);
    rect(210,270,30,30);
    
    fill(255,255,255); /// clears function 4
    rect(270,90,30,30);
    rect(270,120,30,30);
    rect(240,120,30,30);
    
    
    fill(255,255,255); /// clears function 1
    rect(90,120,30,30);
    rect(90,150,30,30);
    
    fill(255,255,255); /// clears function 5
    rect(0,210,30,30);
    rect(0,240,30,30);
    rect(30,240,30,30);
    
    fill(255,255,255); /// clears function 6
    rect(150,30,30,30);
    rect(180,60,30,30);
    rect(210,30,30,30);
    
    fill(255,255,255); /// clears function 7
    rect(90,240,30,30);
    rect(60,270,30,30);
    rect(120,270,30,30);
    
    fill(255,255,255); /// clears function 8
    rect(180,150,30,30);
    rect(210,120,30,30);
    rect(240,90,30,30);
    
    fill(255,255,255); /// clears function 9
    rect(30,30,30,30);
    rect(60,60,30,30);
    rect(30,90,30,30);
    
    fill(255,255,255); /// clears function 10
    rect(150,210,30,30);
    rect(120,240,30,30);
    rect(150,270,30,30);
  }
  
    if (mouseX > 90 && mouseX < 120 && mouseY < 30 && mouseY > 0){
    fill(230,70,58); /// function 4
    rect(270,90,30,30);
    rect(270,120,30,30);
    rect(240,120,30,30);
        
    
    fill(255,255,255); /// clears function 3
    rect(90,90,30,30);
    rect(120,120,30,30);
    rect(150,150,30,30);
  
      
      
    fill(255,255,255); /// clears function 2
    rect(270,270,30,30);
    rect(240,270,30,30);
    rect(210,270,30,30);
    
    
    fill(255,255,255); /// clears function 1
    rect(90,120,30,30);
    rect(90,150,30,30);
    
    fill(255,255,255); /// clears function 5
    rect(0,210,30,30);
    rect(0,240,30,30);
    rect(30,240,30,30);
    
    fill(255,255,255); /// clears function 6
    rect(150,30,30,30);
    rect(180,60,30,30);
    rect(210,30,30,30);
    
    fill(255,255,255); /// clears function 7
    rect(90,240,30,30);
    rect(60,270,30,30);
    rect(120,270,30,30);
    
    fill(255,255,255); /// clears function 8
    rect(180,150,30,30);
    rect(210,120,30,30);
    rect(240,90,30,30);
    
    fill(255,255,255); /// clears function 9
    rect(30,30,30,30);
    rect(60,60,30,30);
    rect(30,90,30,30);
    
    fill(255,255,255); /// clears function 10
    rect(150,210,30,30);
    rect(120,240,30,30);
    rect(150,270,30,30);
  }
  
    if (mouseX > 120 && mouseX < 150 && mouseY < 30 && mouseY > 0){
    fill(230,70,58); /// function 5
    rect(0,210,30,30);
    rect(0,240,30,30);
    rect(30,240,30,30);
    
    fill(255,255,255); /// clears function 6
    rect(150,30,30,30);
    rect(180,60,30,30);
    rect(210,30,30,30);
    
    
    fill(255,255,255); /// clears function 4
    rect(270,90,30,30);
    rect(270,120,30,30);
    rect(240,120,30,30);
        
    
    fill(255,255,255); /// clears function 3
    rect(90,90,30,30);
    rect(120,120,30,30);
    rect(150,150,30,30);
  
      
      
    fill(255,255,255); /// clears function 2
    rect(270,270,30,30);
    rect(240,270,30,30);
    rect(210,270,30,30);
    
    
    fill(255,255,255); /// clears function 1
    rect(90,120,30,30);
    rect(90,150,30,30);
    
    fill(255,255,255); /// clears function 7
    rect(90,240,30,30);
    rect(60,270,30,30);
    rect(120,270,30,30);
    
    fill(255,255,255); /// clears function 8
    rect(180,150,30,30);
    rect(210,120,30,30);
    rect(240,90,30,30);
    
    fill(255,255,255); /// clears function 9
    rect(30,30,30,30);
    rect(60,60,30,30);
    rect(30,90,30,30);
    
    fill(255,255,255); /// clears function 10
    rect(150,210,30,30);
    rect(120,240,30,30);
    rect(150,270,30,30);
    
  }  
  
  
    if (mouseX > 150 && mouseX < 180 && mouseY < 30 && mouseY > 0){
    fill(230,70,58); /// function 6
    rect(150,30,30,30);
    rect(180,60,30,30);
    rect(210,30,30,30);
    
    
    fill(255,255,255); /// clears function 5
    rect(0,210,30,30);
    rect(0,240,30,30);
    rect(30,240,30,30);
    
    fill(255,255,255); /// clears function 4
    rect(270,90,30,30);
    rect(270,120,30,30);
    rect(240,120,30,30);
        
    
    fill(255,255,255); /// clears function 3
    rect(90,90,30,30);
    rect(120,120,30,30);
    rect(150,150,30,30);
  
      
      
    fill(255,255,255); /// clears function 2
    rect(270,270,30,30);
    rect(240,270,30,30);
    rect(210,270,30,30);
    
    
    fill(255,255,255); /// clears function 1
    rect(90,120,30,30);
    rect(90,150,30,30);
    
    fill(255,255,255); /// clears function 7
    rect(90,240,30,30);
    rect(60,270,30,30);
    rect(120,270,30,30);
    
    fill(255,255,255); /// clears function 8
    rect(180,150,30,30);
    rect(210,120,30,30);
    rect(240,90,30,30);
    
    fill(255,255,255); /// clears function 9
    rect(30,30,30,30);
    rect(60,60,30,30);
    rect(30,90,30,30);
    
    fill(255,255,255); /// clears function 10
    rect(150,210,30,30);
    rect(120,240,30,30);
    rect(150,270,30,30);
    
  } 
 
     if (mouseX > 180 && mouseX < 210 && mouseY < 30 && mouseY > 0){
    fill(230,70,58); /// function 7
    rect(90,240,30,30);
    rect(60,270,30,30);
    rect(120,270,30,30);

    
    fill(255,255,255); /// clears function 6
    rect(150,30,30,30);
    rect(180,60,30,30);
    rect(210,30,30,30);
    
    
    fill(255,255,255); /// clears function 5
    rect(0,210,30,30);
    rect(0,240,30,30);
    rect(30,240,30,30);
    
    fill(255,255,255); /// clears function 4
    rect(270,90,30,30);
    rect(270,120,30,30);
    rect(240,120,30,30);
        
    
    fill(255,255,255); /// clears function 3
    rect(90,90,30,30);
    rect(120,120,30,30);
    rect(150,150,30,30);
  
      
      
    fill(255,255,255); /// clears function 2
    rect(270,270,30,30);
    rect(240,270,30,30);
    rect(210,270,30,30);
    
    
    fill(255,255,255); /// clears function 1
    rect(90,120,30,30);
    rect(90,150,30,30);
    
    fill(255,255,255); /// clears function 8
    rect(180,150,30,30);
    rect(210,120,30,30);
    rect(240,90,30,30);
    
    fill(255,255,255); /// clears function 9
    rect(30,30,30,30);
    rect(60,60,30,30);
    rect(30,90,30,30);
    
    fill(255,255,255); /// clears function 10
    rect(150,210,30,30);
    rect(120,240,30,30);
    rect(150,270,30,30);
    
  } 

     if (mouseX > 210 && mouseX < 240 && mouseY < 30 && mouseY > 0){
    fill(230,70,58); /// function 8
    rect(180,150,30,30);
    rect(210,120,30,30);
    rect(240,90,30,30);
   
    
    fill(255,255,255); /// clears function 7
    rect(90,240,30,30);
    rect(60,270,30,30);
    rect(120,270,30,30);

    
    fill(255,255,255); /// clears function 6
    rect(150,30,30,30);
    rect(180,60,30,30);
    rect(210,30,30,30);
    
    
    fill(255,255,255); /// clears function 5
    rect(0,210,30,30);
    rect(0,240,30,30);
    rect(30,240,30,30);
    
    fill(255,255,255); /// clears function 4
    rect(270,90,30,30);
    rect(270,120,30,30);
    rect(240,120,30,30);
        
    
    fill(255,255,255); /// clears function 3
    rect(90,90,30,30);
    rect(120,120,30,30);
    rect(150,150,30,30);
  
      
      
    fill(255,255,255); /// clears function 2
    rect(270,270,30,30);
    rect(240,270,30,30);
    rect(210,270,30,30);
    
    
    fill(255,255,255); /// clears function 1
    rect(90,120,30,30);
    rect(90,150,30,30);
    
    fill(255,255,255); /// clears function 9
    rect(30,30,30,30);
    rect(60,60,30,30);
    rect(30,90,30,30);
    
    fill(255,255,255); /// clears function 10
    rect(150,210,30,30);
    rect(120,240,30,30);
    rect(150,270,30,30);
    
  }   
  
  
    if (mouseX > 240 && mouseX < 270 && mouseY < 30 && mouseY > 0){
    fill(230,70,58); /// function 9
    rect(30,30,30,30);
    rect(60,60,30,30);
    rect(30,90,30,30);
   
    
    fill(255,255,255); /// clears function 8
    rect(180,150,30,30);
    rect(210,120,30,30);
    rect(240,90,30,30);
   
    
    fill(255,255,255); /// clears function 7
    rect(90,240,30,30);
    rect(60,270,30,30);
    rect(120,270,30,30);

    
    fill(255,255,255); /// clears function 6
    rect(150,30,30,30);
    rect(180,60,30,30);
    rect(210,30,30,30);
    
    
    fill(255,255,255); /// clears function 5
    rect(0,210,30,30);
    rect(0,240,30,30);
    rect(30,240,30,30);
    
    fill(255,255,255); /// clears function 4
    rect(270,90,30,30);
    rect(270,120,30,30);
    rect(240,120,30,30);
        
    
    fill(255,255,255); /// clears function 3
    rect(90,90,30,30);
    rect(120,120,30,30);
    rect(150,150,30,30);
  
      
      
    fill(255,255,255); /// clears function 2
    rect(270,270,30,30);
    rect(240,270,30,30);
    rect(210,270,30,30);
    
    
    fill(255,255,255); /// clears function 1
    rect(90,120,30,30);
    rect(90,150,30,30);
    
    fill(255,255,255); /// clears function 10
    rect(150,210,30,30);
    rect(120,240,30,30);
    rect(150,270,30,30);
  } 
   
    if (mouseX > 270 && mouseX < 300 && mouseY < 30 && mouseY > 0){
    fill(230,70,58); /// function 10
    rect(150,210,30,30);
    rect(120,240,30,30);
    rect(150,270,30,30);

    
    fill(255,255,255); /// clears function 9
    rect(30,30,30,30);
    rect(60,60,30,30);
    rect(30,90,30,30);
   
    
    fill(255,255,255); /// clears function 8
    rect(180,150,30,30);
    rect(210,120,30,30);
    rect(240,90,30,30);
   
    
    fill(255,255,255); /// clears function 7
    rect(90,240,30,30);
    rect(60,270,30,30);
    rect(120,270,30,30);

    
    fill(255,255,255); /// clears function 6
    rect(150,30,30,30);
    rect(180,60,30,30);
    rect(210,30,30,30);
    
    
    fill(255,255,255); /// clears function 5
    rect(0,210,30,30);
    rect(0,240,30,30);
    rect(30,240,30,30);
    
    fill(255,255,255); /// clears function 4
    rect(270,90,30,30);
    rect(270,120,30,30);
    rect(240,120,30,30);
        
    
    fill(255,255,255); /// clears function 3
    rect(90,90,30,30);
    rect(120,120,30,30);
    rect(150,150,30,30);
  
      
      
    fill(255,255,255); /// clears function 2
    rect(270,270,30,30);
    rect(240,270,30,30);
    rect(210,270,30,30);
    
    
    fill(255,255,255); /// clears function 1
    rect(90,120,30,30);
    rect(90,150,30,30);
    
  } 
       
  
 
  
  
  println("x: " + mouseX);
  println("y: " + mouseY);
}




