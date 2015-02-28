
Maxim maxim;
AudioPlayer player;
AudioPlayer player2;
int brushNumber;
int maxBrushes = 8;

void setup()
{
  size(640, 960);
  maxim = new Maxim(this);
  player = maxim.loadFile("atmos1.wav");
  player.setLooping(true);
  player2 = maxim.loadFile("bells.wav");
  player2.setLooping(true);
  player.volume(0.25);
  background(0);
  rectMode(CENTER);
}

void draw()
{
  //
}

void mouseDragged()
{
  player.play();
  player2.play();
  float red = map(mouseX, 0, width, 0, 255);
  float blue = map(mouseY, 0, width, 0, 255);
  float green = dist(mouseX, mouseY, width/2, height/2);

  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 20, 0, 10);
  //println(alpha);
  float lineWidth = map(speed, 0, 10, 10, 1);
  lineWidth = constrain(lineWidth, 0, 10);

  noStroke();
  fill(0, alpha);
  rect(width/2, height/2, width, height);

  stroke(red, green, blue, 255);
  strokeWeight(lineWidth);

  switch(brushNumber) {
  case 0: 
    rect(mouseX, mouseY, speed, speed);
    break;
  case 1:
    line(pmouseX, pmouseY, mouseX, mouseY);
    break;
  case 2:
    brush1(mouseX, mouseY, speed, speed, lineWidth);
    break;
  case 3:
    brush2(mouseX, mouseY, speed, speed, lineWidth);
    break;
  case 4:
    brush3(mouseX, mouseY, speed, speed, lineWidth);
    break;
  case 5:
    brush4(pmouseX, pmouseY, mouseX, mouseY, lineWidth);
    break;
  case 6:
    brush5(pmouseX, pmouseY, mouseX, mouseY, lineWidth);
    break;
  case 7:
    brush6(mouseX, mouseY, speed, speed, lineWidth);
    break;
  case 8:
    brush7(pmouseX, pmouseY, mouseX, mouseY, lineWidth);
    break;
  }

  player.setFilter((float) mouseY/height*5000, mouseX / width);
  //player2.setFilter((float) mouseY/height*5000,mouseX / width);

  player2.ramp(1., 1000);
  player2.speed((float) mouseX/width/2);
}

void mouseReleased()
{
  //println("rel");
  player2.ramp(0., 1000);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      //next brush
      brushNumber += 1;
      //if we've reached the end of the list go back to brush 0
      if (brushNumber > maxBrushes) { 
        brushNumber = 0;
      }
    } 
    else if (keyCode == DOWN) {
      //previous brush
      brushNumber += 1;
      //if we've reached the beginning of the list go back to brush 7
      if (brushNumber < 0) { 
        brushNumber = maxBrushes;
      }
    }
  } 
}
