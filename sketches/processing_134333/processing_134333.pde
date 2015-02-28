
//Naomi Rauch Feb. 15, 2014
//

float x = 460; //x coordinate of rectangle for gift
float y = 220; //y coordinate of rectangle for gift
float w =100; //width of gift
float h = 100; //height of gift
float ybow=0.5*h; //half of height to draw bow
float xbow=0.5*w; //half of width to draw bow
PFont font; //for font in text box pg 85 in text

void setup() {
  size(1000, 500);
  font = loadFont("ArialNarrow-Italic-48.vlw"); //uploaded font!
  textFont(font);
  smooth();
  stroke (0);
}
    
void draw () {
  strokeWeight(1);
  background(0,255,0);
  text("Click on the Gift!", 20, 20,500,100); //write directions for interaction on screen
  
  if ((mouseX > x) && (mouseX < x+w) && (mouseY > y) && (mouseY < y + h)){
    fill (0);
    rect(x,y,w,h); //draw rectangle 
    stroke(255,0,0); //red 
// Drawing bow
    strokeWeight(8);

    line(x,y+ybow,x+w,y+ybow); //horizontal wrapping
    line(x+xbow,y,x+xbow,y+h); //vertical wrapping
//start of topper
    strokeWeight(8);
    line(x+xbow,y,x+xbow,y-30); 
    line(x+xbow,y,x+xbow+20,y-30);
    line(x+xbow,y,x+xbow+25,y-15);
    line(x+xbow,y,x+xbow-20,y-30);
    line(x+xbow,y,x+xbow-25,y-15);
    if (mousePressed == true){
       background(204);
       text("Surprise!", x, y+ybow,500,100);
       for(int i = 0; i<=width; i+=40){//top border **BONUS
         fill(255);
         ellipse(i,0,40,40);
       }
       for(int j = 0; j<=height; j+=40){//left side border
         ellipse(0,j,40,40);
       }
       for(int i = 0; i<=width; i+=40){//bottom side border
         ellipse(i,height,40,40);
       }
       for(int j = 0; j<=height; j+=40){//right side border
         ellipse(width,j,40,40);
       }
    }
  } else {
    fill (255);
  rect(x,y,w,h);
  stroke(0,0,255);
// Drawing present
  strokeWeight(8);

  line(x,y+ybow,x+w,y+ybow); //horizontal wrapping
  line(x+xbow,y,x+xbow,y+h); //vertical wrapping
//Drawing bow
  strokeWeight(8);
  line(x+xbow,y,x+xbow,y-30); 
  line(x+xbow,y,x+xbow+20,y-30);
  line(x+xbow,y,x+xbow+25,y-15);
  line(x+xbow,y,x+xbow-20,y-30);
  line(x+xbow,y,x+xbow-25,y-15);

    }
}


