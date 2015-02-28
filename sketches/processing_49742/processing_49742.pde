
int gridres = 32, oldgridres = 0;
float[][] input;
boolean fill = true;

void setup() {
  size(512,512);
  frameRate(30);
  
  strokeJoin(BEVEL);
  stroke(255,255,0);
  noFill();
}

void draw() {
  if(gridres != oldgridres) {
    input = new float[gridres][gridres];
    oldgridres = gridres;
  }
  
  for(int k=0;k<gridres;k++)for(int j=0;j<gridres;j++)
    input[j][k] = noise((float)j/gridres*2,(float)k/gridres*2,frameCount/120f);
    
  background(63);
  scale(512f/gridres);
  translate(0.5,0.5);
  strokeWeight(gridres/512f);
    
  for(int k=0;k<gridres-1;k++)for(int j=0;j<gridres-1;j++){
    float a = input[j][k], b = input[j+1][k],
      c = input[j][k+1], d = input[j+1][k+1];
      
    if(a < 0.5 && b < 0.5 && c < 0.5 && d < 0.5 && fill) continue;
    float ab = (0.5 - a) / (b - a),
      cd = (0.5 - c) / (d - c),
      ac = (0.5 - a) / (c - a),
      bd = (0.5 - b) / (d - b);

    beginShape();
      if(a < 0.5) vertex(j,k);
      if(ab > 0 && ab < 1) vertex(j+ab,k);
      if(b < 0.5) vertex(j+1,k);
      if(bd > 0 && bd < 1) vertex(j+1,k+bd);
      if(d < 0.5) vertex(j+1,k+1);
      if(cd > 0 && cd < 1) vertex(j+cd,k+1);
      if(c < 0.5) vertex(j,k+1);
      if(ac > 0 && ac < 1) vertex(j,k+ac);
    endShape(CLOSE);
  }
}
                
void keyPressed() {
  if(key == 'f') fill ^= true;
  if(key == '-') gridres = max(gridres-1, 2);
  if(key == '=') gridres++;
}
                                                
