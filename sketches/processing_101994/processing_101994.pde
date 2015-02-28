
Maxim maxim;
AudioPlayer player;
AudioPlayer player2;
float[] spec;
boolean playit;
int spacing, hspacing, vspacing;


void setup()
{
  size(1024, 768);
  maxim = new Maxim(this);
  player = maxim.loadFile("13 End Crawl.mp3");
  player.setAnalysing(true);
  player.setLooping(true);
  player2 = maxim.loadFile("bells.mp3");
  player2.setLooping(true);
  background(255);
  playit = true;
  hspacing = 10;
  vspacing = 10;
  smooth();

}

void draw()
{
  colorMode(HSB);

  fill(0, 0, 255, 35);
  rect(0,0, width, height);

  //  noStroke();
  float measure = abs(map(dist(mouseX, mouseY, pmouseX, pmouseY), 0, 1000, 1, 1000));
  strokeWeight(measure);
  colorMode(RGB);
  stroke(255, 255, 255, 100);
  //line(mouseX, mouseY, pmouseX, pmouseY);
  curve(mouseX, mouseY, mouseX, mouseY, pmouseX, pmouseY, pmouseX, pmouseY);
  noStroke();

  colorMode(HSB);
  // if (playit) {
  player.play();

  spec = player.getPowerSpectrum();

/*
  if (spec!=null) {

    for (int i=0; i< spec.length; i+=hspacing) {

      float vMin = -300.0;
      float vMax = 200.0;

    float hPos = map(i, 0, spec.length, 0, width);
     float hPosP = map(i+hspacing, 0, spec.length, 0, width);
      float vPos = map(spec[i], vMin, vMax, 0, height);
      float vPosP = map(spec[i+hspacing], vMin, vMax, 0, height);
      float hue = map(i, 0, spec.length, 0, 360);


      float sat = map(spec[i], -200, 200, 0, 125);
      float bri = map(vPos, 0, height, 255, 0);

      strokeWeight(1);
      stroke(100, 0, 50);
      strokeWeight(2);
      stroke(hue, 152, bri, 50);

      strokeCap(ROUND);
      strokeWeight(round(5 * (hspacing/10)));

      point(hPos, vPos - vspacing);
      strokeWeight(round(4 * (hspacing/10)));
      point(hPos, vPos + vspacing);
      strokeWeight(round(3 * (hspacing/10)));
      point(hPos, vPos + 3 * vspacing);
      strokeWeight(round(2 * (hspacing/10)));
      point(hPos, vPos + 5 * vspacing);

      strokeCap(SQUARE);
      strokeWeight(1);
      line(hPos, vPos - vspacing, hPos, vPos + 5 * vspacing);
      float hOut = hPos + (hPos - width/2);
      float vOut = 0.0;
      line(hPos, vPos - vspacing, hOut, 0);
      line(hPos, vPos + 5 * vspacing, hOut, height);
      strokeWeight(2);
      if (spec[i+hspacing] != null) {
        line(hPos, vPos + 5 * vspacing, hPosP, vPosP + 5 * vspacing);
        line(hPos, vPos + 3 * vspacing, hPosP, vPosP + 3 * vspacing);
        line(hPos, vPos +  vspacing, hPosP, vPosP + vspacing);
        line(hPos, vPos -  vspacing, hPosP, vPosP - vspacing);
      }
 
    }
    
 
  }
   */

  // println(vspacing);
}
void mouseDragged() {
  hspacing = round(map(mouseX, 0, width, 10, 50));
  vspacing = round(map(mouseY, 0, height, 10, 50));
  //player.speed(map(mouseX,0,width,1,2));
 // player.setFilter(map(mouseX, 0, width, 256, 2048), map(mouseY, 0, width, 0, 1));


  //player2.play();

}
void mousePressed() {
 playit = true;
 // player.play();
 // player2.ramp(1.,1000);
//  player2.speed((float) mouseX/width/2);
  
}

void mouseReleased() {

 // player2.ramp(0.,1000);

        
}
