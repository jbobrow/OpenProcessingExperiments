
void setup(){
size(600,600);// Define display window size
background(0);//Declare the background color
smooth();// Draw all geometry with smooth

}
int dx=30,dy=30; //set the distance between each rectangles(horizontal and vertical rows)

void draw(){
 
for (int y=5;y<=height; y=y+dy){ //set the horizontal rows of squares
  for (int x=5;x<=width;x=x+dx){//set the vertical rows of squares
    
    if (x<300){
     fill(random(255),random(255),random(255));//fill the rectangles in random colors
     }
     else{
     fill(random(200,255),random(255),random(255));//fill the rectangles in random colors
    }
    rect(x,y,20,20); //Draw rectangles full of the window
    noStroke();//rectangles with no stroke
    frameRate(10);//set the number of frames to be displayed in every second
  }
}
    
    
  }






