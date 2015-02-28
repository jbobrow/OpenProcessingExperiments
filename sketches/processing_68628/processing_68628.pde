
//INTERGERS
//load images
//load background image 
// text mouse click 
// text on next screen with images 
// gravity coming down 

//make bk image 
// make main image 
// write up text  

float x;
float y;
PImage giantBk = new PImage (); 
//PImage [] imageArray = new PImage[4];
//raindrops//
int numOfrainDrops = 45;
float[] speedX = new float[numOfrainDrops];
float[] speedY = new float[numOfrainDrops];
float[] rainXPos = new float[numOfrainDrops];
float[] rainYPos = new float[numOfrainDrops];
PImage[] rainDrops = new PImage[numOfrainDrops];
float gravity = 0.3; 


// for giants 
int numOfGiantImage= 3; 
//creating giant images 
PImage [] giantImages = new PImage [numOfGiantImage]; 
//creating name of giants 
String [] giantNames= new String [numOfGiantImage]; 

//track number of mouses clicked 
int mouseNumOfClicked = 0; 

//font picked 
//PFont font = new Pfont (); 

void setup() {
  background (0); 
  size(1000, 1000);
  
  //looading the first image (background) 
  giantBk = loadImage ("giantbk.png"); 
  //display size of image
  image(giantBk, 1000,1000); 
} 


  void draw() {
  // mouse click if statements ( x 5) last one it will say will the cloud ever come?
  // background will be black , writting will be white) 
  if (mouseNumOfClicked == 5) 
  { 
    background (000); 
   // font = createFont ("Myriad Pro", 30); 
    //textFont (font); 
    fill (0); 
    text ("Will the cloud ever come?", 500,500); 
    
    // create small rain drops that fall downwards // 
    for(int i=0; i<numOfrainDrops; i++)
    { 
      //display rainDrops 
      image(rainDrops[i % numOfrainDrops], rainXPos[i], rainYPos[i]); 
      // movement animation (speed to each positions of rain drop) 
    
rainXPos[i] += speedX[i];
            rainYPos[i] += speedY[i];
             
            //adds speed to gravity so bouncing slows down
            speedY[i] += gravity;
             
            // when logo bounces off the wall, slow them down
            if (rainYPos[i] >= height-50 || rainYPos[i] <= 40 ) {
              speedY[i] *= -0.95;
            }
            if (rainXPos[i] >= width-40 || rainXPos[i] <= 0 ) {
              speedX[i] *= -1;
            }
        }
     }
}
 
  //declaring image names for giant array
  void giantNames()
  {
    
    giantNames[0]= "giant1.png"; 
    giantNames[1]= "giant2.png";
    giantNames[2]= "giant3.png";
    giantNames[3]= "giant4.png";
    giantNames[4]= "giant5.png";
  } 
  
  //'mousePressed Functions
  void mousePressed () 
  { 
  //if mouse button clicked is left 
  if (mouseButton == LEFT)
  { 
    
    // mouse clicked images advancing to the last image 
  mouseNumOfClicked ++; 
 
for (int i=1; i < numOfGiantImage+1; i++) 
{
if (mouseNumOfClicked ==i)
{ 
  giantImages[mouseNumOfClicked-1] = loadImage (giantNames [mouseNumOfClicked-1]); 
  image (giantImages [mouseNumOfClicked-1],0,0); 
            }
         }
     }
}

    
//    // array of images
//    
//  for (int i=0; i < imageArray.length; i++) {
//imageArray [0] = loadImage( "butterfly.png");
//imageArray [1] = loadImage( "three.jpg");
//imageArray [2] = loadImage( "four.jpg");
//imageArray [3] = loadImage( "five.jpg");
//  
//  }
// 
//
//  for (int x = 0; x < imageArray [0].width; x+=6) {
//    for (int y = 0; y< imageArray [0].height; y+=6) {
//        }
//      }
//    }
//  
//
//
////int curI=0;
