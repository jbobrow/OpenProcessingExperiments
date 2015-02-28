
int num = 20;
float[] ypos = new float[num];
float[] speed = new float[num];
color[] myColors = new color[4];
int[] col = new int[num];
float [] ballSize = new float[num];

void setup() {

  size(500,500);

  //explicitly add colors to the myColors array
  myColors[0] = color(200,40,35,75);
  myColors[1] = color(65,185,54,75);
  myColors[2] = color(255,217,0,75);
  myColors[3] = color(0,168,255,75);

  //use a loop to randomly seed ypos, speed, and col
  for(int i=num-1; i>=0; i--) {
    ypos[i] = random(0,height);
    speed[i] = random(-5,5);
    col[i] = floor(random(0,4));
    ballSize [i] = random(2,90);

  }
  noStroke();
  smooth();
}

void draw() {
  background(220);
  rectMode(CENTER);
  
  for(int i=0; i<num-1; i++) {
    //use the int from col[] to choose the fill from myColors[]
    fill(myColors[col[i]]);
    //draw the ellipse using ypos[]
    rect(width/num * i + width/num, ypos[i], ballSize [i], ballSize[i]);
    //update ypos[] with speed[]
    ypos[i] = ypos[i] + speed[i];
     ballSize[i]++;
     
    if (ballSize[i] > 90)
    ballSize [i]--;
    ballSize[i] = random(10,90);
    
    if (ballSize[i] < 0)
    ballSize [i]++;
     ballSize[i] = random(10,90);
    
 
    
    //if the circles go off the screen, reset them
    if(ypos[i] > height + ballSize [i]) ypos[i] = -ballSize [i];
    if(ypos[i] < -ballSize [i]) ypos[i] = height - +ballSize [i];

  }
}


