
int player_x = 0;
int player_y = 380;

void setup() {
  size(400, 400);
  frameRate(60);
  noStroke();
}

void draw() {
  background(0);
  fill(0, 255, 0);
  rect(0, 390, 400, 10);
  fill(255, 255, 255);
  rect(player_x, player_y, 10, 10);
  if(keyPressed) {
    if (key == 'a' || key == 'A') {
      player_x--;
    }
    if(keyPressed) {
      if (key == 'd' || key == 'D') {
        player_x++;
      }
      if(keyPressed) {
        if (key == 'w' || key == 'W') {
          player_y--;
        }
        if(keyPressed) {
          if (key == 's' || key == 'S') {
            player_y++;
          }
          if(player_y > 380) {
            player_y = 380;
          }
        }
      }
    }
  }
}

