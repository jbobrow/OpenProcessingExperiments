
import hypermedia.video.*;

OpenCV opencv;

final int w = 640;
final int h = 480;
final int PARTICLE_SIZE = 5;
final int MAX_FRAME = 10;

PImage baseImg = null;
ErasingParticles particles = null;
PImage img = null;

SceneManager sceneManager = new SceneManager();

void setup()
{
  size(w, h);

  opencv = new OpenCV(this);
  opencv.capture(w, h);
  
  sceneManager.add(new Scene(MAX_FRAME) {
    public void play(int frame)
    {
      image(baseImg, 0, 0);
      particles.draw(frame);
    }
  });
  
  sceneManager.add(new Scene(MAX_FRAME) {
    public void play(int frame)
    {
      image(baseImg, 0, 0);
    }
  });
  
  sceneManager.add(new Scene(MAX_FRAME) {
    public void play(int frame)
    {
      opencv.read();
      img = opencv.image();

      PImage baseAlphaImg = new PImage(w, h);
      colorMode(RGB, 255);
      for (int i = 0; i < w; i++) {
        for (int j = 0; j < h; j++) {
          int pos = j * w + i;
          color col = baseImg.pixels[pos];
          baseAlphaImg.pixels[pos] =
            color(
              col,
              (int)(255 - ((float)frame * 255 / frameLength))
            );
        }
      }
      img.blend(baseAlphaImg, 0, 0, w, h, 0, 0, w, h, BLEND);
      image(img, 0, 0);
    }
  }); 
}

void draw()
{
  background(0);
  
  if (sceneManager.isStarted()) {
    sceneManager.play();
  } else {
    opencv.read();
    img = opencv.image();
    image(img, 0, 0);
  }
  
  println(Integer.toString(sceneManager.nowScene()) + "," + Integer.toString(sceneManager.nowFrame()));
}

void mousePressed()
{
  if ((img != null) && (baseImg != null)) {
    particles = new ErasingParticles(img, baseImg, MAX_FRAME);
    sceneManager.start();
  }
}

void keyPressed()
{
  if (key == ENTER) {
    if (img != null) {
      baseImg = img;
    }
  }
}


