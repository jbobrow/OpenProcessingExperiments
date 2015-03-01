
int gridSize = 80;
int e;
int w;
float spin; 
float r = (0); float t = (0);
float moveSpeedR = (2.2); float moveSpeedT =(2.1);
float dim = 80;
void setup(){
size(1024, 768); 
background(0); 
noStroke(); 
float w;
float e;


}
void draw (){
for (int x = gridSize; x <= width - gridSize; x += gridSize) {
  for (int y = gridSize; y <= height - gridSize; y += gridSize) {
    float a=(random(30));float e=(random(100));float c=(random(200));{
     
      
    float r=(random(20));float g=(random(255));float b=(random(255));
  
    noStroke();
    fill(r,g,b);
e = int (random(0,11))*60;
w = int (random(0,11))*60;
    //rect(x+1, y+1, 3, 3);
  
  
  
  
  rect (x+1, y+2, 20, 10);
  rect(x+2, y+4, 30, 5);
    //rect (e+1, w+2, 20, 10);
  rect(x+2, y+4, 30, 5);
  
  //torso 
  rect(x+6, y+2, 5, 10);
   rect(x+4, y+6, 5, 10);
      rect(x+10, y+2, 10, 8); 
      rect(x+7, y+8, 5, 14);
      
  
  
    
     stroke(a, e, c);
    line(x, y, width/2, height/2);

 
 
    
  } 

    if (mousePressed == true){
    rect (mouseX + 2, mouseY + dim/2,30,5);
  fill(0);
  //rect(-gridSize/2, -gridSize/2, gridSize, gridSize);
 


    }
  
  
  }
  }
}






