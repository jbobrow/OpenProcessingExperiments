
//A Pop art image based on a camera iris shutter
// Press mouse button to close the shutter
// Use buttons 1 2 3 to change colour
// Press S to save a series of images.
// by Jeremy Smith Processing on Coursera Week 3


color[] mycolours = { #F51111, #11F511,#1111F5};
color[] palette = mycolours;
int number=0;
int colour=0;

//Setup

void setup(){
 size(800, 600);
//I nead this command else wont work on my win7 pc
// frame.setResizable(true);

 background(#f0f0f0);
}

//Draw code block
void draw(){
}
void mousePressed() {
  stroke(10);
  fill(palette[colour]);
  pushMatrix();
  translate(width/2,height/2);
  for(int i = 0; i <= width; i += 22) { 
    rotate(mouseY*radians(i*4));
    triangle(mouseX, 50, mouseY, -width, 50, mouseY/3); 
  }
  popMatrix();
}

void keyPressed(){
  if(key == 's' || key=='S'){
    String s = "image" + number+".png";
    save(s);
    number++;
    println("Saved "+s);
  }
  if (key=='1') {
    colour=0;
  }
  if (key=='2') {
    colour=1;
  }
  if (key=='3') {
    colour=2;
  }
}


