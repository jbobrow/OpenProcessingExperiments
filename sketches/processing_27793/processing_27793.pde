
class Ball {
  int diam=16;
  int h=diam;
  int w=diam;
  float x=mouseX;
  float y=mouseY;
  float gravity=1;
  float floorNum =height-(diam/2);
  float velY=1;
  float velX=3;
  float[] xpos = new float[50];
  float[] ypos = new float[50];
  float[] opaq = new float[255];

  ArrayList<AudioPlayer> players = new ArrayList();

  void drawBall() {
    // Remove any audio players which have finished playing.
    for (int i = 0; i < players.size(); i++) {
      AudioPlayer p = players.get(i);
      if (!p.isPlaying()) {
        p.close();
      }
      players.remove(p);
      i -= 1;
    }
    for (int i = 0; i < xpos.length - 1; i++) {
      xpos [i]= xpos [i + 1];
      ypos [i]= ypos [i + 1];
    }
    xpos [xpos.length - 1] = x;
    ypos [ypos.length - 1] = y;

    for (int i = 0; i < xpos.length; i++) {
      if (xpos[i] != 0) {
      noStroke ();
      fill (255 - i, 255, 0, 200);
      ellipse (xpos [i], ypos [i], i / 2, i / 2);
      }
    }
    
    if (x > width + 40) {
      if (players.isEmpty()) {
        balls.remove(this);
      }
    }

    ellipseMode(CENTER);
    stroke(0,0,255);
    fill(0);
    ellipse(x,y,diam,diam);
    velY = velY+gravity;
    y =y+velY;
    x =x+velX;

    if (x <= width + diam / 2 && y > height + 5) {
      play();

      velY = -velY / 1.1;
      y = height;
    }
  }

  void play() {
    AudioPlayer player = null;

    for (int i = 0; i < range.length; i++) {
      // If the value falls within the range:
      if (velY >= range[i]) {
        // Add the right sound to the list of players...
        players.add(player = m.loadFile(sounds[i] + ".wav"));
        // And stop looping.
        break;
      }
    }
    player.play();
  }
}


