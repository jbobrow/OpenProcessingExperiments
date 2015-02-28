
//Place Images In String Array
String[] files = {"building1.jpg", "building2.jpg","building3.jpg","building4.jpg","building5.jpg","building6.jpg","building7.jpg"};

PImage[] images = new PImage[files.length];
//Set up Variables for Time and fade properties. 
int imageIndex = 0;
int savedTime;
float totalTime = 8000; // Total time that images appear for
float fadeTime; // What time it starts to fade
int fadeduration = 4000; // How long it fades for

float alph; //Variable that allows the alpha to change and the image to become transparent


void setup() {
  size(340,430); //Image Size
  savedTime = millis(); //Time Is In Milli Seconds
  alph=255; // alpha is opaque
  
   
  for(int i = 0; i<files.length; i++)
  { images[i] = loadImage(files[i]); // Load images in string  
  }    
  
   
}
 
void draw() {
  background(0); //background is white
  //Setting Up Images To Stay For Certain Amount Of Time
  int passedTime = millis () - savedTime; // 
  if (passedTime > totalTime) {
    flickNow(); // Change Image
    savedTime = millis() ;
    fadeTime = totalTime - fadeduration; // Fade Image Out
        } else if (passedTime > fadeTime) {
           tint(255,255,255,alph);
           alph =alph - 1; 
     } else {
        noTint();
  }
  image(images[imageIndex],0,0);
  
}
 
 
void flickNow() // Flicks through the images and resets them in the array.
{  if((imageIndex<files.length-1))
   {      imageIndex++;
           alph=255;
                    }
   else imageIndex = 0;
       
} 




