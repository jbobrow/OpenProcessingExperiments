
PImage  pic;

int num = 600;
float[] ypos = new float[num];
float[] speed = new float[num];
float[] zpos = new float[num];
color[] myColors = new color[4];
float[] radius = new float[10];
int[] col = new int[num];
int [] radi= new int[num];

void setup() {
int d=10;
int t=15;
 pic=loadImage("24.jpg");
color piccolor = pic.get(d,t);
  size(300,300,P3D);
    camera(-300, -10,-400,width/2,height/2,100,0,1,55);
    translate(width/2,height/2,-100);
 
  myColors[0] = piccolor +9;
  myColors[1] = piccolor+70;
  myColors[2] = piccolor+68;
  myColors[3] = piccolor+46;
  d+=8;
  t++;


  for(int i=num-1; i>=0; i--) {
    ypos[i] = random(0,height);
    zpos[i] = random(0,500);
    speed[i] = random(-5,5);
    col[i] = floor(random(0,4));
    radi[i] = floor(random(0,9));
  }

  smooth();
}

void draw() {
  background(25);
  pushMatrix();
  for(int i=0; i<num-1; i++) {
  translate(random(300),ypos[i],zpos[i]);
    fill(myColors[col[i]],90);


   sphere (random(88,300));
    ypos[i] = ypos[i] + speed[i];
     zpos[i] = zpos[i] + speed[i];
    if(ypos[i] > height + radius[radi[i]]/2) ypos[i] = -radius[radi[i]]/2;
    if(ypos[i] < -radius[radi[i]]/2) ypos[i] = height - +radius[radi[i]]/2;
            
  }
}


