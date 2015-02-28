
int randomosity = 30000;
int selfcalc = 0;
int longness = 256;
int smoothness = 390;
int gen = 1;
float[][] data = new float[longness + 1][longness + 1];
int X;
int Y;
int Z;
int colorness;
void setup() {
  size(600, 500, P3D);
  background(0, 0, 0);
  strokeWeight(1);
  strokeCap(ROUND);
  camera(-840, -840, 600, longness * 500, longness * 500, 0, 0.0, 0.0, -1.0);
}
void draw() {
  if(keyPressed) {
    if (key == 'b') {
      filter(BLUR, 1);
    }else if (key == 's') {
      for(int a = 1; a < longness - 1; a++) {
        for(int b = 1; b < longness - 1; b++) {
          data[a][b] = (data[a][b+1] + data[a+1][b] + data[a][b-1] + data[a-1][b]) / 4.01;
        }
      }
    }else{
    gen = 1;
    for(int g = 1; g < longness; g++) {
    for(int f = 1; f < longness; f++) {
      data[g][f] = random(-250, 250);
    }
  }
  for(int a = 0; a < smoothness; a++) {
    for(int b = 1; b < longness; b++) {
      for(int c = 1; c < longness; c++) {
        data[b][c] = (((data[b + 1][c] + data[b][c + 1] + data[b - 1][c] + data[b][c - 1]) + (selfcalc * data[b][c]))  /  (4 + selfcalc)) + random(0-random(randomosity / gen), random(randomosity / gen));
      }
    }
    gen++;
for(int b = 1; b < longness; b++) {
      for(int c = 1; c < longness; c++) {
        data[b][c] = (((data[b + 1][c] + data[b][c + 1] + data[b - 1][c] + data[b][c - 1]) + (selfcalc * data[b][c]))  /  (4 + selfcalc));
      }
    }  
  }
}
}
  background(0);
  for(int d = 1; d < longness; d++) {
    for(int e = 1; e < longness; e++) {
      stroke(data[d][e], (data[d][e]/2)+ 160, (data[d][e] * 2));
      line(d * 10, e * 10, data[d][e], (d - 1) * 10, (e + 1) * 10, data[d - 1][e + 1]); 
    }
  }
}

