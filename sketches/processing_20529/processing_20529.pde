
int num = 50;

float[] ypos = new float[num];
float[] speed = new float[num];
color[] myColors = new color[4];
float[] radius = new float[10];
int[] col = new int[num];
int [] radi= new int[num];


void setup() {
  
frameRate(5);
  size(300,300);
  radius[0]=50;
  radius[1]=30;
  radius[2]=15;
  radius[3]=5;
  radius[4]=65;
  radius[5]=75;
  radius[6]=22;
  radius[7]=40;
  radius[8]=45;
  radius[9]=80;

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
    radi[i] = floor(random(0,9));
 
  }
  noStroke();
  smooth();
}

void draw() {
  background(220);
  
  for(int i=0; i<num-1; i++) {
    //use the int from col[] to choose the fill from myColors[]
    fill(myColors[col[i]]);

    //draw the ellipse using ypos[]
    ellipse(width/num * i + width/num, ypos[i], radius[radi[i]], radius[radi[i]]);
    //update ypos[] with speed[]
    ypos[i] = ypos[i] + speed[i]+35;
    radi[i]+=1;
    
    //if the circles go off the screen, reset them
    if(radi[i]>9) radi[i]=0;
    if(ypos[i] > height + radius[radi[i]]/2) ypos[i] = -radius[radi[i]]/2;
    if(ypos[i] < -radius[radi[i]]/2) ypos[i] = height - +radius[radi[i]]/2;
  }
}


