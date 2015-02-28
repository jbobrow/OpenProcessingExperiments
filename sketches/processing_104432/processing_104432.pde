
Maxim maxim;
AudioPlayer player;
AudioPlayer player2;


void setup()
{
  size(768, 1024);
  maxim = new Maxim(this);
  player = maxim.loadFile("amenbreaktone.mp3");
  player.setLooping(true);
  player2 = maxim.loadFile("susurration.mp3");
  player2.setLooping(true);
  player.volume(0.5);
  background(0);
  rectMode(CENTER);

}

void mouseDragged()
{
  player.play();
  player2.play();
  
  float red = map(mouseX, 0, width, 0, 255);
  float blue = map(mouseY, 0, width, 0, 255);
  float green = dist(mouseX,mouseY,width/2,height/2);
  
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 20, 0, 5);
  float lineWidth = map(speed, 0, 10, 10, 1);
  lineWidth = constrain(lineWidth, 0, 10);
  
  rect(width/2, height/2, width, height);
  
  stroke(red, green, blue, 255);
  strokeWeight(lineWidth);
  
  if ((mouseX < 384) && (mouseY < 512)) {
    brush1(mouseX, mouseY,speed, speed,lineWidth);
    fill(0, alpha);
  }
  
  if ((mouseX > 384) && (mouseY < 512)) {
    brush2(mouseX, mouseY,speed, speed,lineWidth);
    fill(0, alpha);
    noStroke();
  }
  
  if ((mouseX < 384) && (mouseY > 512)) {
    brush3(mouseX, mouseY,speed, speed,lineWidth);
    noStroke();
  }
  
  if ((mouseX > 384) && (mouseY > 512)) {
    brush4(mouseX, mouseY,speed, speed,lineWidth);
    fill(0, alpha);
    noStroke();
  }

  player.setFilter(map(mouseY,0,height,50,5000),10);
  player2.ramp(1.,1000);
  player2.speed((float) mouseX/width/3);
}

void mouseReleased()
{
  player2.ramp(0.,2000);
}
void brush1(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  ellipse(random(768),random(1024),px,py); 
  
  return;
}


void brush2(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  line(random(768), random(1024), random(768), random(1024));
  return;
}

void brush3(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  pushMatrix();
  translate(x,y);
  rotate(random(px));
  line(0+random(100),0+random(100),0,0);
  rotate(random(px));
  ellipse(px,py,random(100),random(100));
  rotate(random(px));
  rect(px,py,random(100),random(100));
  popMatrix();

  return;
}

void brush4(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(px,py,x,y);
  line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  line(px,height/2+((height/2)-py),x,height/2+((height/2)-y));
  line(width/2+((width/2)-px),height/2+((height/2)-py),width/2+((width/2)-x),height/2+((height/2)-y));
  return;
}


