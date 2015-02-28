
int startBallx = 100;
int startBally = 100;

int speedBallx = 30;
int speedBally = 20;

int speedBallx2 = 30;
int speedBally2 = -20;

int speedBallx3 = -30;
int speedBally3 = 20;

void setup() 

{

  size(600, 600); 
  
 


  noStroke();

  colorMode(RGB, 255, 255, 255, 100);

  ellipseMode(CENTER);


}

void draw() 

{   

PImage myImage = loadImage("galaxy.jpg"); 
image(myImage, 0, 0); // drawing the image

 
  
  fill(255, 180, 100, 50 ); //yellow ball

  ellipse(mouseX, height/2, mouseY/2-40, mouseY/2-40);
  
  fill(200, 180, 10, 50 ); //yellow ball

  ellipse(mouseX-80, height/2, mouseY/2-140, mouseY/2-140);
  
  fill(100, 180, 10, 50 ); //dark ball

  ellipse(mouseX-280, height/2, mouseY/2-140, mouseY/2-140);
  
  fill(100, 80, 210, 50 ); //dark ball

  ellipse(mouseX-280, height/2, mouseY/2-140, mouseY-140);
  
  fill(200, 180,210, 50 ); //yellow ball

  ellipse(mouseX+280, height/2, mouseY/2-140, mouseY/2-140);
  
  fill(200, 80, 200, 50); //pink ball

  ellipse(mouseX, height/2, (mouseY/2)/2, mouseY/2);

  fill(255, 80, 30, 50); //red ball

  ellipse(width-mouseX, height/2, ((height-mouseY)/2), ((height-mouseY)/2));
  
  fill(80, 85, 0, 50); //green ball

  ellipse(width-mouseX, height/2, mouseY/2, height-mouseY/2);
  
  fill(160, 13, 0, 50); //green ball

  ellipse((width/2)+mouseX, height/2, mouseY-370, height-mouseY-370);
  
 
  
}
    
 

