
void setup(){
size(300,300);
colorMode(RGB, 100,100,100);
frameRate(30);
background(100);
}

void draw(){
  for(int x = 0; x < 1; x+=1){
    strokeWeight(random(1,5));
    stroke(random(100),0,0);
    noFill();
    rect(-5,-5,random(width+10),height+10);
    rect(-5,-5, width+10, random(height+10)); 
    
    if (mousePressed == true){
      stroke(100);
      noFill();
      rect(-5,-5,random(width+10),height+10);
    x++;
    }
  }
   
}
    


