
PImage swings;

void setup(){
  size(600,450);
  noStroke();
  swings = loadImage("swings.jpg");
}

void draw(){
  image(swings,0,0);
  
  for(int i = 0; i < 10000; i++){
    int x = int(random(width));
    int y = int(random(height));
      
    
  color cp = get(mouseX,mouseY);
  float r = red(cp);
  float g = green(cp);
  float b = blue(cp);
  
  if(b > 100){
      noStroke();
      fill(random(255),255,(255));
      ellipse(x,y,random(5),random(5));
  
  println(r);
  fill(r,g,b);
  rect(mouseX,mouseY,30,30);
}

  }
}


