
float x = 0.; 
float y = 0.; 
float range = 50;
float t = 0.; 
float t1 = 0.; 
float a=0; 
float b=0;



int num = 12; 

float[] pos = new float[num]; 
float[] var = new float[num];
float[] wiggle = new float[num];

void setup() {
  frameRate(30);
  size(800, 800);
  background(0);  
  for (int i = 0; i<num; i++) {  
    pos[i]=(i*width/num+((width/num)/2)); 
  }
  for (int i = 0; i<num; i++) {
    var[i]=random(0.9, 2.); 
  }
  for (int i = 0; i<num; i++) {
    wiggle[i]=random(5); 
  }
}

void draw() {
  fill(150,120,100); 
  noStroke();
  rect(0, 0, 800, 800);
  fill(255);

  for (int i = 0; i<num; i++) {
    moveShapes(pos[i], (y*var[i])%height, wiggle[i]); 
  }

  t=t+0.01;
  y++;
}

void moveShapes(float x, float y, float t1) {
  shape(y,map(noise(t+t1), 0., 1., x-range, x+range));
  shape(map(noise(t+t1), 0., 1., x-range, x+range),y);
}

void shape(float x, float y) {
 
  stroke(x*0.5+150,y*0.2+100,(x+y)*0.5,20);
  fill(x*0.5-100,y*0.2+150,(x+y)*0.5+150,20);
  triangle(x, y, 258, 320, 386, 375);
  triangle(x, y, 486, 675, 486, 275);
  triangle(x, y, 350, 400, 486, 275);
  triangle(x, y, 400, 600, 486, 675);
  triangle(x, y, 386, 375, 486, 275);
  fill(225,10);
  triangle(x, y, 350, 400, 486, 675);
  triangle(x, y, 200, 600, 400, 600);
  triangle(x, y, 486, 675, 200, 600);
  noFill();
  triangle(x, y, 350, 400, 386, 375);
  triangle(x, y, 200, 600, 400, 600);
  triangle(x, y, 350, 400, 200, 600);
  triangle(x, y, 400,600, 386, 375);
  fill(225,1);
  
}
