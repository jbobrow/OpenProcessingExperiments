
/*Joseph Kotay. Practice Computational Methods. Professor Nick Senseke. Week 6 Lecture Arrays
 *This code is from a previous example Nick provided called aarayDemo.
 *I editted the code to get a spiraling effect, trying to recretae something 
 similar to the Marius Watz composition from the week 4 lecture.*/

int num = 25; //stores number of ellipses
float mySize = 50;
float[] ypos = new float[num];
float[] speed = new float[num];
color[] myColors = new color[4];
int[] col = new int[num];

void setup() {

  size(300,300);
  background(30);
  frameRate(10);

  //assigns colors to the myColors array with varying transparencies.
  myColors[0] = color(80,170,67,random(50,70));
  myColors[1] = color(65,185,54,random(50,70));
  myColors[2] = color(240,100,10,random(50,70));
  myColors[3] = color(180,100,10, random(50,70));

  //use a loop to randomly seed ypos, speed, and col
  for(int i=num-1; i>=0; i--) {
    ypos[i] = random(0,height);
    speed[i] = random(-2,2);
    col[i] = floor(random(0,4));
  }
  noStroke();
  smooth();
}

void draw() {

  // use a transform and ratate the composition so that the ellipses draw a spiral pattern. 

  for(int i=0; i<width/num; i+=2) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(frameCount*radians(2));
    //use the int from col[] to choose the fill from myColors[]
    fill(myColors[col[i]]);
    
    //draw the ellipse using ypos[]
    ellipse(width/num * i + width/num, ypos[i], random(mySize), random(mySize));
    //update ypos[] with speed[]
    ypos[i] = ypos[i] + speed[i];



    if(ypos[i] > height + mySize) ypos[i] = -mySize;
    if(ypos[i] < -mySize) ypos[i] = height - +mySize;
    popMatrix();

    if (frameCount==500) {
      noLoop();
    }
  }
}



