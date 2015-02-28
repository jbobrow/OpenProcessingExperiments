
// NOTES
// Not quite finished, countdown should end game but couldnt do it.
// Also wanted to add random targets that pop up, just didnt have the time :/ 
// Other wise enjoy! 
// Alot of the physics stuff you helped me with in class aka mouse click making ball shoot ect.. 
// All else is me. Oh classmate and I figured out countdown together! 

float vx = 10;
float vy = 0;
float x = 0;
float y = 10;
float frictionx = .998;
float frictiony = -.75;
float gravity = .01; 
PImage myImg;
PImage myImgtwo;

void setup(){
  size(1000,1000);
myImg = loadImage("gun.gif");
myImgtwo = loadImage("bang.gif");

  
 
   background(255,255,255);
}

  void draw() {
     //count down
   int sec = millis()/1000;
println(-sec+100);

image(myImg,300,100);

    
 if(mousePressed && mouseX > 0 && mouseX < 1000 && mouseY > 0 && mouseY < 1000){
   image(myImgtwo,300,100); }
   
 
  
    //physics math
    vy += gravity;
    vx *= frictionx;
    x += vx;
    y += vy;
    if(y > height){
      y= height;
      vy *= frictiony;
    }
    
  if (mousePressed){
      float diffx = mouseX-x;
      float diffy = mouseY-y;
      x = x + diffx * .05;
      y = y + diffy * .05;
    }
    
    
    if(y < 0){
      y= 0;
      vy *= frictiony;
    }
    
    if (x > width){
      x= width;
      vx *= -frictionx;
    }
    
    if (x < 0){
      x= 0;
      vx *= -frictionx;
    }
    fill(mouseX,25,30);
    ellipse(x,y,20,20);
  }
  


 
     


