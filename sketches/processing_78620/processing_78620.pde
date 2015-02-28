
int timer = 0;
PImage img;
PImage bg;
void setup () {
  size(500,500);

 img = loadImage("Gums_Monster.png");
 bg = loadImage("FUCK!.jpg");
}
  
// Click within the image to change 
// the value of the rectangle

int value = 0;
 


void draw() {
fill(value);
  image(img,-7,-145);
{
  
  timer +=3;
 

if (mousePressed == true) {
  line(mouseX,mouseY,250,100);
  stroke(#F00000);
  

    fill(0);
  } else {
      if(timer >100){
  background(bg);
  timer =0;
    fill(255);
  }
 
  }
}


  /* 

void mouseClicked() {
line(mouseX,mouseY,250,100);
  stroke(#F00000);
  

  if (value == 1) {
    value = 255;
  } else {
    
    
    value = 1;
  }
  
}

  */
// Click within the image to change 
// the value of the rectangle

}


