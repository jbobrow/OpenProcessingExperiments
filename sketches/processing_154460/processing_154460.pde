
/* @pjs preload="difference_puzzle_one.jpg, difference_puzzle_original.jpg, difference_puzzle_two.jpg, greenscreen.jpg, pesky1.jpg, pesky2.jpg, pesky3.jpg"; 
 */

PImage peskyTourist1;
PImage peskyTourist2;
PImage peskyTourist3;
PImage greenScreenPic;
PImage differencePuzzle1;
PImage differencePuzzle2;
PImage resultImage;

void loadImages(){
  //Load the three input images
  /* Design note: If we knew about loops, Strings, and arrays, it might be better
   * to do this using a loop. After all, what if we decided we wanted 9 input
   * images instead of 3? Because we have "hard coded" only using 3 input images,
   * updating it to use 9 will take a bit of work. */
  peskyTourist1 = loadImage("pesky1.jpg");
  peskyTourist2 = loadImage("pesky2.jpg");
  peskyTourist3 = loadImage("pesky3.jpg");
  greenScreenPic = loadImage("greenscreen.jpg");
  differencePuzzle1 = loadImage("difference_puzzle_one.jpg");
  differencePuzzle2 = loadImage("difference_puzzle_two.jpg");
  
  //Create a blank image the same size as the first input image.
  resultImage = createImage(peskyTourist1.width, peskyTourist1.height, RGB);
  
  /* Normally you don't access the individual pixels of an image.
   * Since we want to do that in this case, though, we need to tell the
   * system to fill the "pixels" array for us. */
  peskyTourist1.loadPixels();
  peskyTourist2.loadPixels();
  peskyTourist3.loadPixels();
  greenScreenPic.loadPixels();
  resultImage.loadPixels();
  differencePuzzle1.loadPixels();
  differencePuzzle2.loadPixels();
}

//---- Follow-along 1 ------
/* This image filter just takes an image and creates a negative image,
 * similar to photographic negatives from the old days of film cameras.
 * Black becomes white, white becomes black, red becomes cyan (red + green) and
 * so on. */
void negativeImage(PImage input, PImage output){
  //Loop through all the pixels in the output image, one at a time
  for(int i=0;i<output.pixels.length;i++){
    /* To get the "negative" of a color, just subtract it from white.
     * For example, red is color(255,0,0), and its negative is cyan,
     * which is color(0,255,255). So white - red == cyan. */
    output.pixels[i] = color(255,255,255)-input.pixels[i]+color(0,0,0,255);
  }
  output.updatePixels();
}

//----- Follow-along 2 -----
/* This image filter takes two images and shows which parts are different.
 * Parts that are the same will be black, parts that are different will be white */
void diffImage(PImage input1, PImage input2, PImage output){
  //Loop through all pixels in the output images, one at a time
  for(int i=0; i< output.pixels.length; i++){
    /* Bad news here: I can't just subtract input1's pixel from input2.
     * The reason is: What will I get if I do color(0,0,0) - color(255,255,255). I guess
     * I'd get color(-255,-255,-255), but that isn't a valid result. So I better do this
     * a bit more carefully... */
    
    //Get the red value from each pixel, and subtract. Then take the absolute value,
    // just in case the result was negative.
    float new_red = abs(red(input1.pixels[i]) - red(input2.pixels[i]));
    //repeat for blue and green
    float new_blue = abs(blue(input1.pixels[i]) - blue(input2.pixels[i]));
    float new_green = abs(green(input1.pixels[i]) - green(input2.pixels[i]));
    
    output.pixels[i] = color(new_red,new_green,new_blue);
  }
  output.updatePixels();
}

//--------------Option 0-----------------------------------------
//Option 0: Color wash
/* Add a colored tint to an image. For each pixel of the input image, average it with your favorite color
 * using the lerpColor method. */
//Bonus: Instead of using a single color, try tinting with a rainbow!
void colorWash(PImage image1, PImage output){
  //Loop through all pixels in the output images, one at a time
  for(int y=0; y<output.height; y++){
    /* I want to get a rainbow color. The easiest way to do this is to use the HSB color space.
     * I have set the "hue" range to be the same as output.height, so we will have one hue for each
     * row of the image. I then pick the color for this row based on the y value, and set the
     * saturation and brightness to be full */
    colorMode(HSB,output.height,255,255);
    color myFaveColor = color(y,255,255);
    //Switch back to normal color mode, just in case.
    colorMode(RGB,255);
    for(int x=0; x< output.width; x++){
      /* Because we are iterating through the image one row at a time, instead of one
       * pixel at a time, we need to calculate which index in the pixels[] array corresponds to
       * the current x and y. Images are represented in row-major order, which means that formula
       * we need is i = x+y*output.width */
      int i = x+y*output.width;
      /* "lerp" stands for "linear interpolation." This just means computing a weighted average
       * of two things. By using 0.5 as the amount, we are saying that we want to average the current
       * color from the input image with myFaveColor */
      output.pixels[i] = lerpColor(image1.pixels[i],myFaveColor,0.5);
    }
  }
  output.updatePixels();
}

