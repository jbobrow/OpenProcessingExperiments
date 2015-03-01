
// ********************************************************************************
//
// INTRODUCTION TO COMPUTATIONAL ARTS
//
// Project 3 (Final)
//
// Author: Cristiano Sponza
// Date: December 16th, 2014
//
// Goal: This program  is an interactive processing sketch, 
//       including images and sounds
//
// Theme - Artistic Description: This project could be titled: 
//        "Kill frost and reveal beauty..."
//        I imagine myself at home during a winter cold day, where the windows are
//        covered of ice, blurring the outside. Then I dream to use a magic
//        cleaner, removing the frost from the window and revealing a beautiful
//        landscape in a summer sunny day.
//
// Program Description:
//         The sketch uses six JPEG images; the main
//         image is "ImageClean.jpg" which depicts a young woman on 
//         the beach.
//         Then, I created five more images by modifying
//         the main image with Photoshop. 
//         I used the Filter -> Distort -> Glass and created five
//         images with different distortion level (1, 5, 10, 15, 20).
//         I called such images "ImageFrostxx.jpg", where xx represents
//         the distortion level.
//
//         At the beginning the image with max level of distortion is displayed
//         (ImageFrost20.jpg).
//         The user is asked to select a "cleaner" by pressing the keys
//         from '1' to '5'. 1 is the smoother cleaner, while 5 is the 
//         sharper. '2', '3', '4' select the intermediate levels.
//         Then the user has to press the mouse left button and drag 
//         to move the cleaner around the canvas. This will reveal a more
//         clear image, according to the selected cleaner level.
//
//         Basically, the cleaner level is linked to a specific 
//         "ImageFrostxx.jpg" image, so selecting '1' makes   
//         "ImageFrost15.jpg" to be displayed, '2' makes 
//         "ImageFrost10.jpg" to be displayed, and so on, till '5'
//         which displays the original image "ImageClean.jpg".
//         This operation is carried out by masks. Each ImageFrostxx.jpg
//         image has its own mask, which is progressively drawn,
//         following the mouse movement.
//         
//         The user can change the default cleaner size by pressing
//         (and releasing) the '+'key to increase the size and '-'
//         to decrease the size.
//         Pressing 'R' or 'r' makes the program to be restarted: the 
//         image with maximum distortion is displayed and the cleaner
//         is disabled.
// 
// Sound Management:
//         when the cleaner is activated by pressing the left button
//         and mouse drag, a sound is generated. The sound
//         changes according to the cleaner level: deeper with 1,
//         higher with 5. 
//         I created the sound samples with FL Studio. Firstly I 
//         created the deeper one, then I obtained the other ones by 
//         increasing the pitch.
//  
// User Commands:
//         keyboards:
//          - '1', '2', '3', '4', '5' : select cleaner level
//          - '+', '-' : increase/decrease cleaner size
//          - 'R' or 'r' : restart program 
//
//         mouse:
//         - press left button and drag to clean the canvas
//
// Limitations: The program allows the user to start from any cleaner level,
//              but it is ONLY POSSIBLE TO UPSCALE the level value. 
//              Downscaling has no effect. I assumed that if the user has
//              cleaned an area with value x, then passing to a lower level 
//              of cleaner, of course, has no effect on that area. But
//              it could have effect on adjacent areas that are not yet cleaned. 
//              Unfortunately I wasn't be able to properly manage the 
//              image masks for this case ...
//
// Used Resources: for this project, I used one JPEG image that I bought from 
//              www.pond5.com. Such image is royalty free. The other images
//              were obtained modifying that original sample with Photoshop
//              The sounds were created by me using FL Studio.
//
// Test:       This program ran on:
//              - OS X ver. 10.9 (Mavericks)
//              - Windows 7
//              - Linux Ubuntu 14.04 LTS
//
// Processing version required: 2.2.1 or superior
//
// ********************************************************************************

import ddf.minim.*;      // import the JavaSound library to manage the audio samples

//  **** GLOBAL DATA ****

String [] imgfileArray = {   // declare the array containing the JPEG image files 
  "ImageFrost20.jpg", // image with distortion level = 20 (maximum)     
  "ImageFrost15.jpg", // image with distortion level = 15  
  "ImageFrost10.jpg", // image with distortion level = 10 
  "ImageFrost5.jpg", // image with distortion level = 5 
  "ImageFrost1.jpg", // image with distortion level = 1     
  "ImageClean.jpg"           // original image
};

final int IMAGES_COUNT = 6;  // define constant for images count

String [] soundFileArray = {  // declare the array containg the sound samples
  "PressureSound_1.wav", // sound for cleaner level = 1 (deeper)
  "PressureSound_2.wav", // sound for cleaner level = 2  
  "PressureSound_3.wav", // sound for cleaner level = 3 
  "PressureSound_4.wav", // sound for cleaner level = 4
  "PressureSound_5.wav", // sound for cleaner level = 5 (higher)
};

final int SOUND_SAMPLES_COUNT = 5;  // define constant for sound samples count

PImage [] imagesArray;        // declare the array for storing the JPEG images                     
PGraphics [] maskArray;       // declare the array for the images masks

