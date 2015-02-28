
float x; //left eye
float y;//right eye
float w;
float q;
float d,f;
float eyelid_x;
float eyelid_y;
float eyelid_dir = 1;
float dx = 0;


float lid_position;
int x_diam=20;
int y_diam=20;

PImage a;


void setup(){
 size (1000,300);
 background (0);
 frameRate(10);
 eyelid_x=width;


 
}

void draw (){
 
  smooth();
// fill (random(255),random(255),random(255));
fill(255);
 noStroke();
 //eyelids
 ellipse (400, 150, 250, 250);
 ellipse (600, 150, 250, 250);
//  arc(105, 105, 100, 50, PI / 2, 3 * PI / 2); // 180 degrees
 x = map (mouseX, 0, width, 360, 430);
 y = map (mouseX, 0, width, 570, 635);
 w = map(mouseX, 0, width, x-25, x+25);
 q = map(mouseX, 0, width, y-25, y+25);
 d = map(mouseX,0 ,width, q-13, q+13);
f = map(mouseX,0 ,width, w-13, w+13);


 
 fill (0);
 ellipse (x, 170, 180, 180);
 ellipse (y, 170, 180, 180);
 fill(255);
 ellipse(x, 170, 100, 100);
 ellipse(y, 170, 100, 100);
 fill(0);
 ellipse(w,170,60,60);
 ellipse(q, 170, 60, 60);
 fill(255);
 ellipse(d, 170, 30, 30);
  ellipse(f, 170, 30, 30);
 

 fill(0);
 lid_position = map (mouseY, 0, height, 0, 300);
 rect(0, 0, width, lid_position);

}

//void mousePressed() {
//eyelid_y+eyelid_dir*1.0;
//eyelid_x+=dx;
//
//fill(0,200,0);
//rect(300,150,50,50);




