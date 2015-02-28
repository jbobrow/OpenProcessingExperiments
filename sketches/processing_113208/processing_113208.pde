

// HUI Wang Chuen 53077809
// CMS3 Coding for interactivity
// Assignment 3
// I choose Task 1 (Base on the “Sequential” example......)

// Photo credits: All the photos shown in this assignment come from
// Alfred Hitchcock's film "PYSCHO", including "psycho.jpg"
// "psycho2.jpg","psycho3.jpg","psycho4.jpg","psycho5.jpg",
// "psycho6.jpg","psycho7.jpg","psycho8.jpg","psycho9.jpg",
// "psycho10.jpg","psycho11.jpg","psycho12.jpg".


// Coding for reference :
// http://processing.org/examples/sequential.html
// http://processing.org/reference/mousePressed.html
// http://processing.org/reference/modulo.html
// http://processing.org/reference/else.html
// week2 lecture notes : "if, else if, else (cont’)"
// week2 lecture notes : "BOOLEAN EXPRESSION"
// week2 lecture notes : "Iteration"
// week4 lecture notes : "IMAGE"


int numFrames = 12;  // the numer of frames in this motion video / 
int frame = 0; // set a variable as frame = 0 ; 
PImage[] images = new PImage[numFrames]; // Declare that the image I PUT INSIDE as the frames shown up in this motion video



void setup() {
size(720,360);  // display window's size
frameRate (70); // fps
images[0]  = loadImage("psycho1.jpg"); // the following images put inside are defined as image[].
images[1]  = loadImage("psycho2.jpg");
images[2]  = loadImage("psycho3.jpg");
images[3]  = loadImage("psycho4.jpg");
images[4]  = loadImage("psycho5.jpg");
images[5]  = loadImage("psycho6.jpg");
images[6]  = loadImage("psycho7.jpg");
images[7]  = loadImage("psycho8.jpg");
images[8]  = loadImage("psycho9.jpg");
images[9]  = loadImage("psycho10.jpg");
images[10]  = loadImage("psycho11.jpg");
images[11]  = loadImage("psycho12.jpg");
}
 
void draw()
{
 frame = (frame+1) % numFrames; // the rule of running the images, except 0, (1,2,3,4,5,6,7,8,9,10,11)%12=(1,2,3,4,5,6,7,8,9,10,11), however, if no +1, only images[0] will be shown up in the process, as the outcome of loop is 0%12=0 forever.
 if ((frame) % numFrames >= 12) // this conditional is to stop the above mathematical loop (11,12,13,14,15,16,17.....), if the final frame is images[11]  = loadImage("psycho12.jpg"),
 {frame = 0;} // set value 12 in order to show up all image, including images[11], if the value is greater than or equal to 12, it breaks the loop and redefine the value of frame as 0, 
 image(images[frame], 0, 0); // so that, we can loop all the images everytime without deadtime.

       
if (mouseX <= 20 && mouseY <380)  // if the mouse go to specific region, a specific static images / motion video will be shown up
{image(images[frame], 0, 0);textSize(10);text("P  S  Y  C  H  O", 330, 200); fill(255, 255, 255);} 
else if (mouseX <= 60 && mouseY <=360)
{image(images[9],0,0) ;} 
else if (mouseX <= 120 && mouseY <=360)
{image(images[8],0,0) ;} 
else if (mouseX <= 180 && mouseY <=360)
{image(images[5],0,0) ;} 
else if (mouseX <= 240 && mouseY <=360)
{image(images[1],0,0) ;} 
else if (mouseX <= 300 && mouseY <=360)
{image(images[3],0,0) ;} 
else if (mouseX <= 360 && mouseY <=360)
{image(images[10],0,0) ;} 
else if (mouseX <= 420 && mouseY <=360)
{image(images[7],0,0) ;} 
else if (mouseX <= 480 && mouseY <=360)
{image(images[6],0,0) ;} 
else if (mouseX <= 540 && mouseY <=360)
{image(images[2],0,0) ;} 
else if (mouseX <= 600 && mouseY <=360)
{image(images[4],0,0) ;} 
else if (mouseX <= 660 && mouseY <=360)
{image(images[11],0,0) ;} 
else if (mouseX <= 720 && mouseY <=360)
{image(images[frame], 0, 0);textSize(10);text("P  S  Y  C  H  O", 330, 200); fill(255, 255, 255);} 


}



