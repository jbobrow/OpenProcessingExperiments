
/* Stage 1: Pixel Rearrangement Poem
* author: Ramy Gorgis
* date: Sept 7, 2013
* This exercise is about understanding the pixels[] array and how to work with it
* Try playing with the startPointW,startPointH,portionW,portionH variables and
* see what happens
*
*
* Function calls learned in this sketch:
* 1) loadPixels(), updatePixels(), pixels[]
* 2) color(r,g,b)
* 3) image()

* This code is left intentionally uncommented so students can
* figure out what it is doing by executing the sketch and playing with it
* @pjs preload="pic1.jpg"; */
import java.util.*;

PImage img;
int startPointW,startPointH,portionW,portionH;
void setup(){
  size(700,499); //set the size of the screen to be the same as our image
  img=loadImage("pic1.jpg");
 
  startPointW=width/4;
  startPointH=height/4;
  portionW=width/2;
  portionH=height/2;
  
  img.loadPixels();
  for (int i=startPointW; i <startPointW+portionW; i++) { 
    for (int j=startPointH; j <startPointH+portionH; j++) { 
      img.pixels[i+j*height] = color(255, 0, 0); 
    } 
  }
  img.updatePixels();

}
void draw(){
  background(color(0,125,222));
  image(img,0,0);
}

void keyPressed() {
   if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
}

String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}




