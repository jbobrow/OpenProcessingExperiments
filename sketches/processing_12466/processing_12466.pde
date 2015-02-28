
String[] files = {"green.png", "prettypink.png","bringthefunkpurple.png","orange.png","yellow.png","funkblue.png"};

PImage[] images = new PImage[files.length];
 
int imageIndex = 0;
int savedTime;
float totalTime = random(1000,4000);

float alpha1 = 0;

void setup() {
  size(747,640);
  savedTime = millis(); 
   
  for(int i = 0; i<files.length; i++)
  { images[i] = loadImage(files[i]);   
  }    
  
   
}
 
void draw() {
  background(0); 
  image(images[imageIndex],0,0,width,height); // resize to width, height
  int passedTime = millis () - savedTime;
  if (passedTime > totalTime) {
        flickNow();
    savedTime = millis() ;
  }
 

}
 
 
void flickNow()
{  if((imageIndex<files.length-1))
   {      imageIndex++;
                 }
   else imageIndex = 0;
    
} 




