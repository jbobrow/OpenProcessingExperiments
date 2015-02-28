
// by Saarah Saghir, YSDN 2015
float i=0;                    // laying out the elements horizontally
float j=0;                    // " " " vertically
float r3=random(12);          // random sizes of the rect/circles
float r3a=random(16);         // more randomness!!
float r3b=random(8);        // have to use more than one value for each element you want to randomize, or they'll all end up with the same value
float a=10;
float b=100;
float rot=50;

void setup() {
  size(300, 300); 
  smooth();                   //turns on anti-aliasing
  frameRate(10);
  rectMode(CENTER);
  ellipseMode(CENTER);
  background(240);
} 
 
void draw() {
    fill(255,20);         
      rect(350,3500,770,770);   // redraw background as white, but lower opacity
/*----------------------------------------------------------------
                                     colored circles
             --------------------------------------------------------------------*/
   
   for(float i=20; i<width+1; i=i+150+random(200))
  {for(float j=20; j<height+1; j=j+300-random(200))
    {
      strokeWeight(random(60,200));
      fill(250-r3,250,250, random(60,100));
      stroke(random(100+mouseX),100,100+r3b,10+r3b+mouseY);
        rect(i+mouseX+30, j-mouseY+30, 10+r3, 10+r3, random(10), random(30));
    }
  }
 
  //8 8 23, 10 0 38, 6 28 1, 3 28 28, 12 35 35, 10 16 8
  b=b-1;
    if (b<0) {
      b=100; }
/*----------------------------------------------------------------
                                     white squares overlay
             --------------------------------------------------------------------*/
     for(float i=0; i<width+50; i=i+90) 
    {for(int j=0; j<height+50; j=j+90)
      {
        strokeWeight(20);
        stroke(240,b);
        fill(0,0);
        rect(i, j, 70, 70, r3, r3, r3a, r3a);
      }
    }
} 

void mouseDragged() 
{
  translate(mouseX+random(100),mouseY+random(100));
  rotate(rot);                    // white "eraser"
  strokeWeight(50);
  stroke(240, 90);
  strokeCap(SQUARE);
  line(0,0,300,0);
  rot = rot + .1;
}

void keyPressed() {              //pause
  if (key == 's') {
      saveFrame("filename-####.png");
    }
    else {
        noLoop();
    }
}
void keyReleased() {            //play
  loop();
}



