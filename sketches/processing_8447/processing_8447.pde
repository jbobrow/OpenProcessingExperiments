
String[] filenames = {"Marlouenbarbara.jpg", "Papaenik.jpg", "Marlouenik.jpg","gala.jpg"};
String[] beschrijving = {"Met Marlou uitgaan @ Genux!", "Papa en ik in Annecie", "Zus en ik bij Grand Canyon","Gala Montessori 2010!"};

PImage[] images = new PImage[filenames.length];

int imageIndex = 0;
int savedTime;
int totalTime = 3000;

PFont f;

void setup() {
  size(500,400);
  savedTime = millis();  
  
  for(int i = 0; i<filenames.length; i++)
  { images[i] = loadImage(filenames[i]);    
  }     
  f = loadFont("EurostileBold-24.vlw");
  
}

void draw() {
  background(0);  
  image(images[imageIndex],0,0,width,height); // resize to width, height
  int passedTime = millis () - savedTime;
  if (passedTime > totalTime) {
    println("3 seconds have passed!");
    veranderPlaatje();
    savedTime = millis() ;
  }

  textFont(f,24);
  fill(255);
  text(beschrijving[imageIndex],10,380);
}

void mousePressed() {
 
 veranderPlaatje();
 
}

void veranderPlaatje()
{  if(imageIndex<filenames.length-1)
   { imageIndex++;
   }
   else imageIndex = 0; 
   
   println(beschrijving[imageIndex]);
} 

//Voor tekst op je foto: blz. 309

