
/** ConvolutionImage oct 20 2011 by Peter Bosshard Schneider<br />
 * allows experimentation with a video camera and an interactive convolution filter.<br />
 * This Applet uses a jpeg-Image instead of a video capture, but if you download the sourcecode,<br />
 * you can uncomment and comment out the lines indicated.<br />
 * The Convolutionfilter is based on code 40-13 from the book by Casey Reas and Ben Fry.<br />
 * It uses the controlP5 Library from Andreas Schlegel for the menu. You can toggle the menu by pressing 'm'<br />
 * If you want to hide the menu completely, you can drag it up a bit by pressing the option-key <br />
 * and then use the 'm'-key to show or hide it.<br />
 * The toggle switches on the bottom of the UI control:<br />
 * GRAY: use grayscale image<br />
 * INVERT: invert the image before applying the convolution filter<br />
 * NEG: invert the image after applying the convolution filter<br />
 * RED: filter the red channel<br />
 * GREEN: filter the green channel<br />
 * BLUE: filter the blue channel<br />
 */

//import processing.video.*; //uncomment this line if used with video
import controlP5.*;

// ------ ControlP5 ------
ControlP5 controlP5;
boolean showGUI = true;

boolean use_gray = false;
boolean use_red = true;
boolean use_green = true;
boolean use_blue = true;
boolean do_invert = false;
boolean do_neg = false;

// ------ Convolution Kernel ------
float kernel[][] = {
  {
    0, 0, 0
  }
  , 
  {
    0, 1, 0
  }
  , 
  {
    0, 0, 0
  }
};
//Capture video; //uncomment this line if used with video
PImage video;    //comment this line if used with video

void setup() {
  size(640, 480, JAVA2D);
  //video = new Capture(this, 640, 480, 30);//uncomment this line if used with video
  
  setupGUI();
  if (showGUI) controlP5.group("menu").open();
  controlP5.draw();
}

void draw() {
  // if (video.available()) { //uncomment this line if used with video
  //  video.read();           //uncomment this line if used with video
  video = loadImage("video.jpg");           //comment this line if used with video
    if (do_invert) {
      video.loadPixels();
      for (int i=0;i<video.pixels.length;i++) {
        color p=video.pixels[i];
        float r = 255-red(p);
        float g = 255-green(p);
        float b = 255-blue(p);
        video.pixels[i] = color(r, g, b);
      }
      video.updatePixels();
    }

    video.loadPixels();
    // craete an opaque image of the same size
    PImage edgeImg = createImage(video.width, video.height, RGB);
    //loop through every pixel in the image
    for (int y=1;y<video.height-1;y++) {//skip top and bottom edges
      for (int x=1;x<video.width-1;x++) {//skip left and right edges
        float r_sum = 0; // red kernel sum of this pixel
        float g_sum = 0; // green kernel sum of this pixel
        float b_sum = 0; // blue kernel sum of this pixel
        for (int ky=-1;ky<=1;ky++) {
          for (int kx=-1;kx<=1;kx++) {
            // calculate the adjacent pixel for this kernel point
            int pos = (y+ky)*width + (x + kx);
            // get value for each color component
            float r_val = red(video.pixels[pos]);
            float g_val = green(video.pixels[pos]);
            float b_val = blue(video.pixels[pos]);
            // multiply adjacent pixels based on kernel value
            r_sum += kernel[ky+1][kx+1] * r_val;
            g_sum += kernel[ky+1][kx+1] * g_val;
            b_sum += kernel[ky+1][kx+1] * b_val;
          }
        }
        //make sure RGB is within range
        r_sum = constrain(r_sum, 0, 255);
        g_sum = constrain(g_sum, 0, 255);
        b_sum = constrain(b_sum, 0, 255);

        if (use_gray) {
          float grayval =(r_sum+g_sum+b_sum)/3.0;
          // for this pixel in the new image set gray
          edgeImg.pixels[y*video.width + x] = color(grayval, grayval, grayval);
        }
        else {
          float old_red = red(video.pixels[y*video.width + x]);
          float old_green = green(video.pixels[y*video.width + x]);
          float old_blue = blue(video.pixels[y*video.width + x]);
          if (use_red) {
            old_red = r_sum;
          }
          if (use_green) {
            old_green = g_sum;
          }
          if (use_blue) {
            old_blue = b_sum;
          }
          edgeImg.pixels[y*video.width + x] = color(old_red, old_green, old_blue);
        }
      }
    }
    edgeImg.updatePixels();
    if (do_neg) {
      edgeImg.loadPixels();
      for (int i=0;i<edgeImg.pixels.length;i++) {
        color p=edgeImg.pixels[i];
        float r = 255-red(p);
        float g = 255-green(p);
        float b = 255-blue(p);
        edgeImg.pixels[i] = color(r, g, b);
      }
      edgeImg.updatePixels();
    }
    image(edgeImg, 0, 0);
  // }      //uncomment this line if used with video
  controlP5.draw();
}

void keyReleased() {
  if (key=='m' || key=='M') {
    showGUI = controlP5.group("menu").isOpen();
    showGUI = !showGUI;
    if (showGUI) controlP5.group("menu").open();
    else controlP5.group("menu").close();
  }
  // if (key == 's' || key == 'S') saveFrame("cv" + "##.jpg"); // uncomment this line if not used as applet
}

void n0(float val) {
  //println("n0 = " + val);
  kernel[0][0] = val;
}
void n1(float val) {
  //println("n1 = " + val);
  kernel[0][1] = val;
}
void n2(float val) {
  //println("n2 = " + val);
  kernel[0][2] = val;
}
void n3(float val) {
  //println("n3 = " + val);
  kernel[1][0] = val;
}
void n4(float val) {
  //println("n4 = " + val);
  kernel[1][1] = val;
}
void n5(float val) {
  //println("n5 = " + val);
  kernel[1][2] = val;
}
void n6(float val) {
  //println("n6 = " + val);
  kernel[2][0] = val;
}
void n7(float val) {
  //println("n7 = " + val);
  kernel[2][1] = val;
}
void n8(float val) {
  //println("n8 = " + val);
  kernel[2][2] = val;
}

void gray(boolean theFlag) {
  use_gray = theFlag;
}
void red(boolean theFlag) {
  use_red = theFlag;
}
void green(boolean theFlag) {
  use_green = theFlag;
}
void blue(boolean theFlag) {
  use_blue = theFlag;
}
void invert(boolean theFlag) {
  do_invert = theFlag;
}
void neg(boolean theFlag) {
  do_neg = theFlag;
}


