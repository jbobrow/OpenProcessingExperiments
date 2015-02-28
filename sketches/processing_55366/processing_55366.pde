
void drawbar() {
  for (int j = 0; j < brmax ; j++) {
    rect(0, bars[j], width, baryh);
    fill(255);
    bars[j] ++;
    if (bars[j] >= height) {
      bars[j] = 0;
    }
  }
}


