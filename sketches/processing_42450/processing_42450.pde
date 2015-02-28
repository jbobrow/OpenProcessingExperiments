
int [] button;
int [] timer;
int etapa = 0;
int tA = 0;
int tB = 0;
int tC = 0;

void traceBooleanSignal (int [] signal, int ypos, int amplitude, color c1) {
  stroke(c1);
  for (int i = 1; i < width; i++) {
    line(i, ypos+amplitude-signal[i]*amplitude, i, ypos+amplitude-signal[i-1]*amplitude);
  }
}

void updateBooleanSignal (int [] signal) {
  for (int i = 1; i < width; i++) {
    signal[i-1] = signal[i];
  }
}

void setup()
{
  size(400, 400);
  button = new int[width];
  for (int i = 1; i < width; i++) {
    button[i] = 0;
  }  
  timer = new int[width];
  for (int i = 1; i < width; i++) {
    timer[i] = 0;
  }
}

void draw ()
{
  background(0);

  if (mousePressed) {
    button[width-1] = 1;
  }
  else {
    button[width-1] = 0;
  }

  switch (etapa) {
  case 0:
    if (button[width-1] == 1) {
      etapa = 1;
    }
    timer[width-1] = 0;
    break;
  case 1:
    if (button[width-1] == 0) {
      etapa = 2;
    }
    timer[width-1] = 1;
    break;
  case 2:
    if (button[width-1] == 1) {
      etapa = 3;
    }
    timer[width-1] = 0;
    tA++;
    break;
  case 3:
    if (button[width-1] == 0) {
      etapa = 4;
    }
    timer[width-1] = 1;
    tB++;
    break;
  case 4:
    timer[width-1] = 0;
    tC++;
    if (tC>=tA) {
      tC=0;
      etapa=5;
    }
    break;
  case 5:
    timer[width-1] = 1;
    tC++;
    if (tC>=tB) {
      tC=0;
      etapa=4;
    }
    break;
  }

  print(etapa);

  updateBooleanSignal(button);
  traceBooleanSignal(button, 150, 40, color(255, 0, 0));
  updateBooleanSignal(timer);
  traceBooleanSignal(timer, 250, 40, color(0, 255, 0));
} 