//----------Option 1-----------------------------------------------------
//Option 1: Green screen
/* When you see a weather person standing in front of a weathermap, they are actually standing
 * in front of a "green screen," and the computer is filling in the background using the map.
 * In this filter, I want you to take 2 input images, and produce 1 output image. Every pixel
 * in image1 that is green (color(0,255,0)) should be replaced by whatever color is in image2.
 * Any pixel that is NOT green in image1 should be copied to the result image, not replaced. */
void greenScreen(PImage greenScreenImage, PImage fillImage, PImage output){
  //Loop through all pixels in the output images, one at a time
  for(int i=0; i < fillImage.pixels.length; i++){
    /* Look at the green screen image. If we are on the green screen part,
     * use the color from the fillImage. If not, use the greenScreenImage */
    if(green(greenScreenImage.pixels[i]) == 255 ||
       red(greenScreenImage.pixels[i]) == 0 ||
       blue(greenScreenImage.pixels[i]) == 0){
      output.pixels[i] = fillImage.pixels[i];
    } else {
      output.pixels[i] = greenScreenImage.pixels[i];
    }
  }
  output.updatePixels();
}

//----------------Option 2---------------------------------------------
//Option 2: Bye-bye, pesky tourist
/* This filter takes 3 input images, and we will be able to use it to remove the
 * pesky tourist from our nice sculpture pictures.
 * The main idea is for each pixel in the output image, look at the three different corresponding input
 * pixels. Find the median value of the red, green, and blue components, and use those for the output */
void medianImage(PImage image1, PImage image2, PImage image3, PImage output){
  for(int i=0;i<output.pixels.length;i++){
    /* For each pixel in image1 we will look at it and the corresponding pixels from image2
     * and image3. We will then pick our output color to be the median of those three.
     * Of course, it doesn't make much sense to say the median of 3 colors, since each color
     * has 3 values. So we are going to cheat a little: We will just take the median red,
     * median green, and median blue independently of each other, and hope for the best. */
 
    /* Just as in the diffImage follow-along example, we need to handle red, green and blue
     * independently of each other. Using a helper function that finds the median of 3 numbers,
     * find the median value for each of red, blue and green. */
    float new_red = median(red(image1.pixels[i]),red(image2.pixels[i]),red(image3.pixels[i]));
    float new_green = median(green(image1.pixels[i]),green(image2.pixels[i]),green(image3.pixels[i]));
    float new_blue = median(blue(image1.pixels[i]),blue(image2.pixels[i]),blue(image3.pixels[i]));
    
    output.pixels[i] = color(new_red,new_green,new_blue);
  }
  output.updatePixels();
}

float median(float in1, float in2, float in3){
  //Put the 3 input items into an array
  float arr[] = new float[3];
  arr[0] = in1;
  arr[1] = in2;
  arr[2] = in3;
  
  //Insertion sort the array
  for(int i=1;i<arr.length;i++){
    for(int j=i;j>0;j--){
      if(arr[j] < arr[j-1]){
        float t = arr[j];
        arr[j] = arr[j-1];
        arr[j-1] = t;
      }
    }
  }
  
  //The middle item in the array is the median, by definition
  return arr[1];
}

//------- Driver code

void setup(){
  peskyTourist1 = loadImage("pesky1.png");
  
  size(495,557); //Based on the size of the input pictures
  noLoop(); //I don't need animation, so make sure draw() only gets called once
  
  //First, load the input images
  loadImages();
  
  /* Next, apply a transformation to the image
   * Just uncomment ONE of the following lines. Or, if you like, you can try combining
   * them into something more creative. */
  
  //negativeImage(greenScreen,resultImage);
  //diffImage(differencePuzzle1,differencePuzzle2,resultImage);
  colorWash(peskyTourist1,resultImage);
  //greenScreen(greenScreenPic,peskyTourist1,resultImage);
  //medianImage(peskyTourist1,peskyTourist2,peskyTourist3,resultImage);
}

void draw(){
  //Finally, draw the result image on the screen.
  image(resultImage,0,0);
  //Then save the result in a file that you can share with others
  //save("result.png");
}


