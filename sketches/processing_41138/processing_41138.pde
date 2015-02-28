
float timer1 = 120;

void loadingpage() {
  song.pause();
  background(#030303);
  timer1 -= 1;
  if (timer1 < 0) {
    startScreen = false;
    gameStart = true;
    loading = false;
    captMusic();
  }
}

