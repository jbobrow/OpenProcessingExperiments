
/*@pjs preload="dior.jpg, birds.jpg;*/
PImage dior;
PImage birds;
float angle = 0.0;

void setup(){
  size(600,400);
  frameRate(30);
  dior = loadImage("dior.jpg");
  birds = loadImage("birds.jpg");
  dior.filter(BLUR, 5);
  dior.blend(birds, 260, 0, 500, 900, 260, 0, 500, 900, SUBTRACT);
}

void draw(){
 image(dior, 0, 0, width, height); 
  
  noStroke();
 
  fill(50,100);
  
  for(int y = 20; y < 600; y+= 90){
    for(int x = 30; x < 600; x+= 90){
      ellipse(x, y, 50, 50);
    }
  }
  
  stroke(0);
  for(int y = 20; y < 600; y+=90){
     for(int x = 30; x < 600; x+=90){
       line(x, y, x+50, y+50);
     }
  }
  
  for(int y = 20; y < 600; y+=90){
     for(int x = 30; x < 600; x+=90){
       line(x+50, y, x, y+50);
     }
  }  
  
  translate(width/2,height/2);
  
  noStroke();
  fill(0,100,50,100); 
  
  angle +=0.1;
  float move = sin(angle);
  
  rotate(move); 
  
  rectMode(CENTER);
  rect(0,0,200,200);
}



