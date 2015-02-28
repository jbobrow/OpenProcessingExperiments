
/*
My sketch is a very simple one. It has the background of our 
masterpiece our class created. My sketch also has 4 circles, 2 triangles 
and 3 squares. The colors for these shapes are red, green and blue, 
respectively. As the mouse moves, the shapes are given different shades
of their color. Another feature is the "Ista 301" text. When you click
the mouse and drag it, the color is changed to different shades of dark gray!

*/


void setup(){
PImage img;
size(500,300);
img = loadImage("lewitt.jpg");
background(img);

}
int value = 0;
int val2 = 0;

void draw(){
 textSize(32);
 fill(val2);

 text("ISTA_301", mouseX, mouseY);
  fill(value,0,0);
  ellipse(100,width/20,50,50);
  ellipse(200,width/20,50,50);
  ellipse(300,width/20,50,50);
  ellipse(400,width/20,50,50);
  
  
  fill(0,0,value);
  rect(130,height - 50,50,50);
  rect(230,height - 50,50,50);
  rect(330,height - 50,50,50);


  fill(0,value,0);
  triangle(30, height/2, 58, 20, 80, height/2);
  triangle(width - 80, height/2, width - 58, 20, 470, height/2);

  
  
  
}

void mouseDragged() {
  val2 = val2 + 5;
  if (val2 > 255) {
    val2 = 0;
  }
}

void mouseMoved() {
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}