Minim [] minimArray;          // declare the array for Minim istances
AudioSample[] noiseArray;     // declare the array for storing the audio samples


int cleanerLevel;             // declare the variable for cleaner level
int cleanerSize;              // declare the variable for cleaner size

final int CLEANER_DISABLED = 0;     // define constant for cleaner disabled
final int DEFAULT_CLEANER_SIZE = 50;       // define constant for default cleaner size                                 
final int MAX_CLEANER_SIZE = 300;          // define constant for maximum cleaner size
final int MIN_CLEANER_SIZE = 25;           // define constant for minimum cleaner size
final int CLEANER_SIZE_VARIATION = 20;     // define constant for cleaner size variation


int audioTrigger;                 // declare the trigger variable for sound generation
final int AUDIO_INTERVAL  = 10;   // define sound interval to avoid overload clipping 


void setup() {

  int i;                      // generic index for cycles
  size (1080, 720);           // define the canvas size, equal to the images size

  imagesArray = new PImage[IMAGES_COUNT];      // allocate memory for the imagesArray array
  maskArray = new PGraphics[IMAGES_COUNT];     // allocate memory for the maskArray array 
  minimArray = new Minim[SOUND_SAMPLES_COUNT];        // allocate memory for the minimArray array
  noiseArray = new AudioSample[SOUND_SAMPLES_COUNT];  // allocate memory for the noiseArray array

  for (i=0; i<IMAGES_COUNT; i++) {       
    imagesArray[i] = loadImage (imgfileArray[i]);  // load all the images into the proper array    
    maskArray[i] = createGraphics(width, height);  // create the images masks and store into the proper array
  }

  for (i=0; i<SOUND_SAMPLES_COUNT; i++) {
    minimArray[i] = new Minim(this);    // create 5 Minim istances and store them into the proper array
    noiseArray[i] = minimArray[i].loadSample(soundFileArray[i]);  // load all the sound samples into the proper array
  }

  cleanerLevel = CLEANER_DISABLED;             // start with cleaner disabled
  cleanerSize = DEFAULT_CLEANER_SIZE;          // initialize cleaner size to default value

  image(imagesArray[0], 0, 0);                 // display image with max level of distortion
  audioTrigger = 0;                            // initialize audio trigger
}

void draw() {

  // if LButton mouse is pressed start cleaner
  if (mousePressed && (mouseButton == LEFT) && (cleanerLevel > CLEANER_DISABLED)) {    

    if ((audioTrigger = audioTrigger % AUDIO_INTERVAL) == 0)  // sound the noise every AUDIO_INTERVAL to avoid clipping 
      noiseArray[cleanerLevel-1].trigger();                   // do proper sound, according to the cleaner level 

    maskArray[cleanerLevel].beginDraw();                      // start drawing the cleaner
    maskArray[cleanerLevel].noStroke();                       // the cleaner has no outline
    maskArray[cleanerLevel].fill(255);                        // the cleaner has rgb = white
    maskArray[cleanerLevel].ellipse(mouseX, mouseY, cleanerSize, cleanerSize);      // the cleaner has circle shape 
    maskArray[cleanerLevel].endDraw();                        // end the drawing procedure

    imagesArray[cleanerLevel].mask(maskArray[cleanerLevel]);  // mask the foreground image with the area created by mouse 
    image(imagesArray[cleanerLevel], 0, 0);                   // display the clearer image on the mask

    audioTrigger++;                                           // increment the sound trigger
  }
}


// Keyboard management

void keyReleased() {
  if (key == 'r' || key == 'R')      //'r' or 'R' key presses and released
  {  // restart procedure request
    cleanerLevel = CLEANER_DISABLED;       // disable the cleaner 
    cleanerSize = DEFAULT_CLEANER_SIZE;    // set cleaner size to default
    for (int i=0; i<IMAGES_COUNT; i++)     
      maskArray[i].clear();                // erase the masks for all the images

    image(imagesArray[0], 0, 0);    // display image with max level of distortion
  } else if (key == '+') {                   // if '+' pressed, increment cleaner size
    if (cleanerSize < MAX_CLEANER_SIZE)      // check for maximum size
      cleanerSize+=CLEANER_SIZE_VARIATION;   // increment size
  } else if (key == '-') {                   // if '-' pressed, decrement cleaner size
    if (cleanerSize > MIN_CLEANER_SIZE)      // check for minimum size
      cleanerSize-=CLEANER_SIZE_VARIATION;   // decrement size
  } else {
    switch(key) {
    case '1':
      if (cleanerLevel < 1)          // if '1' pressed, set cleaner level = 1
          cleanerLevel = 1;
      break;
    case '2':
      if (cleanerLevel < 2)          // if '2' pressed, set cleaner level = 2
          cleanerLevel = 2;
      break;
    case '3':
      if (cleanerLevel < 3)          // if '3' pressed, set cleaner level = 3
          cleanerLevel = 3;
      break;
    case '4':  
      if (cleanerLevel < 4)          // if '4' pressed, set cleaner level = 4
          cleanerLevel = 4;
      break;
    case '5': 
      if (cleanerLevel < 5)          // if '1' pressed, set cleaner level = 5
          cleanerLevel = 5;
      break;
    }
  }
} 


