
//Abstract symmetry

//Simmetry is a basic feature of human perception
//In most cases if we see simmetrical object we think it is beautiful

//I invite you to explore the beauty of reflection with my sketch
//If you want to change colour schemes or background, move mouse fastly, gently or with short gestures
//Every time you will see spectacular pattern

/* MOUSE
Move pressed mouse UP and DOWN to draw lines

KEYBOARD
C or c to clear the canvas
S or s to save screenshot

keys 1-2 to switch white-magenta palette
keys 3-4 to switch white-yellow palette
B or b to cycle through four backgrounds
*/

//Global variables

//import the sound library
import ddf.minim.*;

//declare a sound variable type
Minim minim; //class is written in capital, variable is written in lower case
//type AudioSample
AudioSample bip;

//declare a PImage variable type
PImage[] backgroundImages = new PImage[4]; //create an array with image-type variables, [4] means that in the array there wiil be 4 values
int imgCounter = 0; //count the number of image place in the array

//palettes for shapes
color[] stroke_palette = {color(255, 255, 255, 5), color(232, 12, 122, 5)};     //white, magenta
color[] stroke_palette_2 = {color(232, 12, 122, 5), color(255, 255, 255, 5)};   //magenta, white
color[] stroke_palette_3 = {color(255, 242, 77, 5), color(255, 255, 255, 5)};   //yellow, white
color[] stroke_palette_4 = {color(255, 255, 255, 5), color(255, 242, 77, 5)};   //white, yellow
//5 - alfa to add smooth transparenсy
color[] palette = stroke_palette; //to be able to switch arrays of palettes on demand

void setup() {

    //initial parameters of a canvas
    size(1200, 600);
    noFill();
    background(0);

    //load sound used for switching palettes
    minim = new Minim(this);
    bip = minim.loadSample("bip.mp3");

    //load the background
    for (int i = 0; i < 4; i++){
        //create a name of picture relativaly to names of files,
        //nf(i,1) : i - index of picture, 1 - how much number will be in name, in my case I need file name with one number in the end
        backgroundImages[i] = requestImage("wallpaper" + nf(i, 1) + ".jpg");
    }
}

void draw() {
    //evaluations of coordinates
    int halfWidth = width / 2;
    int halfHeight = height / 2;

    if (mousePressed) {
        //large central shape
        strokeWeight(2);
        stroke(palette[0]);
        beginShape();
        vertex(0, halfHeight);
        vertex(halfWidth, mouseY);
        vertex(width, halfHeight);
        vertex(halfWidth, (halfHeight - mouseY) + halfHeight);
        endShape(CLOSE);

        //set of lines
        strokeWeight(1);
        stroke(palette[1]);
            //left reflection
        line(0, 3 * mouseY / 4, halfWidth, height - mouseY / 2);
        line(0, height - 3 * mouseY / 4, halfWidth, mouseY / 2);
            //right reflection
        line(width, 3 * mouseY / 4, halfWidth, height - mouseY / 2);
        line(width, height - 3 * mouseY / 4, halfWidth, mouseY / 2);

        //small central shape
        beginShape();
        vertex(3 * halfWidth / 4, halfHeight);
        vertex(halfWidth, halfHeight - mouseY / 2);
        vertex(5 * halfWidth / 4, halfHeight);
        vertex(halfWidth, halfHeight + mouseY / 2);
        endShape(CLOSE);
    }
}

//working with keyboard
void keyReleased() {
    if (key == 'c'|| key == 'C') background(0);
    if (key == 's' || key == 'S') saveFrame("screenshot.png");
    if (key == '1' || key == '2' || key == '3' || key == '4') {
        bip.trigger();
        println("sample triggered");
    }

    if (key == 'b' || key == 'B') { //chenge background pictures in order from "wallpaper0.jpg" to "wallpaper1.jpg"
        if (imgCounter == 4) imgCounter = 0;
        image(backgroundImages[imgCounter], 0, 0);
        imgCounter ++;
    }

    switch (key) {
        case '1': //change palette
            palette = stroke_palette_2;
            println("palette is switched");
            break;
        case '2':
            palette = stroke_palette; //change palette to default
            println("palette is switched back");
            break;
        case '3':
            palette = stroke_palette_3; //change palette to yellow palette
            println("palette is switched to yellow palette");
            break;
        case '4':
            palette = stroke_palette_4; //change palette to yellow palette
            println("palette is switched to yellow palette");
            break;
    }
}

