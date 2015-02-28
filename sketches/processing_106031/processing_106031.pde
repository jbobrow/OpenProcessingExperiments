
float x;
float y;
float speed;

void setup(){
    size(200, 400);
    x = width/2;
    y = height/2;
    speed = 50;
    frameRate(150);
  }

void draw(){
  background(255, 164, 134);
  
  textSize(random(12,36));
  fill(random(255));
  text("SOS", random(0, 200),random(0, 400));
  
  rectMode(CENTER);
    
    //body
    fill(200, 200, 0);
    rect(x, y + 40, 50, 80);
    
    //face
    fill(200, 200, 0);
    rect(x, y, 80, 50);
    
    //eye1
    fill(255);
    ellipse(x - 10, y - 10, 10, 10);
    
    //eye1
    fill(255);
    ellipse(x + 5, y - 10, 10, 10);
    
    //mouth
    line(x , y + 5, x + 10, y + 5); 
    
}

void keyPressed(){
  //make it eyes bigger 
  if (key == 'z' || key == 'Z'){
    //eye1
    fill(255);
    ellipse(x - 15, y - 10, 20, 20);
    
    //eye1
    fill(255);
    ellipse(x + 15, y - 10, 30, 30);
   }
  //background change red
    if (key == 'x' || key == 'X'){
      background(252, 54, 54);
    }
  //movement
  if(key == CODED){
    if (keyCode == LEFT){
      if (x > 80)    x -= speed;}
    
   if(keyCode == RIGHT)
    {
      if (x < width - 80)     x += speed;
    }
   if(keyCode == UP)
     {if (y >= 60)    y -= speed;}
   
   if(keyCode == DOWN)
     {if (y < height - 130) y += speed;} 
  }
}
