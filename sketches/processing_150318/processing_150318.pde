

class Walker 

{ 
  PImage image; 

  PVector position; 

  int frameRow; 

  int frameColumn; 

  float frameTimer; 

  PVector velocity; 

  float speed; 

} 

Walker navi; 

float left = 0; 

float right = 0; 

float down = 0; 

float up = 0; 


void setup() 

{ 

  size(950, 850); 

  navi = new Walker(); 

  navi.image = loadImage("Navi.jpg"); 

  navi.position = new PVector(350, 200); 

  navi.velocity = new PVector(100, 100); 

  navi.frameRow = 0;  

  navi.frameColumn = 0; 

  navi.frameTimer = 0;

  navi.speed = 2; 

}

  
void draw() 

{ 

  background(150); 

  navi.velocity.x = navi.speed * (left + right); 

  navi.velocity.y = navi.speed * (up + down); 

  navi.position.add(navi.velocity); 



  navi.frameTimer += 0.1; 

  if (navi.frameTimer >= 4)  

  { 

    navi.frameTimer = 1; 

  } 

  navi.frameColumn = (int)navi.frameTimer; 


  if (navi.velocity.x == 0 && navi.velocity.y == 0) 

  { 

    navi.frameColumn = 0;  

  } 

  if (left != 0) 

  { 

    navi.frameRow = 1;  

  } 

  if (right != 0) 

  { 

    navi.frameRow = 3; 

  } 


  pushMatrix(); 

  translate(navi.position.x, navi.position.y); 

  imageMode(CENTER); 

  
  PImage frameImage = getSubImage(navi.image, navi.frameRow, navi.frameColumn, 200, 200); 
 

  image(frameImage, 0, 65); 

  popMatrix(); 

} 
 
PImage getSubImage(PImage image, int row, int column, int frameWidth, int frameHeight) 

{ 

  return image.get(column * frameWidth, row * frameHeight, frameWidth, frameHeight);  

} 

void keyPressed() 

{ 

  if (keyCode == RIGHT) 

  { 

    right = 1; 

  } 

  if (keyCode == LEFT) 

  { 

    left = -1; 


  } 


} 


void keyReleased() 

{ 

  if (keyCode == RIGHT) 

  { 

    right = 0; 

  } 

  if (keyCode == LEFT) 

  { 

    left = 0; 

  } 


}  



