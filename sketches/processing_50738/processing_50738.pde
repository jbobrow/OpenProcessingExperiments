
//////////////////////////////////
// Bokeh Tester
//////////////////////////////////
// copyright: Daniel Erickson 2012
import controlP5.*;

int CONTROL_WIDTH = 100;
int CONTROL_HEIGHT = 10;
int CONTROL_SPACING = 2;

ControlP5 controls;

PVector[][] bokehTones;
PVector[][] imgTones;
float[][] imgBokeh;

int oldbokeh = 100;
public int BOKEH = 0;

int oldimage = 100;
public int IMAGE = 0;

PVector[][] loadColors(PImage newImg) {
    newImg.loadPixels();
    PVector[][] newColors = new PVector[newImg.width][newImg.height];
    for (int x=0; x<newImg.width; x++) {
        for (int y=0; y<newImg.height; y++) {
            color col = newImg.pixels[y*newImg.width+x];
            newColors[x][y] = new PVector(red(col), green(col), blue(col));
        }
    }
    return newColors;
}

float[][] loadTones(PImage newImg) {
    newImg.loadPixels();
    float[][] newTones = new float[newImg.width][newImg.height];
    for (int x=0; x<newImg.width; x++) {
        for (int y=0; y<newImg.height; y++) {
            color c = newImg.pixels[y*newImg.width+x];
            float tone = (red(c)+green(c)+blue(c))/3.0;
            newTones[x][y] = tone;
        }
    }
    return newTones;
}

boolean PROCESSING = false;
int current_y = 0;

PVector[][] convolute(PVector[][] signal1, float[][] signal2, int y) {
    PVector[][] convolution = new PVector[signal1.length][signal1[0].length];
    for (int x=0; x<convolution.length; x++) {
        //for (int y=0; y<convolution[0].length; y++) {
            convolution[x][y] = new PVector(0, 0, 0);
        //}
    }
    for (int x=0; x<signal1.length; x++) {
        //for (int y=0; y<signal1[0].length; y++) {
            float total = 0;
            for (int i=0; i<signal2.length; i++) {
                for (int j=0; j<signal2[0].length; j++) {
                    int sample_x = x - i + signal2.length / 2;
                    int sample_y = y - j + signal2[0].length / 2;
                    if (sample_x > 0 && sample_x < signal1.length && sample_y > 0 && sample_y < signal1[0].length) {
                        convolution[x][y].add(PVector.mult(signal1[sample_x][sample_y], signal2[i][j]));
                        total += signal2[i][j];
                    }
                }
            }
            convolution[x][y].mult(1/total);
        //}
    }
    return convolution;
}

void setup() {
    size(700, 400);
    
    int y = CONTROL_SPACING;
    controls = new ControlP5(this);
    controls.addSlider("BOKEH", 0, 7, BOKEH, 5, y+=CONTROL_SPACING+CONTROL_HEIGHT, 100, CONTROL_HEIGHT);
    controls.addSlider("IMAGE", 0, 3, IMAGE, 5, y+=CONTROL_SPACING+CONTROL_HEIGHT, 100, CONTROL_HEIGHT);

}

void draw() {
    if (PROCESSING) {
        bokehTones = convolute(imgTones, imgBokeh, current_y);
        for (int x=0; x<width; x++) {
            //for (int y=0; y<height; y++) {
                PVector col = bokehTones[x][current_y];
                stroke(col.x, col.y, col.z);
                point(x, current_y);
                stroke(255-col.x, 255-col.y, 255-col.z);
                point(x, current_y+1);
            //}
        }
        if(current_y++ >= imgTones[0].length-1) {
            PROCESSING = false;
        }
    } else if (BOKEH != oldbokeh || IMAGE != oldimage) {
        if (IMAGE != oldimage) {
            PImage img;
            if (IMAGE == 0) {
                img = loadImage("image1.jpg");
            } else if (IMAGE == 1) {
                img = loadImage("image2.jpg");
            } else if (IMAGE == 2) {
                img = loadImage("image3.jpg");
            } else if (IMAGE == 3) {
                img = loadImage("image4.jpg");
            } else if (IMAGE == 4) {
                img = loadImage("image5.jpg");
            } else {
                img = loadImage("image2.jpg");
            }
            
            imgTones = loadColors(img);
            oldimage = IMAGE;
        }
        
        if (BOKEH != oldbokeh) {
            PImage bokeh;
            if (BOKEH == 0) {
                bokeh = loadImage("bokeh0.jpg");
            } else if (BOKEH == 1) {
                bokeh = loadImage("bokeh1.jpg");
            } else if (BOKEH == 2) {
                bokeh = loadImage("bokeh2.jpg");
            } else if (BOKEH == 3) {
                bokeh = loadImage("bokeh3.jpg");
            } else if (BOKEH == 4) {
                bokeh = loadImage("bokeh4.jpg");
            } else if (BOKEH == 5) {
                bokeh = loadImage("bokeh5.jpg");
            } else if (BOKEH == 6) {
                bokeh = loadImage("bokeh6.jpg");
            } else if (BOKEH == 7) {
                bokeh = loadImage("bokeh7.jpg");
            } else if (BOKEH == 8) {
                bokeh = loadImage("bokeh8.jpg");
            } else {
                bokeh = loadImage("bokeh2.jpg");
            }
            imgBokeh = loadTones(bokeh);
            oldbokeh = BOKEH;
        }
        
        PROCESSING = true;
        current_y = 0;
    }
}

