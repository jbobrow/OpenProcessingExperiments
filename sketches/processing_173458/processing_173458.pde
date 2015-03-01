
float xstart, xnoise, ystart, ynoise;

// 初期設定
void setup(){
    size(300,300);
    smooth();
    background(255);
    frameRate(24);
    xstart = random(10);
    ystart = random(10);
}

// ループ
void draw(){
    background(0);
    
    xstart+=0.01;
    ystart+=0.01;
    xnoise = xstart;
    ynoise = ystart;

    for(int y = 0; y <= height; y+=5){
      ynoise+=0.1;
      xnoise = xstart;
      
      for(int x = 0; x<=width; x+=5){
        xnoise += 0.1;
        drawPoint( x,  y, noise(xnoise,ynoise));
      }
    }
}

void drawPoint(float x, float y, float noiseFactor){
    pushMatrix();
    translate(x, y);
    rotate(noiseFactor * radians(540));

    float edgeSize = noiseFactor * 35;
    float grey = 150 + (noiseFactor*120);
    float alph = 150 + (noiseFactor*120);
    noStroke();
    fill(grey,alph);
    ellipse(0,0,edgeSize,edgeSize/2);
    // float len = 10 * noiseFactor;
    // rect(x, y, len, len);
    popMatrix();
}




