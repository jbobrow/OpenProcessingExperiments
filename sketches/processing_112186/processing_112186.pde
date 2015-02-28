
void setup(){
  //Sets the size to 600
   size(600,600);
   //calls the drawBackground function
   colourBackground();
   //calls the drawCircle function
   drawCircle();
}

void drawCircle(){ 
  //takes away the outline, colours it orange and draws circle
  noStroke ();
 //creates the sun shape
  fill(255,251,15);
  ellipse(300,550,500,500);
    strokeWeight(15);
    stroke(255,251,15);
    line(300,600,0,590);
    line(300,600,10,500);
    line(300,600,20,400);
    line(300,600,35,300);
    line(300,600,85,200);
    line(300,600,190,150);
    line(300,600,300,130);
    line(300,600,600,590);
    line(300,600,590,500);
    line(300,600,580,400);
    line(300,600,565,300);
    line(300,600,515,200);
    line(300,600,410,150);
}

//loop to create a gradient background, each line is a lighter colour
void colourBackground(){
  int red = 214;
  int pointX = 0;
  int pointY= 0;
  int endX= 600;
  int endY= 0;
  
  for (int i=0; i<height; i++){
   //sets the widht of the line
    strokeWeight(15);
    //sets the colour 10 darker
    red = red-10;
    stroke(red,255,255);
    //moves the line down
    pointY = pointY + 10;
    endY = endY + 10;
    line(pointX,pointY,endX,endY);
  }
}
