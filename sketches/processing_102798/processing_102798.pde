
PImage tvImage;
Maxim maxim; //Audio

AudioPlayer RugratsPlayer; //Audio

PImage [] tvShows = new PImage[2]; //TV show images



void setup()
{  
  background(0,0,0);
  
  tvShows [1] = loadImage("Rugrats.png");
  tvImage = loadImage("TV3.png");
  size(tvImage.width, tvImage.height);


  maxim = new Maxim(this); //Audio
  image(tvShows[1], 65, 68);  //TV show - Rugrats
  RugratsPlayer = maxim.loadFile("RugratsThemeSong.wav");
  RugratsPlayer.cue(1);
  RugratsPlayer.play();

  //Display TV image
  image(tvImage, 0, 0);

}
