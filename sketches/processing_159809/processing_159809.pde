
//test connaitre taux de rouge dans Capture Video

//video
import processing.video.*;
Capture video;

//variables
float tauxrouge;//va enregistrer le taux derouge, le "rouge-o-metre"

void setup(){
  size(320,240);
  background(0);
  video= new Capture(this,width,height,30);
}

void captureEvent(Capture video){
  video.read();
}

void draw(){
  
  video.loadPixels();//on charge les pixels de la video qui vont pouvoir etre calculés
  for(int i = 0; i<width*height; i++){//pour tt la surface du sketch (Hauteur x Largeur)
    color rouge = video.pixels[i];//on a $rouge qui contient tout les pixels
    tauxrouge += red(rouge);//on ajoute au rouge-o-metre, 
                            //les infos (nombres) relatives au données de rouge contenus dans tt les pixels
  }
  video.updatePixels();//on obtientle tout
  
  tauxrouge = tauxrouge/( width*height );//et on fait la moyenne
  
  if(tauxrouge > 100){
    background(0);
    tauxrouge = 0;
    print("YOUPIE");
    print("YOUPIE");
    print("YOUPIE");
  }
  image(video,0,0);
  println("moyenne de rouge:" + tauxrouge);
}

