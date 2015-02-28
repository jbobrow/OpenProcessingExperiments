
void setup (){
  size(400,400);
  colorMode(HSB,100);
}

void Square (float a, float b, float c, float d){
  rectMode(CENTER);
  stroke(d);
  strokeWeight(random(1,6));
  fill(random(0,100),a,random(0,100));
  rect(a,b,c,d);
  
}

void draw (){
  for(int x = 25; x < width -10; x+=width/8){
  for(int y = 25; y < height -10; y+=height/8){
 
  Square(x,y,random(0,height/10), random(0,width/10));
}
  }
}

