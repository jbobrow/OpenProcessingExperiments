
int spin;
int direction;
float speed;
Maxim maxim;
AudioPlayer player;
float power=0;
float threshold = 0.35;// vary this until the square appears on the beats
int wait = 0;

void setup(){
  size(400, 400);
  background(0);
  maxim = new Maxim(this);
  player = maxim.loadFile("beat1.wav");
  spin = 0;
  direction = 1;
  speed = 1;
  player.setLooping(true);
  player.setAnalysing(true);
}

void mousePressed(){
  direction = -direction;
}

void draw(){
  player.play();
  speed = dist(mouseX, mouseY, width/2, height/2);
  player.speed(2 - map(speed, 0, 300, 0, 2));
  power = player.getAveragePower(); 
  
  spin += (20 - map(speed, 0, 300, 0, 20)) * direction;
//  rotate(radians(spin));
  
  translate(width/2, height/2);
  rotate(radians(spin));
  scale(map(dist(mouseX, mouseY, width/2, height/2), 0, 300, 0.3, 0.8) + power);
//  rotate(radians(mouseX));
  translate(-width/2, -height/2);
  background(0);
//  scale(map((float)mouseY, 0, 400, 0.5, 1.0));
  
  strokeWeight(5);
  fill(0);
//stroke(255 - dist(mouseX, mouseY, width/2, height/2), mouseX/2, mouseY/2);
  stroke(255 * power, 0, 255 - (255*power));
  rect(50, 50, 100, 100);
  rect(250, 50, 100, 100);
  rect(50, 250, 100, 100);
  rect(250, 250, 100, 100);
  
  translate(width/2, height/2);
  rotate(radians(spin + 45));
  scale(map(dist(mouseX, mouseY, width/2, height/2), 0, 300, 0.2, 1.0));
//  rotate(radians(mouseX));
  translate(-width/2, -height/2);

//  scale(map((float)mouseY, 0, 400, 0.5, 1.0));
  
  strokeWeight(5);
  fill(0);
  stroke(255 - dist(mouseX, mouseY, width/2, height/2), mouseY/2, mouseX/2);
  rect(50, 50, 100, 100);
  rect(250, 50, 100, 100);
  rect(50, 250, 100, 100);
  rect(250, 250, 100, 100);
  
  
}


