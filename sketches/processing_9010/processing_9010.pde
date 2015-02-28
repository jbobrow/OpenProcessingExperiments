
PImage redeye; 
int opacity = 0; 
float x = 0;
float y = 0;
float x2 = 0;
float y2 = 0;
float easing = .2; 
 
void setup(){ 
  size(640, 480); 
  redeye = loadImage("redeye.jpg"); 
  noStroke(); 
  smooth(); 
  imageMode(CENTER); 
} 
 
void draw(){ 
  background(0); 

  float mx = constrain(mouseX, 130, 170); 
  float my = constrain(mouseY, 190, 250); 
    
//left white  
  fill(255); 
  ellipse(150, 220, 150, 150); 
   
//left pupil
  x += (mx - x) * easing; 
  y += (my - y) * easing; 
  fill(198, 187, 124); 
  ellipse(x, y, 70, 70); 
  fill(136, 77, 49); 
  ellipse(x, y, 55, 55); 
  fill(41, 28, 15); 
  ellipse(x, y, 30, 30); 
  fill(255, 130); 
  ellipse(x - 5, y - 5, 15, 15); 
          
  float mx2 = constrain(mouseX, 470, 510); 
  float my2 = constrain(mouseY, 190, 250); 
   
//right white
  fill(255); 
  ellipse(490, 220, 150, 150); 
   
//right pupil
  x2 += (mx2 - x2) * easing; 
  y2 += (my2 - y2) * easing; 
  fill(198, 187, 124); 
  ellipse(x2, y2, 70, 70); 
  fill(136, 77, 49); 
  ellipse(x2, y2, 55, 55); 
  fill(41, 28, 15); 
  ellipse(x2, y2, 30, 30); 
  fill(255, 140); 
  ellipse(x2 - 5, y2 - 5, 15, 15); 
  
if (mousePressed == true){ 
  if (opacity < 100){ 
      opacity += 2; 
  } 
} else { 
  if (opacity > 0){ 
opacity -= 2; 
  } 
} 

tint(255, 255, 255, opacity); 
image(redeye, 150, 220, 150, 150); 
image(redeye, 490, 220, 150, 150); 

} 




