
  int previousMillis  = 0;
int currentMillis   = 0;
int timer=1000;
int interval=1000;
int savedTime = 1000;
 
int totalTime = 2000; 
 
PFont f;
 
 
String [] filenames = {"1.JPG", "2.JPG","3.JPG"};
String [] beschrijvingen = {"Black box","De cassetterecorder","De knoppen"};
 
PImage[] images = new PImage [filenames.length];
 
int imageIndex = 0;
 
 
void setup() {
  size(700,500);
  smooth();
   
  savedTime = millis();
   
  for (int i = 0; i<filenames.length; i++)
  { images[i] = loadImage(filenames[i]);
  }
   
  f= loadFont("Serif.bold-60.vlw");
   
}
 
void draw() {
  background(0);
 
  image(images[imageIndex],0,0,width,height);
   
  int passedTime = millis() - savedTime;
   
  if(passedTime > totalTime)
  { changeImage();
     
    savedTime = millis();
  }
   
  textFont(f,60);
  fill(255);
  text("Reverse Engineering",100,80); //Tekst bij alle foto's, titel
  text(beschrijvingen[imageIndex],60,475); //tekst onder elke foto
   
}
 
void changeImage()
{ if(imageIndex<filenames.length-1)
  { imageIndex++;
  }
  else imageIndex = 0; 
   
  println(beschrijvingen[imageIndex]);
}
 
 
void mousePressed() {
  changeImage(); 
}

