
Maxim maxim;
AudioPlayer player;

int posX, posY;
float time;        // used to make a pause before start of drawing figures

boolean playit;
float colour;

void setup() {
  size(640, 640);
  background(0);
  noStroke();
  maxim = new Maxim(this);
  player = maxim.loadFile("GJBR15138.wav");
  player.setLooping(true);
  player.volume(1.0);
  player.setAnalysing(true);
  //frameRate(60);
  playit = false;
  drag = false;
  colorMode(HSB, 360, 100, 100);
  time = 0.01;
}

void draw() {
  float radius = 100;
  if (playit) {
//    println(time);
    player.play();
//    spec = player.getPowerSpectrum();
    background(0); 
  }

  if (time > 1.0) {  // make appearance of initial ellipse soft
    int rand = random(-3, 3);  // random number to calculate trembling of the figures
    pushMatrix();
    for (int j=posY+10; j<=height; j+=3) {
      rotate(10/rand);
      translate(40*rand, 40*rand);
      fill(colour, 0.1*j, 0.05*j);
      ellipse(posX+rand, j+rand, 7/rand, 7/rand);
    }
    popMatrix();    

    for (int j=0; j<=height; j+=3) {
      fill(colour, 0.1*j, 0.05*j);
      ellipse(posX+rand, j+rand, 3, 3);      
    }    
    
    radius = map(player.getAveragePower(), 0, 1, 1, 10);
    for (float i=3; i>=1; i-=0.1) {
        fill(colour/i, 100/i, 50/i);
        ellipse(posX+rand/2, posY+rand/2, 30*radius*i, 30*radius*i);
    }
    
  }
  time += 0.01; 
}

void mousePressed() {
  playit = true;
  posX = mouseX;
  posY = mouseY;
  colour = int(random(0, 1) * 359 + 1); // each mouseclick, pick up a number in range (0, 360) to calculate hue in draw()
 
}


