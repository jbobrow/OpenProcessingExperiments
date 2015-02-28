
float a;
int speed=15;
float b =150;
float c = 7;   
float incr = 0.002;
int d=1;
   PImage img;
void setup()
{
  size(800, 800);
  smooth();
  noStroke();
  ellipseMode(CENTER);
   img = loadImage("Purity _2.jpg");
}
   
void draw()
{
  //image(img, 0, 0);
  image(img, 0, 0, width, height);

 // background(0);
  translate(width/2, height/2);
   
  a += incr;
  for(int s = 0; s < speed; s++)
  {
    
    fill(190,19,229,30);
    
    if(mousePressed==true){
     
      fill(132,247,10,30);
    }
     
    rotate(a);
     fill(255, 0, 0, 18);   
    ellipse(mouseX-100, mouseY-400,mouseX+400, mouseY+100);
     fill(250, 146, 10, 10);
    ellipse(mouseX-20, mouseY-300, mouseX+100, mouseY+100);
     fill(255, 255, 0, 10);
    ellipse(mouseX-10, mouseY-150, mouseX+200, mouseY+200);
     fill(0, 255, 0, 10);
    ellipse(mouseX+60, mouseY, 100, 100);
     fill(0, 0, 255, 10);
    ellipse(mouseX+80, mouseY, 100, 100);
     fill(140, 10, 250, 10);
    ellipse(mouseX+100, mouseY, 100, 100);
     fill(255, 0, 244, 10);
    ellipse(mouseX+120, mouseY, 100, 100);
 

  }
}
void mousePressed() {  // this is called an "event listener" it runs when you click
 background(random(100),random(100),random(100)); // and refreshes the background to white
}

