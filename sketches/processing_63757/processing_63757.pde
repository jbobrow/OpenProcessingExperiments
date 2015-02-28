
// Utilizzo classe Ess presente nella 'code folder'
import krister.Ess.*;

AudioChannel myChannel;    // Oggetto AudioChannel per la riproduzione di file sonori
FFT fft;                   // Oggeto FFT per l'applicazione della Trasformata di Fourier

// FILTRI
Reverse myReverse;
Reverb myReverb;
RateShift myRateShiftSlow, myRateShiftFast;
LowPass myLowPass;
HighPass myHighPass;


void setup()
{
  size(600, 300);
  Ess.start(this);    // Avvio della classe Ess
  
  myChannel = new AudioChannel("think.aif");    // Caricamento file sonoro
  
  // CREAZIONE FILTRI
  myReverse = new Reverse();
  myReverb =  new Reverb();
  myRateShiftSlow = new RateShift(Ess.calcShift(-3));
  myRateShiftFast = new RateShift(Ess.calcShift(3));
  myLowPass = new LowPass(500, -50, 2);
  myHighPass = new HighPass(1000, 0, 10);
  
  
  fft = new FFT();      // Creazione oggetto fft
  fft.averages(256);    // Calcolo 256 medie
}

void draw()
{
  background(0);
  
  fft.getSpectrum(myChannel); //crea uno spettro del suono nel buffer
  
  for (int i = 0 ; i < 256 ; i++)   // Creazione visualizzazione spettro
  {
    stroke(255);
    strokeWeight(4);
    line(width/2 + 5*i, height/2, width/2 + 5*i, height/2 - 200*fft.averages[i]);
    line(width/2 - 5*i, height/2, width/2 - 5*i, height/2 - 200*fft.averages[i]);
    line(width/2 + 5*i, height/2, width/2 + 5*i, height/2 + 200*fft.averages[i]);
    line(width/2 - 5*i, height/2, width/2 - 5*i, height/2 + 200*fft.averages[i]);
  }
  
  fill(255);
  textSize(18);
  textAlign(CENTER);
  text("PROGETTO   SMM   -   Rollo Manoj", width/2, 25);
  textSize(14);
  textAlign(LEFT);
  text("CLICK:", 25, height-85);
  text("'P' to Play Song", 25, height-70);
  text("'S' to Pause Song", 25, height-55);
  text("'R' to Resume Song", 25, height-40);
  text("'F' to Rewind Song", 25, height-25);
  textAlign(RIGHT);
  text("CLICK for EFFECTS", width -25, height-85);
  text("Reverse", width-25, height-70);
  text("Reverb", width-25, height-55);
  text("- RateShift +", width-25, height-40);
  text("LowPass", width-25, height-25);
  text("HighPass", width-25, height-10);
}

void keyPressed()      // Comandi da tastiera per il controllo della riproduzione del frammento sonoro
{
  if (key == 'p' || key == 'P')
  {
    myChannel.play();
  }
  else
  if (key == 's' || key == 'S')
  {
    myChannel.pause();
  }
  else
  if (key == 'r' || key == 'R')
  {
    myChannel.resume();
  }
  else
  if (key == 'f' || key == 'F')
  {
    myChannel.cue(myChannel.frames(0000));
  }
}

void mousePressed()    // Controllo CLICK del mouse per l'applicazione di filtri
{
  if (mouseX > width-80 && mouseX < width-25 && mouseY > height-83 && mouseY <= height-68)
  {
    myReverse.filter(myChannel);
  }
  else
  if (mouseX > width-75 && mouseX < width-25 && mouseY > height-68 && mouseY <= height-53)
  {
    myReverb.filter(myChannel);
  }
  else
  if (mouseX > width-115 && mouseX < width-100 && mouseY > height-53 && mouseY <= height-38)
  {
    myRateShiftSlow.filter(myChannel);
  }
  else
  if (mouseX > width-40 && mouseX < width-25 && mouseY > height-53 && mouseY <= height-38)
  {
    myRateShiftFast.filter(myChannel);
  }
  else
  if (mouseX > width-85 && mouseX < width-25 && mouseY > height-38 && mouseY <= height-23)
  {
    myLowPass.filter(myChannel);
  }
  else
  if (mouseX > width-85 && mouseX < width-25 && mouseY > height-23 && mouseY <= height-8)
  {
    myHighPass.filter(myChannel);
  }
  else      // Se non si clicca su alcuna etichetta testuale, la canzone riparte senza effetti
  {
    myChannel.destroy();
    myChannel = new AudioChannel("think.aif");
  }
}

public void stop()    // Chiusura
{
  Ess.stop();
  super.stop();
}

