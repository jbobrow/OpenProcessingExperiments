
//D. Lloyd Gray Creation and Computation Sept. 28, 2011
//Arrays:Ten Grey Circles
//A little experiment in addressing hard-coded arrays to draw circles

int[] circDi = {10, 20, 30, 40, 50,60,70,80,90,100};
int[] colour = {20,40,60,80,100,120,140,150,160,170,180, 190,200};

int curColour = 10;
int curDia = 20;
int count = 0;

void setup() {
   background(255);
  size(400,400);
  smooth();
  
} 
  void draw() {

  }

 void mouseClicked(){
     checkCount();
   noStroke();
 curColour = colour[count];//"count" increments the selection of
 //                     the value taken from the array "colour"
 
  curDia = circDi[count];//"count" increments the selection of
 //                     the value taken from the array "circDi"
 
   fill(curColour);//value taken from array "colour"
 //                  used to set fill value
 
 ellipse(mouseX, mouseY, curDia, curDia);//value taken from array "circDi"
 //                                         used to set circle size

 
 count=count + 1;//the count is advanced each time the mouse is clicked, so 
 //                each circle is a differentsize and colour.

  }

 void checkCount(){ 
  if (count>=10){
    count = 0;
  }
}

