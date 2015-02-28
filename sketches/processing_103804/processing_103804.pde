
Maxim maxim;
AudioPlayer player;
 
void setup(){
  maxim = new Maxim(this);
  player = maxim.loadFile("s.wav");
  player.setLooping(true);
  size(600, 600);
  background(0,0,0);
  loop();
  player.volume(3);
}
 
void draw(){
  s();
  stroke(0, 0, 0, 20);
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);
}
 
void mouseDragged(){
  float red = map(mouseX, 0, width, 0, 255);
  float green = map(mouseY, 0, height, 0, 255);
  float blue = map(mouseX - mouseY, 0-height, width, 0, 255);
  stroke(red, green, blue);
    
  b1();
  b2();
 
  player.speed(map((float)mouseX, 0, width, 0, sqrt(2.0)) * map((float)mouseY, 0, height, 0, sqrt(2.0)));
   
  loop();
}
 
void mousePressed(){
  player.play();
}
 
void mouseReleased(){
  player.stop();
}
 
void s(){
  if(height != window.innerHeight || width != window.innerWidth){
    //size(window.innerWidth, window.innerHeight);
  }
}
 
void b(){
  if(brush >= 3){
    brush = 0;
  }
   
  if(brush == 0){
    b1();
  }
  else if(brush == 1){
    b2();
  }
   
  else if(brush == 2){
    b3();
  }
}
 
void b1(){
  line(pmouseX, pmouseY, mouseX, mouseY);
  line(width/2+((width/2)-pmouseX),pmouseY,width/2+((width/2)-mouseX),mouseY);
  line(width/2+((width/2)-pmouseX),height/2+((height/2)-pmouseY),width/2+((width/2)-mouseX),height/2+((height/2)-mouseY));
  line(pmouseX,height/2+((height/2)-pmouseY),mouseX,height/2+((height/2)-mouseY));
 
  line(map(pmouseY, 0, height, 0, width), map(pmouseX, 0, width, 0, height), map(mouseY, 0, height, 0, width), map(mouseX, 0, width, 0, height));
  line(width/2+((width/2)-map(pmouseY, 0, height, 0, width)),map(pmouseX, 0, width, 0, height),width/2+((width/2)-map(mouseY, 0, height, 0, width)),map(mouseX, 0, width, 0, height));
  line(width/2+((width/2)-map(pmouseY, 0, height, 0, width)),height/2+((height/2)-map(pmouseX, 0, width, 0, height)),width/2+((width/2)-map(mouseY, 0, height, 0, width)),height/2+((height/2)-map(mouseX, 0, width, 0, height)));
  line(map(pmouseY, 0, height, 0, width),height/2+((height/2)-map(pmouseX, 0, width, 0, height)),map(mouseY, 0, height, 0, width),height/2+((height/2)-map(mouseX, 0, width, 0, height)));
}
 
void b2(){
  fill(0,0,0,0);
  int x = (int)random()*40-20;
  int y = (int)random()*40-20;
  if(int(random()*3) == 1){
    ellipse(mouseX+x, mouseY+y, 5, 5);
    ellipse(width/2+((width/2)-mouseX)+x,mouseY+y, 5, 5);
    ellipse(width/2+((width/2)-mouseX)+x,height/2+((height/2)-mouseY)+y, 5, 5);
    ellipse(mouseX+x,height/2+((height/2)-mouseY)+y, 5, 5);
     
    ellipse(map(mouseY, 0, height, 0, width)+x, map(mouseX, 0, width, 0, height)+y, 5, 5);
    ellipse(width/2+((width/2)-map(mouseY, 0, height, 0, width))+x,map(mouseX, 0, width, 0, height)+y, 5, 5);
    ellipse(width/2+((width/2)-map(mouseY, 0, height, 0, width))+x,height/2+((height/2)-map(mouseX, 0, width, 0, height))+y, 5, 5);
    ellipse(map(mouseY, 0, height, 0, width)+x,height/2+((height/2)-map(mouseX, 0, width, 0, height))+y, 5, 5);
  }
}
