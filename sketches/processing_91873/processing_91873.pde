
final static color SKY1 = #D6561A;
final static color SKY2 = #239DF7;
final static color SUN = #F7BF43;
final static color SEA = #3980F7;
final static color WAVE1 = #FA291E;
final static color WAVE2 = #5592F7;
final static color SPARKLE = #C0C0FF;

final static int WAVE_INTV = 2500;
final static double WAVE_SPEED = .12;

ArrayList waves1 = new ArrayList();
ArrayList waves2 = new ArrayList();
ArrayList sparkles = new ArrayList();
boolean visible = false;

void setup() {
  size(480, 640);
  noStroke();

  for (int i = 0; i < 5000; i++) {
    draw();
    frameCount++;
  }

  visible = true;
  draw();
  frameCount++;
}


void draw() {
  background(SEA);

  if (frameCount%((WAVE_INTV * 60) / 1000) == 0) {
    waves2.add(new Wave(WAVE2, 160, 400, 580, .08, .025));
  }

  if (frameCount%((WAVE_INTV * 60) / 1000) == 0) {
    waves1.add(new Wave(WAVE1, 140, 400, 300, .2, .1));
  }

  for (int i = 0; i < waves2.size(); i++) {
    Wave wave2 = (Wave)waves2.get(i);
    wave2.drawWave();

    if (wave2.waveHeight > height + 999 || wave2.waveBend < 20 || wave2.waveWidth < 0) {
      waves2.remove(wave2);
      i--;
    }
  }

  double rand = random(0, 1);

  if (rand > .98) {
    double randX = random(0, 1);
    double randY = random(0, 1);
    sparkles.add(new Sparkle(width * randX, (height * .3) + (height * .7 * randY)));
  }

  for (int i = 0; i < sparkles.size(); i++) {
    Sparkle sparkle = (Sparkle)sparkles.get(i);
    sparkle.drawSparkle();

    if (sparkle.sparkleWidth <= 0 || sparkle.sparkleHeight <= 0) {
      sparkles.remove(sparkle);
      i--;
    }
  }

  for (int i = 0; i < waves1.size(); i++) {
    Wave wave = (Wave)waves1.get(i);
    wave.drawWave();

    if (wave.waveHeight > height + 300|| wave.waveBend < 20 || wave.waveWidth < 0) {
      waves1.remove(wave);
      i--;
    }
  }

  fill(SKY1);
  rect(0, 0, width, height * .3);
  
  fill(SUN);
  arc(width / 2, height * .25, 200, 190, PI * .89, PI * 2.11);
  triangle(width / 2, height * .2, 146, height * .3, 334, height * .3);
}

// unused
void drawSky() { 
  if (visible) {
    for (int i = 0; i <= height * .3; i++) {
      double inter = i / (height * .3);
      stroke(lerpColor(SKY1, SKY2, inter));
      line(0, i, width, i);
    }
  }
}

class Wave {  
  color waveColor;

  double waveHeight;
  double waveBend;
  double waveWidth;

  double fade;
  double shrinkage;

  Wave(color waveColor, double waveHeight, double waveBend, double waveWidth, double fade, double shrinkage) {
    this.waveColor = waveColor;

    this.waveHeight = waveHeight;
    this.waveBend = waveBend;
    this.waveWidth = waveWidth;

    this.fade = fade;
    this.shrinkage = shrinkage;
  }

  void drawWave() {
    fill(waveColor);
    double waveStart = (width - waveWidth) / 2;

    if (visible) {
      curve(0, waveHeight - waveBend, waveStart, waveHeight, waveStart + waveWidth, waveHeight, width, waveHeight - waveBend);
      curve(0, waveHeight + (waveBend * .5), waveStart, waveHeight, waveStart + waveWidth, waveHeight, width, waveHeight + (waveBend * .5));

      if (waveBend > 20) {
        stroke(waveColor);
        line(waveStart + 10, waveHeight - 1, waveStart + waveWidth - 10, waveHeight - 1);
        line(waveStart + 10, waveHeight, waveStart + waveWidth - 10, waveHeight);
        noStroke();
      }
    }

    waveHeight += WAVE_SPEED;
    waveBend -= fade;
    waveWidth -= shrinkage;
  }
}

class Sparkle {
  double posX;
  double posY;

  double sparkleWidth;
  double sparkleHeight;

  final static double MAX_LIFE = 50;
  final static double GROWTH = .12;
  double lifetime;

  Sparkle(double posX, double posY) {
    this.posX = posX;
    this.posY = posY;

    sparkleWidth = 0;
    sparkleHeight = 0;

    lifetime = MAX_LIFE;
  }

  void drawSparkle() {
    double phase = lifetime / MAX_LIFE;

    if (phase > .4) {
      sparkleWidth += GROWTH;
      sparkleHeight += GROWTH;
    } 
    else {
      sparkleWidth -= GROWTH;
      sparkleHeight -= GROWTH;
    }

    fill(SPARKLE);
    pushMatrix();
    translate(posX, posY);
    rotate(QUARTER_PI);
    rect(0, 0, sparkleWidth, sparkleHeight);
    popMatrix();

    posY += WAVE_SPEED;
    lifetime--;
  }
}


