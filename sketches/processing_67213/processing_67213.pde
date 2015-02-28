
color [ ]c =  new color [20];

color fillColor;

int w;
int h;
int a;

int [] xpos = new int [20];
int [] graphHeight = new int [20];

void setup(){
 size (500, 500);
  frameRate (30);
  noStroke ();
  smooth();
  background(90);

a=20;
w=20;
 


//set colors for graph chart

c[0] = color (255, 51, 163);
c[1] = color (201, 0, 153);
c[2] = color (51, 0, 102);
c[4] = color (255, 102, 102);
c[5] = color (255, 0, 102);
c[6] = color (204, 0, 51);
c[7] = color (255, 0, 102);
c[8] = color (35, 0, 13);
c[9] = color (255, 0, 163);
c[10] = color (163, 0, 10);
c[11] = color (25, 0, 2);
c[12] = color (22, 0, 252);
c[13] = color (2, 0, 102);
c[14] = color (0, 0, 204);
c[15] = color (5, 0, 102);
c[16] = color (51, 0, 46);
c[17] = color (5, 88, 2);
c[18] = color (204, 0, 204);
c[19] = color (15, 87, 10);


graphHeight [0] = -9*a;
graphHeight [1] = 9*a;
graphHeight [2] = a;
graphHeight [3] =-2*a;
graphHeight [4] =6*a;
graphHeight [5] =2*a;
graphHeight [6] =4*a;
graphHeight [7] =5*a;
graphHeight [8] =9*a;
graphHeight [9] =4*a;
graphHeight [10] =7*a;
graphHeight [11] =-7*a;
graphHeight [12] =5*a;
graphHeight [13] =-5*a;
graphHeight [14] =-2*a;
graphHeight [15] =-6*a;
graphHeight [16] =7*a;
graphHeight [17] =-3*a;
graphHeight [18] =7*a;
graphHeight [19] =9*a;



}


void draw (){
  
  for(int x=0; x<20; x++){
    xpos[x] = x*w +40;
    
    fill (c[x]);
    rect (xpos[x], 250-graphHeight[x], w, graphHeight[x]);
  }
}


