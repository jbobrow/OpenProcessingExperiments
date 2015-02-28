
void setup() {
size (400,400);
}

void draw() {
  if(mouseX <50 || mouseY <350){
    
    background(255,255,255,255);
    rect(350,350,20,20);
    ellipse (random(400),random(400),50,50);
    ellipse (random(400),random(400),30,30);
    ellipse (random(400),random(400),10,10);
    stroke(400, random(255),random(255),400);
    fill(random(255),random(255),random(255),255);
   
 
  } else{
    background(255,255,0,255);
    rect(0,random(400),100,400);
    rect(100,random(400),100,400);
    rect(200,random(400),100,400);
    rect(300,random(400),100,400);
    stroke(400,random(400),100,400);
    
    fill(random(255),random(255),random(255),255);
  }}

    

