
int x1 = 10;
int y1 = 350;
int x2 = x1+30;
int y2 = y1+30;
int x3 = x2+30;
int y3 = y2+30;
int x4 = x3+30;
int x5 = x4+30;
float[] a = new float[100];
float[] b = new float[100];
float[] c = new float[100];
float[] d = new float[100];

float x[] = new float [500];
float y[] = new float [500];
float xx1[] = new float [500];
float yx1[] = new float [500];
float line[] = new float [500];
boolean xover = false;
boolean yover = false;
int radians = 360;
float [] cos_vals = new float [radians];
float [] tan_vals = new float [radians];
float r = random (10,10);
float angulo=20;
int i=0;


void setup() {
  size (400,400);
  stroke(0);
  background(0);
  smooth();
}
void draw() {
  ellipse  (x1,y1,20,20);
  ellipse  (x2,y1,20,20);
  ellipse  (x3,y1,20,20);
  ellipse  (x4,y1,20,20);
  ellipse  (x5,y1,20,20);
  xover = true; 
    yover = true;
  

}
void mousePressed() {
  if ((mouseX >= x1)&&(mouseX <= x1 +20)&&(mouseY >= y1)&&(mouseY <= y1 + 20) 
    &&(mousePressed)) { 
    for(int i=0;i < 100;i++)  {
      a[i]=random(0,400);
      b[i]=random(0,300);
      c[i]=random(0,200);
      d[i]=random(0,400);  
      stroke(0);
      fill(0+i,1*i,0+i+i,4*i);
      rect(c[i]-1,i,a[i],d[i]-1) ;
    }
  }
  if ((mouseX >= x2)&&(mouseX <= x2 +20)&&(mouseY >= y1)&&(mouseY <= y1 + 20) 
    &&(mousePressed)) { 
    for(int e=0;e < 100;e++)  {
      a[e]=random(0,400);
      b[e]=random(0,200);
      c[e]=random(0,200);
      d[e]=random(0,300);  
      stroke(0);
      fill(100,0,e,2*e);
      triangle(d[e],e,c[e],e,a[e],1) ;
    }

  }
  if ((mouseX >= x3)&&(mouseX <= (x3 +20))&&(mouseY >= y1)&&(mouseY <= (y1 + 20)) 
    &&(mousePressed)) { 
    for(int f=0;f < 100;f++)  {
      a[f]=random(0,300);
      b[f]=random(0,300);
      c[f]=random(300,400);
      d[f]=random(0,200);  
      stroke(0);
      fill(0,100,0,f);
      //quad(c[f], d[f], b[f], d[f], d[f], a[f], d[f], d[f]);
      ellipse(a[f],c[f],d[f],b[f]) ;
    }
  }
  if ((mouseX >= x4)&&(mouseX <= (x4 +20))&&(mouseY >= y1)&&(mouseY <= (y1 + 20)) 
    &&(mousePressed)) { 
   
    stroke(0,200,10,100);//verde
    for(i=0;i<500;i++)
    {
      //circulo pintando
     xx1[i] = 200 + (50* tan(angulo));
    yx1[i] = 200 + (50* cos(angulo));
    angulo=angulo+0.01;
   line(200, 200, xx1[i], yx1[i]);  
  }
   stroke(0,0,100,100);//zul
    for(i=0;i<500;i++)
    {
      //pacman pintando
     xx1[i] = 100 + (50* sin(angulo));
    yx1[i] = 100 + (50* cos(angulo));
    angulo=angulo+0.01;
   line(100, 100, xx1[i], yx1[i]);  
  }
     
  } 
  
 if ((mouseX >= x5)&&(mouseX <= (x5 +20))&&(mouseY >= y1)&&(mouseY <= (y1 + 20)) 
    &&(mousePressed)) { 
    background(0);
  }
}
