
//loaded image name
PImage bg;
//float variable name
float mouse;
//interger variable name
int a; 

void setup() 
{
//size of screen image  
size(280,280);
//for smooth outlines of shapes  
smooth();
//this states the existence of the mouse and mouseover  
mouse = dist(0,0,width,height);
//"bg" for background image
//loaded image must be in the same folder as the processing code
bg = loadImage("http://www.prlog.org/11810315-dr-seuss-the-lorax-movie-poster2.jpg");
  
}

void draw() 
{

//loading the image and the coordinates of the image 
  image(bg,0,0);

  for(int i = 0; i <= width; i += 20) {
//j begins at 0 on the y-axis, j is less than  the height, j+=70 is the size of the circles    
   for(int j = 0; j <= height; j += 70) {
//this determins the location of the mouse and maps it to follow
      float size = dist(mouseX, mouseY, i, j);
//this determins the size of the circles
      size = size/mouse * 150;
//stating the existence and size of the circles
      triangle(j,size,size,i,j,size);
      ellipse(j,i,size,size);
      rect(j,i,size,size);
//the number canges the intensity of the vibration. the colours pass through the width of the shapes
  a = (a + 500)%(width);
//this gives the colour of the outlines of the circles
//subtracting the variable values form the RGB colour values it gives a variety of colours
  stroke(296-j, 204-a, 0-a);
}
  }
}
                
                
