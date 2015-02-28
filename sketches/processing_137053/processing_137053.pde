
//A cracy pattern made of concentric circles with random radius and colors
//Concentric circles are generated in such a way that they have allways one point 1 common
//variables to control the draw
// The following variables can be initialized with different values to control the output
float r =(25);
int insideCircles=15;
float factori=3;
int maxBorderWeight=5;
int transparency = 50;
float angleExtra=PI/24;
int loops=1;
// if crazyfactor=0 then the normal behaviour is observed. Un valor de 10, por ejemplo, produce un efecto curioso.
float crazyfactor=0;
// if line = true the radius is drawed
boolean lineT=true;
// factor to Multiply the angle speed of inner circles
float MultAngleSpeed=1.5;

//global variables
color[] palette1 = {#FFD62E,#E8A61D,#FF9B2C,#E8621D,#FF411F};
color[] palette2 = {#D1AC6B,#E8BF6A,#FFC481,#E8956A,#FF8A74};
boolean firstIteration=true;
int numCircles = int((800*600/(4*r*r)));
float[] x1 = new float[numCircles];
float[] y1 = new float[numCircles];
float[] r1 = new float[numCircles];
float[] b1 = new float[numCircles];
float [][] xi = new float[numCircles][insideCircles];
float [][] yi = new float[numCircles][insideCircles];
float [][] ri = new float[numCircles][insideCircles];
float [][] bi = new float[numCircles][insideCircles];
float [][] anglei = new float[numCircles][insideCircles];
float xx,yx,rx;
color[] s1 = new color[numCircles];
color[] f1 = new color[numCircles];
color[][] si = new color[numCircles][insideCircles];
color[][] fi = new color[numCircles][insideCircles];
int i=0;
int j=0;
//init variables
//
void setup () {
  smooth();
  size(int(round(800/r)*r),int(round(600/r)*r));
  //size(200,200);
  //noLoop();
};

void draw() {

float noise = 0;
float angleAdd=angleExtra;
//
background(palette2[0]);
if (firstIteration==true) {
while (i < (numCircles)){
  if (i==0) {
    x1[i] = r;
    y1[i]=r;
    }
  else {
    x1[i]=x1[i-1]+2*r;
    y1[i]=y1[i-1];
    };
  if (x1[i]>width) {
    x1[i]=r;
    y1[i]=y1[i-1]+2*r;
    };
  r1[i]=r;
  b1[i]=random(1,maxBorderWeight);
  s1[i]=palette1[int(random(0,5))];
  f1[i]=palette2[int(random(1,5))];
  i++;
};
//
// array for first ellipses
i=0;

while (i < (numCircles)){
  if (i==0) {
    x1[i]=r;
    y1[i]=r;
    }
  else {
    x1[i]=x1[i-1]+2*r;
    y1[i]=y1[i-1];
    };
  if (x1[i]>width) {
    x1[i]=r;
    y1[i]=y1[i-1]+2*r;
    };
  r1[i]=r;
  b1[i]=random(1,maxBorderWeight);
  s1[i]=palette1[int(random(0,5))];
  f1[i]=palette2[int(random(1,5))];
  i++;
};

//loop for inside ellipses
  i=0;
  j=0;
  while ( i < (numCircles) )  {
  xx=x1[i];
  yx=y1[i];
  //rx=r1[i]-b1[i];  
  rx=r1[i];
  while ( j < insideCircles) {
      anglei[i][j]=random(-PI,PI);
    ri[i][j]=random(rx/factori,rx);
    xi[i][j]=xx+(rx-ri[i][j])*cos(anglei[i][j]);
    yi[i][j]=yx+(rx-ri[i][j])*sin(anglei[i][j]);
    bi[i][j]=random(1,maxBorderWeight/(i+1));
    si[i][j]=(palette1[int(random(0,5))]);
    fi[i][j]=palette1[int(random(1,5))];
    xx=xi[i][j];
    yx=yi[i][j];
    rx=ri[i][j]-bi[i][j];
    j++;
  };
  j=0;
  i++;  
  };
firstIteration=false;
println("initialized vbles");
};
  i=0;
  int escala=scaleFact();
  scale(escala);
   while (i< (numCircles)) {
     if ((x1[i]<(width/escala))&&(y1[i]<(height/escala))) {
     fill(f1[i]);
     strokeWeight(b1[i]/escala);
     stroke(s1[i]);
     ellipse(x1[i],y1[i],2*r1[i],2*r1[i]); 
     }    
     i++;     
  };
  i=0;
  j=0;
  while (i< (numCircles)) {
    if ((x1[i]<(width/escala))&&(y1[i]<(height/escala))) {
    while (j < (insideCircles*mouseY/height)) {
     fill(fi[i][j],transparency);
     strokeWeight(bi[i][j]/escala);
     stroke(si[i][j]);
     //print(xi[i][j]);print(yi[i][j]);print(anglei[i][j]);println("");
     ellipse(xi[i][j],yi[i][j],2*ri[i][j],2*ri[i][j]);
     if (lineT==true) {
       stroke(si[i][j]);
       line(xi[i][j],yi[i][j],xi[i][j]+ri[i][j]*cos(anglei[i][j]),yi[i][j]+ri[i][j]*sin((anglei[i][j])));
       //line(xi[i][j],yi[i][j],xi[i][j]+ri[i][j]*cos(anglei[i][j]+2*PI/3),yi[i][j]+ri[i][j]*sin((anglei[i][j]+2*PI/3)));
       //line(xi[i][j],yi[i][j],xi[i][j]+ri[i][j]*cos(anglei[i][j]+4*PI/3),yi[i][j]+ri[i][j]*sin((anglei[i][j]+4*PI/3)));
     };
     anglei[i][j]=anglei[i][j]+angleAdd;
     angleAdd*=MultAngleSpeed;
      if (crazyfactor > 0) {
      noise=noise(crazyfactor);      
      ri[i][j]=ri[i][j]-noise;
      anglei[i][j]=anglei[i][j]+noise;
      //angleExtra+=noise/100;
      };
     if (j>0) {
       xi[i][j]=xi[i][j-1]+((ri[i][j-1]-bi[i][j-1])-ri[i][j])*cos(anglei[i][j]);
       yi[i][j]=yi[i][j-1]+((ri[i][j-1]-bi[i][j-1])-ri[i][j])*sin(anglei[i][j]);
     } else {
       xi[i][j]=x1[i]+((r1[i]-b1[i])-ri[i][j])*cos(anglei[i][j]);
       yi[i][j]=y1[i]+((r1[i]-b1[i])-ri[i][j])*sin(anglei[i][j]);
     };
      j++;
      };
      j=0;
      }
      i++;      
      angleAdd=angleExtra;      
    };
};

int scaleFact() {
  
  int scaleFact=1;
  if (mouseX<(width/5)) scaleFact=16; 
  if ((mouseX>(width/5)) && (mouseX<(2*width/5))) scaleFact=8;
  if ((mouseX>(2*width/5))&&(mouseX<(3*width/5))) scaleFact=4;
  if ((mouseX>(3*width/5))&&(mouseX<(4*width/5))) scaleFact=2;
  if (mouseX>(4*width/5)) scaleFact=1;
   return(scaleFact);
 
}

void keyPressed() {
	if (key=='s' || key=='S') saveFrame("screenshot-####.png");
        if (key=='c') {
          firstIteration=false;
          crazyfactor+=1;
        }
        if (key=='t') {
          transparency+=10;
        }
        if (key=='b') {
          maxBorderWeight+=1;
          firstIteration=true;
        }
        if (key=='r') {
          transparency=50;
          crazyfactor=0;
          maxBorderWeight=5;
          firstIteration=true;
        }
}

