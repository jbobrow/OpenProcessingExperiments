
color[] pal;

//Editable vars
int decalMax = 7; // Max zoom
int timerMax =  100;
int timerSwitch = 20;// The point where the colors are changing


//Core variables. Global to be faster
int decal = 0;
int timer = 0;
boolean cwhat = false;
int i, j, k, l;
int x, y;
int shift = (1<< decal);
int delta = 1;


void setup() {
  pal = new color[4];
  pal[0] = #204631;
  pal[1] = #527f39;
  pal[2] = #aec440;
  pal[3] = #d7e894;
  size(256, 256);
  background(pal[0]);
}

void draw() {
  background(pal[0]);

  loadPixels();

  color c1, c2;
  if (timer > timerSwitch) {
   c1 = pal[int(((timerMax - timer) / (timerMax - timerSwitch)) * 4)];
   c2 = pal[int(((timerMax - timer) / (timerMax - timerSwitch)) * 2)];
  }
  else {
   c1 = pal[ 3 -int(((timerSwitch - timer) / timerSwitch) * 3)];
   c2 = pal[ 1 -int(((timerSwitch - timer) / timerSwitch) * 1)];
  }


  for (i = 0; i < 256/shift; i++) {
    for (j = 0; j < 256/shift; j++) {
      x =j * shift + int(shift/4);
      y =i * shift + int(shift/4);
      
      color cpix = cwhat? c1 : c2;
      for(k = 0; k < shift/2; ++k) 
        for(l = 0; l < shift/2; ++l) 
          pixels[(y + l) * 256 + x + k] = cpix;
      cwhat ^= true; 
    }
      cwhat ^= true; 
  }

  if (timer > 1) {
    --timer;
  } 
  else {
    timer = timerMax;
    decal += delta;
    delta = decal %decalMax == 0 ? -delta : delta;
    shift = (1<< decal);
  }
  
  updatePixels();
}



