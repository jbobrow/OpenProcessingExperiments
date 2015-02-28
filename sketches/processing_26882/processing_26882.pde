
float x = 2;
float y = 2;
float z = 2;
float a = 2;

void setup(){
  size(400,400);
  noLoop();
  background(0);
  noFill();
  noStroke();
  
  
}

void draw(){
  background(0);
  ellipse(200,200,x+=1.25,y+=1.25);
  fill(color(x,y-60,z+150,a+=2));
  
}


void mousePressed(){
loop();
}

void mouseReleased(){
noLoop();
}
                
                				
