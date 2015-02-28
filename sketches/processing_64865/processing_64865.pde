
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

/* in questo progetto ho pensato di sincronizzare il movimento di una sfera
 * lungo una circonferenza e sulla quale mantengo un segmento tangente, con
 * la musica di Danilo Rea che improvvisa al pianoforte su un pezzo
 * di JayDee del 1992. Il pezzo si intitola plastic dreams.
 * la sincronizzazione riguarda sia il movimento che i colori che variano 
 * in modo casuale basandosi sui metodi isKick() e isHat() del BeatListener delle librerie Minim
 * la scrollbar serve per regolare il filtro passa-banda 
 **************************************************************************/

private float alpha, angle;
private float r;
private int inv;
private String path = "";
private Music music;

private float R=175;
private float G=175;
private float B=175;

// mi costruisco una classe che mi disegna sul fondo della tavolozza
// una scrollbar

private ScrollBarPanel sbpBP;


public void setup() {
  size(400, 600);
  alpha = 10.0F;
  angle = 0.0F;
  r = width / 2 - width / 4;
  inv = -1;

  // preparo la scrollbar
  float latoScrollButton = 10;
  float spessoreBarra= 10;
  float Ybarra = height - 30;

  sbpBP = new ScrollBarPanel(0, Ybarra, latoScrollButton, spessoreBarra);

  // faccio partire la musica
  music = new Music(this);
  music.suona();
}

public void draw() {
  fill(0, alpha);
  rect(0, 0, width, height);
  disegnaRettaPunto();
  sbpBP.display();
  // preparo il grafico 
  disegnaGrafico();
  // preparo il grafico 
  // senso di rotazione
  
  inv = inv * music.isKick();
  angle -= inv;
  // senso di rotazione
  if (!music.getSong().isPlaying()) {
    this.stop();
  }
}
public void disegnaRettaPunto() {
  // mi salvo lo stato di rotazione
  pushMatrix();
  float seno = sin(radians(angle));
  float coseno = cos(radians(angle));
  float posX = (width / 2) + r * coseno;
  float posY = (height / 4) + r * seno;
  fill(R, G, B);
  ellipse(posX, posY, 10 * music.isHat(), 10 * music.isHat());
  stroke(R, G, B);
  fill(0, alpha);
  float w = r + 5.0F;
  translate(width / 2, height / 4);
  rotate(radians(angle));
  line(w, -w, w, w);
  // recupero lo stato di rotazione
  popMatrix();
}
public void disegnaGrafico() {
  // parte relativa al grafico
  if (music.getSong() != null) {
    stroke(255);
    for (int i = 0; i < music.getSong().bufferSize() - 1; i++) {
      line(i, height- 100 + music.getSong().left.get(i)*50, i+1, height- 100 + music.getSong().left.get(i+1)*50);
      line(i, height - 200 + music.getSong().right.get(i)*50, i+1, height - 200 + music.getSong().right.get(i+1)*50);
    }
  }
  // parte relativa al grafico
}

class Music extends Minim {
  AudioPlayer song;
  BeatDetect beat;
  BeatListener bl;
  LowPassSP lowpass;
  HighPassSP highpass;
  BandPass bpf;

  public Music(PApplet pa) {
    super(pa);
    song = this.loadFile(path + "P_Dreams.mp3", 1024);// "12GongRock.mp3", 1024);
    beat = new BeatDetect(song.bufferSize(), song.sampleRate());
    beat.setSensitivity(10);
    bl = new BeatListener(beat, song);
    applyBandPass();
  }

  public void applyBandPass() {
    float bw = map(0, 0, width, 50, 1000);
    //println(bw);
    float freq = 200;
    bpf = new BandPass(freq, bw, song.sampleRate());//1000, 40, song.sampleRate());
    song.addEffect(bpf);
  }

  public void suona() {
    song.play();
  }

  public int isKick() {
    if (beat.isKick()) {
      R = random(0, 175);
      G += random(175, 250);
      return -1;// x = 0.05F;
    }
    return 1;
  }

  public int isHat() {
    if (beat.isHat()) {
      B = random(175, 250);
      G += random(0, 175);
      return 2;
    }
    return 1;
  }

  public int isSnare() {
    if (beat.isSnare()) {
      return 1;
    }
    return 0;
  }
  public void stop() {
    song.close();
    super.stop();
    this.stop();
  }
  // getter e setter
  public AudioPlayer getSong() {
    return song;
  }
  public void setSong(AudioPlayer song) {
    this.song = song;
  }

  public BandPass getBpf() {
    return bpf;
  }

  public void setBpf(BandPass bpf) {
    this.bpf = bpf;
  }
}

class BeatListener implements AudioListener {
  private BeatDetect beat;

  private AudioPlayer source;

  public BeatListener(BeatDetect beat, AudioPlayer source) {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }

  public void samples(float[] samps) {
    beat.detect(source.mix);
  }

  public void samples(float[] sampsL, float[] sampsR) {
    beat.detect(source.mix);
  }
}

class ScrollBarPanel {
  float sbpX, sbpY;
  private float latoScrollButton;
  private float spessoreBarra;
  private Bar barUp;
  private Bar barDown;
  private ScrollButton button;


  public ScrollBarPanel(float x, float y, float latoScrollButton, float spessoreBarra) {
    sbpX = x;
    sbpY = y;
    this.latoScrollButton = latoScrollButton;
    this.spessoreBarra = spessoreBarra;
    barUp = new Bar();
    barDown = new Bar();
    button = new ScrollButton();
  }
  public void display() {
    barUp.drawBar(0, sbpY);
    barDown.drawBar(0, sbpY + spessoreBarra + latoScrollButton);

    if (mousePressed) {
      if (button.isMouseOn()) {
        button.drawScrollButton(mouseX, sbpY + spessoreBarra);
        //bandaFrequenzaBP();
        bandaFrequenzaBW();
      }
    } 
    else {
      button.drawScrollButton(button.posX, sbpY + spessoreBarra);
    }
  }
  public void bandaFrequenzaBP() {
    float passBand = map(button.posX, 0, width, 100, 2000);
    music.getBpf().setFreq(passBand);
    println(passBand);
  }
  public void bandaFrequenzaBW() {
    float bandWidth = map(button.posX, 0, width, 50, 1000);
    music.getBpf().setBandWidth(bandWidth);
  }

  class Bar {
    public Bar() {
    }
    public void drawBar(float lineX, float lineY) {
      float grey = 255;
      float N = lineY + spessoreBarra;
      for (; lineY< N; lineY++) {
        stroke(grey);
        line(lineX, lineY, width, lineY);
        grey = grey-10;
      }
    }
  }
  class ScrollButton {
    float posX;
    float posY;


    public ScrollButton() {
    }
    public void drawScrollButton(float vertX, float vertY) {
      posX = vertX;
      posY = vertY;
      //println(posX + " - " + posY);
      float grey = 255;
      noFill();
      rect(vertX, vertY, latoScrollButton, latoScrollButton);
      for (int i = 0; i< latoScrollButton; i++) {
        stroke(grey);
        line(vertX, vertY, vertX + latoScrollButton, vertY);
        grey = grey-10;
        vertY++;
      }
    }
    public boolean isMouseOn() {
      if ((mouseX >= 0 && mouseX <= width - latoScrollButton)  &&
        (mouseY >= sbpY + spessoreBarra && mouseY <= sbpY + spessoreBarra + latoScrollButton))
        return true;
      return false;
    }
  }
}


