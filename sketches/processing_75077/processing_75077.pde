

//Name variables here

float directionX;
float directionY;
float directionX2;
float directionY2;
float x;
float y;
float x2;
float y2;
float mySize;

void setup(){       //Assign Numeric Values to Variables Here
  
 size(800,800);
// background(200,100,100);
 
 directionX = 1;
 directionY = 1;
 directionX2 = 2;
 directionY2 = 2;
 mySize = 100;
 
 x = 300;
 y = 200;
 
 x2 = 300;
 y2 = 200;
 
 
 
}

void draw(){               //"Activate" Variable (Assign them to Objects)
  
 background(156,158,206);

  
  ellipse(x,y,200,200);
  fill(mouseX,0, mouseY);
  
  x -= directionX;
  y += directionY;
  x2 += (5 + (mouseX/50));
  y2 += 5;
  
  ellipse(x2, y2, mySize, mySize);
  
  
  if(x2 > 800){
    x2 = 0;
    y2 = 0;
  
  
  } 
  
  if(x < 0){
    x = 500;
    y = 100;
  }
  
  
  if(mousePressed){
   fill(random(255),random(255),random(255));
   mySize += 10;
   
  }
  
  if(mySize >= 800){
    mySize = 100;
  }
    
}

