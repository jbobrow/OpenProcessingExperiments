
Maxim maxim;
AudioPlayer player;
AudioPlayer player2;
float counter;
float volumeVar;
void setup()
{
  size(768, 1024);
  counter = 0;
  volumeVar = 1;
  maxim = new Maxim(this);
  player = maxim.loadFile("f.wav");
  player.setLooping(true);
  player2 = maxim.loadFile("g.wav");
  player2.setLooping(true);
  player2.volume(volumeVar);
  player.volume(volumeVar);
  background(0);
  rectMode(CENTER); 
//  frameRate(5);
}

void draw()
{
  noStroke();
  fill(0, 10);
  rect(width/2, height/2, width, height);
  
  if (volumeVar > 0)
    {
      volumeVar = volumeVar * .995;
      player.volume(volumeVar);
      player2.volume(volumeVar);
    }
//    println(frameRate);
}

void mouseDragged()
//void draw()
{
    counter++;
    if (counter == 1000)
    { counter = 0; }
    player.play();
    player2.play();
    float red = map(mouseX, 0, width, 0, 255);
    // get distance btw mouse and screen center
    float blue = map(mouseY, 0, width, 0, 255);
    float green = dist(mouseX, mouseY, width/2, height/2);
  
    float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
    float alpha = map(speed, 0, 20, 0, 10);
    
    if (speed > 15)
    { speed = 15; }
    float lineWidth = map(speed, 0, 15, 1, 7);
    //lineWidth = constrain(lineWidth, 1, 10);
  
    noStroke();
    fill(0, 12);
    rect(width/2, height/2, width, height);
  
    stroke(red, green, blue, 255);
    strokeWeight(lineWidth);
  
    line(pmouseX, pmouseY, mouseX, mouseY);
    line(width/2+((width/2)-pmouseX),pmouseY,width/2+((width/2)-mouseX),mouseY);
  
  
    strokeWeight(2);
    float size = map(speed, 0, 15, 10, 120);
    boolean switchShape = false;
    if (counter % 50 == 0)
    {
      strokeWeight(10);
      size = size + 40;
      switchShape = true;
    }
    if (((mouseX > width/2) && !(switchShape)) || ((mouseX < width/2) && (switchShape)))
    {
      ellipse(mouseX,mouseY, size, size);
      ellipse(width/2+((width/2)-pmouseX),pmouseY, size, size);
    }
    else
    {
      rect(pmouseX, pmouseY, size, size);
      rect(width/2+((width/2)-pmouseX), pmouseY, size, size);
    }

    if (volumeVar < .99)
    {
      volumeVar = volumeVar * map(speed, 0, 10, 1, 1.1);
      if (volumeVar > 1)
      {
        volumeVar = 1;
      }
      if (volumeVar < .01)
      {
        volumeVar = .01;
      }
    }
    else
    {
      volumeVar = 1;
    }
    player.volume(volumeVar);
    player2.volume(volumeVar);
    
    player.speed((float) map(mouseY, 0, height, 0.5, 1.5));
    player2.setFilter(map(mouseX,-10,width,50,10000),0);
    //player2.speed((float) map(mouseY, 0, height, 0.5, 1.5));
}


