
void setup(){
  size(400, 200);
  noStroke();
}
void draw(){
  background(200);
  int i = 0;
  while (i<400){
    fill(random (255)/3,random(255)/2,random(120,255));
    rect(i, 0, 5 + mouseX/18, 200);
    i = i + 20; 
    
    if(mousePressed&&(mouseButton==LEFT)){
      fill(random (120,255),random(255)/2,random(255/3));
      rect(i, 0, 5 + mouseX/18, 200);
      i = i + 10; 
      fill(random (255)/2,random(120,255),random(255/3));
      rect(i, 0, 10 + mouseX/9, 200);
      i = i + 10; 
    }
    
    if(mousePressed&&(mouseButton==RIGHT)){
      while (i<400){
        fill(random (255),random(255),random(255));
        rect(i, 0, 5 + mouseX/18, 200);
        i = i + 20; 
      }
    }
    
  }
}

