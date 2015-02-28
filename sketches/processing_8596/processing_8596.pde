
int previousMillis  = 0;
int currentMillis   = 0; 
int timer=2000;
int interval=2000;
int savedTime = 2000;

int totalTime = 2000;  

PFont f;


String [] filenames = {"2.jpg", "3.jpg","4.jpg" };
String [] beschrijvingen = {"Defqon 1 2008", "Vuurwerk almere strand","Defqon 1 2009 met Rob!" };

PImage[] images = new PImage [filenames.length];

int imageIndex = 0;


void setup() {
  size(800,600);
  smooth();
  
  savedTime = millis();
  
  for (int i = 0; i<filenames.length; i++)
  { images[i] = loadImage(filenames[i]);
  }
  
  f= loadFont("Serif-60.vlw");
  
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
  text("Partyyy!",500,100); //Tekst bij alle foto's, titel
  text(beschrijvingen[imageIndex],80,575); //tekst onder elke foto
  
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


