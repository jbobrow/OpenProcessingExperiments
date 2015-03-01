
//Nick Kreuter
//DMS 110
//Hw 4
//2.2.15

int y;
float r,g,b,rd;

void setup(){
  //executed only once
  size(200,200);//Block size
  frameRate(45);// frames per second (speed)
}

void draw(){ 
  //executed every frame
  background(255);
  strokeWeight(.5);
  stroke(0);
  line(0,height/3,width,height/3);
  line(0,height/3*2,width,height/3*2);
 
  fill(255,0,0);//color of small box
 if(mouseY < height/3){
   fill(255,0,0);
  rect(width/3,0,width/3,height/3);
 } else if(mouseY < height*2/3 && mouseY >height/3){
   fill(255,255,0);
   rect(width/3,height/3,width/3,height/3);
}else if(mouseY < height && mouseY > height*2/3){
  fill(0,255,0);
  rect(width/3,height/3*2,width/3,height/3);
}
}
 void keyPressed(){
   r = random(255);
   g = random(255);
   b = random(255);
   rd = 5;
}

