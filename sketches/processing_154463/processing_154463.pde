
//Code written by Jonathan Mertz
//the picture is supposed to vibrate and the black pixels flash random colors
//it works on regular processing
//dunno what's up

float positionX = 50;
float positionY = 50;
PImage img;

boolean[] partyHard;


void setup()
{
  //bluh.png
  img = loadImage("http://i1021.photobucket.com/albums/af335/RLabs/bluh.png?t=1286766744");
  
  
  partyHard  = new boolean[img.pixels.length];
  
   for(int i =0; i < img.pixels.length - 1; i++)
  partyHard[i] = false;

  
  background(200,20,20);
  

  
  //

  
  size(750, 550);
  
  
}
void draw()
{

 
  background(200,20,20);
  
  //jiggling directions for use without noloop();
  
  positionX += (Math.random() * 2) -1;
  positionY += (Math.random() * 2) -1;
 // image(img,positionX,positionY);
  
  //out something interesting in resultImg
  
  
  
  for(int i=0;i<loadImage("http://i1021.photobucket.com/albums/af335/RLabs/bluh.png?t=1286766744").pixels.length;i++)
  {
   
    {

   if(loadImage("http://i1021.photobucket.com/albums/af335/RLabs/bluh.png?t=1286766744").pixels[i]==(color(0,0,0)))
   {
    partyHard[i] = true;
    img.pixels[i] = color(random(255),random(255),random(255)); 
    
   }
   if(partyHard[i])
  img.pixels[i] = color(random(255),random(255),random(255));
  }
  
  
  img.updatePixels();
  }
  //draw images
 
  image(img,positionX,positionY);

}
