
/*
QUICK SORT PIXELS

 Adam Ferriss *** 2012-2013 *** www.adamferriss.com *** aferriss@gmail.com
 ************************************************************************* 
 *This code is provided as is, no warranty is given. Use at your own risk.
 *
 *This program is free software: you can redistribute it and/or modify
 *it under the terms of the GNU General Public License as published by
 *the Free Software Foundation, either version 3 of the License, or
 *(at your option) any later version.
 *
 *This program is distributed in the hope that it will be useful,
 *but WITHOUT ANY WARRANTY; without even the implied warranty of
 *MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *GNU General Public License for more details.
 *
 *You should have received a copy of the GNU General Public License
 *along with this program.  If not, see <http://www.gnu.org/licenses/>.
 ************************************************************************* 
  
  A quicksort algorithm is used to sort through sets of pixels. 
  A number of different color threshold options have been included for experimentation and variety of results.
  
  Please feel free to contact me if you have any questions or make any variations of this program.
  
  Controls:
  1: sorts by brightness
  2: sorts by hue
  3: sorts by saturation
  4: sorts by red
  5: sorts by green
  6: sorts by blue
  
  +: increases threshold value in increments of 5
  -: decreases threshold value in increments of 5
  
  click and drag to paint in a secondary image if supplied in img2
  a: increases brush size
  s: decreases brush size
  
  r: resets image
  
  spacebar: take a screenshot
  
*/

PImage img, img2;
String filename = "leafyS.jpg";
String filename2 = "image11_47_45.png";

//General Settings
boolean briSort = true; //sort by brightness, press 1 to activate
boolean hueSort = false; //sort by hue, press 2 to activate
boolean satSort = false; //sort by saturation, press 3 to activate

boolean redSort = false; //sort by red value, press 4 to activate
boolean greenSort = false; //sort by green value, press 5 to activate
boolean blueSort = false; //sort by blue value, press 6 to activate

int thresh = 125; //value to threshold pixels agains, +/- to increase by increments of 5
int mSize = 50;  //size of img2 to paint in



//press r to reset image

void setup() {
  img = loadImage(filename); //main image to sort
  img2 = loadImage(filename2); //secondary image to paint in
  size(500, 500);
  image(img, 0, 0);
}

void draw() {
 
 loadPixels();

 for (int y = 0; y < img.height -1; y+=1) {    
   for (int x = 0; x< img.width -1; x+=1) {
      int loc = x + (y*width); // pixel location
      int currColor = img.pixels[loc];
      
      //get rgb valuess
      int r = (currColor >> 16) & 0xFF;
      int g = (currColor >> 8) & 0xFF;
      int b = currColor & 0xFF;
      
      //get hsb values
      float bri = brightness(currColor);    
      float h = hue(currColor);
      float sat = saturation(currColor);

     
      if(briSort){
       if(bri>thresh ){         
       quicksort(pixels, loc, loc+1);
       }
      }
      
      if(hueSort){
       if(h>thresh ){         
       quicksort(pixels, loc, loc+1);
       }
      }

      if(satSort){
       if(sat>thresh ){         
       quicksort(pixels, loc, loc+1);
       }
      }

      if(redSort){
       if(r>thresh ){         
       quicksort(pixels, loc, loc+1);
       }
      }

      if(greenSort){
       if(g>thresh ){         
       quicksort(pixels, loc, loc+1);
       }
      }

      if(blueSort){
       if(b>thresh ){         
       quicksort(pixels, loc, loc+1);
       }
      }
    
    }//end of x loop
  } //end of y loop

updatePixels();

}









void keyPressed() {  // save frame with spacebar
  if (key == ' ') {
    save( "image"+hour()+"_"+minute()+"_"+second()+".png");
    println("saved");
  }
  
  
  if (key == 'a' || key == 'A') {
    mSize+=5;
    println("boxSize="+mSize);
  }
  
    
  if (key == 's' || key == 'S') {
    mSize-=5;
    println("boxSize="+mSize);
  }
  
  if (key =='=' || key == '+'){
  thresh+=5;
  println("thresh="+thresh);
  }
  
  if (key =='-' || key == '_'){
  thresh-=5;
  println("thresh="+thresh);
  }
  
  if (key =='1'){  // 1 = briSort
  briSort = true;
  hueSort = false;
  satSort = false;
  redSort = false;
  greenSort = false;
  blueSort = false;
  println("briSort active!"+"\nthresh="+thresh);
  }

  if (key =='2'){ // 2 = hueSort
  briSort = false;
  hueSort = true;
  satSort = false;
  redSort = false;
  greenSort = false;
  blueSort = false;
  println("hueSort active!"+"\nthresh="+thresh);
  }

  if (key =='3'){ // 3 = satSort
  briSort = false;
  hueSort = false;
  satSort = true;
  redSort = false;
  greenSort = false;
  blueSort = false;
  println("satSort active!"+"\nthresh="+thresh);
  }

  if (key =='4'){ //4 = redSort
  briSort = false;
  hueSort = false;
  satSort = false;
  redSort = true;
  greenSort = false;
  blueSort = false;
  println("redSort active!"+"\nthresh="+thresh);
  }

  if (key =='5'){ // 5 = greenSort
  briSort = false;
  hueSort = false;
  satSort = false;
  redSort = false;
  greenSort = true;
  blueSort = false;
  println("greenSort active!"+"\nthresh="+thresh);
  }

  if (key =='6'){ // 6 = blueSort
  briSort = false;
  hueSort = false;
  satSort = false;
  redSort = false;
  greenSort = false;
  blueSort = true;
  println("blueSort active!"+"\nthresh="+thresh);
  }
  
  if(key == 'r'){
  image(img,0,0);
  } 
}
void mouseDragged(){
  copy(img2,mouseX, mouseY, mSize,mSize,mouseX,mouseY, mSize,mSize);
}
//the partition and pivot for quicksort
int partition(int[] a, int l, int r) { 
  int i = l;
  int j = r;
  int temp;
  int pivot = a[(i+j)/2];
  while (i<=j) {
    while (a[i] < pivot) {
      i+=1;
    }
    while (a[j] > pivot) {
      j-=1;
    }
    if (i <= j) {
      temp = a[i];
      a[i] = a[j];
      a[j] = temp;
      i++;
      j--;
    }
  }
  return i;
}

//quicksort implements pivot partition
void quicksort(int x[], int left, int right) {
  int index = partition(x, left, right);
  if (left < index - 1) {
    quicksort(x, left, index-1);
  }
  if (index > right) {
    quicksort(x, index, right);
  }
}



