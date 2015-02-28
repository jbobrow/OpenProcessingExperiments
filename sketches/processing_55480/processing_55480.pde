
// by Saarah Saghir, YSDN 1006

//variables used:
float i=0;                    // laying out the elements horizontally
float j=0;                    // " " " vertically
float r3=random(12);          // random sizes of the rect/circles
float r3a=random(16);         // more randomness!!
float r3b=random(8);          // have to use more than one value for each element you want to randomize, or they'll all end up with the same value
float b=100;                  // changes transparency of white overlay gradually
float rot=50;                 // defines rotation of the 'eraser'

void setup() {
  size(700, 400); 
  smooth();                   //turns on anti-aliasing
  frameRate(10);
  ellipseMode(CENTER);
  background(240);
} 
 
void draw() {
  //b if statement (for stroke colours)   
    b=b-1;
    if (b<0) {
    b=100; }
    
  //white background redraw
    fill(255,20);         
      rect(0,0,800,800);     // redraw background as white, but lower opacity

  //colored circles   
      for(  float i=20; i<width+1; i=i+700-random(100)  )   // add certain interval to i, as long as it is less than width
        {for(  float j=20; j<height+1; j=j+400-random(100) )  // add         "           " to j, "      "
        {
          strokeWeight( random(60,200) );
          stroke( random(100+mouseX), 100, 100+r3b, 10+r3b+mouseY );    //color of stroke depends on mouse location and i&j values, and random values
          rect( i+mouseX+random(100), j+mouseY-60, 10+r3, 10+r3, random(10), random(30) );  //size and shape of rectangle changes depending on mouse location and other random values...I discovered by accident that adding a 3rd and 4th coordinate completely changes the shape!!
        }
        }
    
  //white squares overlay      
    for( float i=0; i<width+50; i=i+90 ) 
      {for( float j=0; j<height+50; j=j+90 )
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



