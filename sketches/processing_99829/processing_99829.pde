
int x1 = 250;
int y1 = 250;
int x2 = x1+30;
int y2 = y1+30;
int x3 = x2+30;
int y3 = y2+30;
int x4 = y3+30;

float[] a = new float[100];
float[] b = new float[100];
float[] c = new float[100];
float[] d = new float[100];

void setup() {
  size (1000,400);
  stroke(0);
  background(0);
}
void draw() {
  rect  (x1,y1,20,20);
  rect  (x2,y1,20,20);
  rect  (x3,y1,20,20);
  rect  (x4,y1,20,20);
  if ((mouseX >= x4)&&(mouseX <= (x4 +20))&&(mouseY >= y1)&&(mouseY <= (y1 + 20)) 
    &&(mousePressed)) { 
    background(0);
  }

}
void mousePressed() {
  if ((mouseX >= x1)&&(mouseX <= x1 +20)&&(mouseY >= y1)&&(mouseY <= y1 + 20) 
    &&(mousePressed)) { 
    for(int m=0;m < 100;m++)  {
      a[m]=random(0,1000);
      b[m]=random(0,1000);
      c[m]=random(0,1000);
      d[m]=random(0,1000);  
      stroke(0);
      fill(random(0,255),random(0,255),random(0,255),random(0,255));
      rect(a[m],b[m],m,m) ;
    }
  }
  if ((mouseX >= x2)&&(mouseX <= x2 +20)&&(mouseY >= y1)&&(mouseY <= y1 + 20) 
    &&(mousePressed)) { 
    for(int e=0;e < 100;e++)  {
      a[e]=random(0,1000);
      b[e]=random(0,1000);
      c[e]=random(0,1000);
      d[e]=random(0,1000);  
      stroke(0);
      fill(random(0,255),random(0,255),random(0,255),random(0,255));
      ellipse(a[e],b[e],e,e) ;
    }

  }
  if ((mouseX >= x3)&&(mouseX <= (x3 +20))&&(mouseY >= y1)&&(mouseY <= (y1 + 20)) 
    &&(mousePressed)) { 
    for(int f=0;f < 100;f++)  {
      a[f]=random(0,1000);
      b[f]=random(0,1000);
      c[f]=random(0,1000);
      d[f]=random(0,1000);  
      stroke(0);
      fill(random(0,255),random(0,255),random(0,255),random(0,255));
      quad(a[f],b[f],c[f],d[f],f+10,f+20,f+30,f+40) ;
    }
  }
}




