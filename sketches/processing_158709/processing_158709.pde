
import ddf.minim.*;

float[] coswave; 
int t=0;
float cox = 1;
float coxm = 17;
Minim minim;
AudioPlayer player;

void setup() {
  size(640, 360);
  coswave = new float[width];
  for (int i = 0; i < width; i++) {
    float amount = map(i, 0, width, 0, PI);
    coswave[i] = abs(cos(amount));
  }
  background(0);
  text("Auguroni Anna!", 150, 300); 
  text("Spero che sarai sempre felice, tutta la vita...",175,310);
  text("(credo sia questo l'augurio migliore che io possa farti)",190,320);
  text("da Matteo, 26/8/2014.",235,340);
  frameRate(20);
  minim = new Minim(this);
  player = minim.loadFile("Spiegel_Im_Spiegel.mp3");
  player.play();
}

void draw(){
  float relcosa = coswave[t]*noise(cox)*255;
  float relcosb = coswave[t]*noise(cox+1)*255;
  float relcosc = coswave[t]*noise(cox+2)*255;
  noStroke();
  fill(relcosa,relcosb,relcosc);
  rect(t,0,3,height);
  cox+=(noise(coxm)*0.05);
  coxm+=0.05;
  t+=1;
  if (t>=width-1){
    t=1;
  } 
}

