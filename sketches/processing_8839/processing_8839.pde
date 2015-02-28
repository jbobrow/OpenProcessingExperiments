
int maxImages = 4;
int imageIndex = 0;
PImage[] images = new PImage[maxImages];


int savedTime;
int totalTime = 2000;


void setup() 
{ size(800,500);
  smooth();
  savedTime = millis();
  
  for(int i = 0; i<images.length; i++)
  { images[i] = loadImage("vacantie_" + (i+1) +".jpg");   
    //images[i] = loadImage("bla.jpg");
  } 
  
}
  
    


void draw()
{ int passedTime = millis() - savedTime;
  if (passedTime > totalTime) 
  { imageIndex = (imageIndex+1) % images.length;
    println("volgende plaatje !");
    savedTime = millis();
  }
  
image(images[imageIndex],0,0,width,height);
 

}


