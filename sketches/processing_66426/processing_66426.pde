
void loadSettings(int i) {
  try {
    lastMCx=settings[i][0];
    lastMCy=settings[i][1];
    vt=settings[i][2];
    color_start=settings[i][3];
    color_range=settings[i][4];
    ringsize=settings[i][5];
  }
  catch(ArrayIndexOutOfBoundsException e) {
  }
}


