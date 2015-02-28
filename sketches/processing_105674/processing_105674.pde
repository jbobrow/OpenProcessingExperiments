
float angle;
float jitter;
float squareWidth, squareHeight;
float rotation;


void setup()  {
  size(1000,600);  
  if (frame != null) {
    frame.setResizable(true);
  }
  rectMode(CENTER);
  squareWidth = squareHeight = 180;
}

void draw()  {
   background(255);
   fill(0,255,0);
   strokeWeight(width/7);
   line(0,0, width, height); 
   
   


  if (width >= 1100) {
   fill(random(0,255)); 
  }
  if(width <=400) { //narrows when width gets small
    fill(255,0,0);    
    for(int explode = 0; explode <= 5; explode++)  {
        if(second() % 5 == 0) {
          squareHeight--;
        }
    }
  }
  
  
  if(width > 1100){ //widens when width gets large
    for(int explode = 0; explode <= 5; explode++)  {
        if(second() % 5 == 0) {
          squareWidth++;
        }
    }
  }
  
    if (height >= 700) {
   fill(random(0,255)); 
  }
  
  if(height < 300) { //narrows when height gets small
    fill(255,0,0);    
    for(int explode = 0; explode <= 5; explode++)  {
        if(second() % 5 == 0) {
          squareHeight--;
        }
    }
  }
  
  
  if(height >= 700){ //widens when height gets large
    for(int explode = 0; explode <= 5; explode++)  {
        if(second() % 5 == 0) {
          squareHeight++;
        }
    }
  }
  
  
  
  for (int i = 0; i < 100; i++)  {
   strokeWeight(width/7);
   stroke(0);
    line(0,0,width+i,height+i);
    line(0,0,width,0+i);
    line(width,height,0,height-i);
  }
    
    for (int g = 0; g < 100; g++)  {
    strokeWeight(5);
    stroke(255);
    line(0,0,width+g,height+g);
    line(0,0,width,0+g);
    line(width,height,0,height-g);
    
    }
    

  
      float Width = width;
  rotation = (5*mouseX / Width);
  println(rotation);
  
  translate(width/2, height/2); // green square  
  rotate(rotation);
  rect(0,0,squareWidth,squareHeight);
  
  translate((width/2)-400, height/2);
  rect(0,0,0.5*squareWidth,0.5*squareHeight);
  translate((width/2)-500, height/2);
  rect(0,0,0.5*squareWidth,0.5*squareHeight);
 
}
