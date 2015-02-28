
//For this project I decided to use a pictures of beautiful cities in Europe.
//I have tried to find the most amazing pictures of few biggest cities in Europe.
//I hope you will enjoy in this project. :)

/*Here are instruction for using this sketch
- keys from 0 to 9 - open picture from the images array, the first 10 od them
- keys 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h' - open the rest of the pictures form images array
- key 's' or 'S' - is used for saving current opened picture
- mouseX - defines moving of the faded image for each of  images from array opened with keys above
- return with key 'o' - to return to initial picture of this interactive sketch 
*/

// Global Variables
int tileCountX=6;
int tileCountY=3;
int tileCount = tileCountX*tileCountY;
PImage[] images = new PImage[tileCount];
PImage screenshot;
float dx;
float offset = 0;
float easing = 0.05;

//void setup()

void setup(){

size(1200, 720);
// Loading images with numbered files 
for (int i  =  0; i  <  images.length; i++){ 
images[i]  =  loadImage( "city"  +  i + ".jpg"); 
} 
screenshot = loadImage("screenshot.jpg");
}
//void draw()

void draw(){
int k=0;
while(k<17){
for(int i = 0; i<tileCountX; i++){
  for(int j = 0; j<tileCountY; j++){
    image(images[k], i*(width/6), j*(height/3), 200, 240);
    k++;
  }
}
}

switch(key)
{
  case '0':
  image(images[0], 0, 0, 1200, 720);
  dx = (mouseX-images[0].width/2) - offset;
  offset += dx * easing; 
  tint(255, 127);  // Display at half opacity
  image(images[0], offset, 0);
  break;
 
  case '1':
  image(images[1], 0, 0, 1200, 720);
  dx = (mouseX-images[1].width/2) - offset;
  offset += dx * easing; 
  tint(255, 127);  // Display at half opacity
  image(images[1], offset, 0);
  break;
  
  case '2':
  image(images[2], 0, 0, 1200, 720);
  dx = (mouseX-images[2].width/2) - offset;
  offset += dx * easing; 
  tint(255, 127);  // Display at half opacity
  image(images[2], offset, 0);
  break;
  
  case '3':
  image(images[3], 0, 0, 1200, 720);
  dx = (mouseX-images[3].width/2) - offset;
  offset += dx * easing; 
  tint(255, 127);  // Display at half opacity
  image(images[3], offset, 0);
  break;
  
  case '4':
  image(images[4], 0, 0, 1200, 720);
  dx = (mouseX-images[4].width/2) - offset;
  offset += dx * easing; 
  tint(255, 127);  // Display at half opacity
  image(images[4], offset, 0);
  break;
  
  case '5':
  image(images[5], 0, 0, 1200, 720);
  dx = (mouseX-images[5].width/2) - offset;
  offset += dx * easing; 
  tint(255, 127);  // Display at half opacity
  image(images[5], offset, 0);
  break;
  
  case '6':
  image(images[6], 0, 0, 1200, 720);
  dx = (mouseX-images[6].width/2) - offset;
  offset += dx * easing; 
  tint(255, 127);  // Display at half opacity
  image(images[6], offset, 0);
  break;

  case '7':
  image(images[7], 0, 0, 1200, 720);
  dx = (mouseX-images[7].width/2) - offset;
  offset += dx * easing; 
  tint(255, 127);  // Display at half opacity
  image(images[7], offset, 0);
  break;
  
  case '8':
  image(images[8], 0, 0, 1200, 720);
  dx = (mouseX-images[8].width/2) - offset;
  offset += dx * easing; 
  tint(255, 127);  // Display at half opacity
  image(images[8], offset, 0);
  break;
  
  case '9':
  image(images[9], 0, 0, 1200, 720);
  dx = (mouseX-images[9].width/2) - offset;
  offset += dx * easing; 
  tint(255, 127);  // Display at half opacity
  image(images[9], offset, 0);
  break;
  
  case 'a':
  image(images[10], 0, 0, 1200, 720);
  dx = (mouseX-images[10].width/2) - offset;
  offset += dx * easing; 
  tint(255, 127);  // Display at half opacity
  image(images[10], offset, 0);
  break;
  
  case 'b':
  image(images[11], 0, 0, 1200, 720);
  dx = (mouseX-images[11].width/2) - offset;
  offset += dx * easing; 
  tint(255, 127);  // Display at half opacity
  image(images[11], offset, 0);
  break;
  
  case 'c':
  image(images[12], 0, 0, 1200, 720);
  dx = (mouseX-images[12].width/2) - offset;
  offset += dx * easing; 
  tint(255, 127);  // Display at half opacity
  image(images[12], offset, 0);
  break;
  
  case 'd':
  image(images[13], 0, 0, 1200, 720);
  dx = (mouseX-images[13].width/2) - offset;
  offset += dx * easing; 
  tint(255, 127);  // Display at half opacity
  image(images[13], offset, 0);
  break;
  
  case 'e':
  image(images[14], 0, 0, 1200, 720);
  dx = (mouseX-images[14].width/2) - offset;
  offset += dx * easing; 
  tint(255, 127);  // Display at half opacity
  image(images[14], offset, 0);
  break;
  
  case 'f':
  image(images[15], 0, 0, 1200, 720);
  dx = (mouseX-images[15].width/2) - offset;
  offset += dx * easing; 
  tint(255, 127);  // Display at half opacity
  image(images[15], offset, 0);
  break;
  
  case 'g':
  image(images[16], 0, 0, 1200, 720);
  dx = (mouseX-images[16].width/2) - offset;
  offset += dx * easing; 
  tint(255, 127);  // Display at half opacity
  image(images[16], offset, 0);
  break;
  
  case 'h':
  image(images[17], 0, 0, 1200, 720);
  dx = (mouseX-images[17].width/2) - offset;
  offset += dx * easing; 
  tint(255, 127);  // Display at half opacity
  image(images[17], offset, 0);
  break;
  
  case 'o':
  image(screenshot, 0, 0);
  tint(255, 127);
  break;
}
}

//---KEY INPUT---
void keyPressed()
{
 if(key == 's' || key == 'S') 
   saveFrame("screenshot" + random(images.length) + ".jpg");
}

