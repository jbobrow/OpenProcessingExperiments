
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
  size (450,500);
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
    for(int i=0;i < 100;i++)  {
      a[i]=random(0,300);
      b[i]=random(0,400);
      c[i]=random(200,400);
      d[i]=random(0,400);  
      stroke(0);
      fill(2*i,4*i,3*i,1*i);
      rect(a[i],b[i],i,i) ;
    }
  }
  if ((mouseX >= x2)&&(mouseX <= x2 +10)&&(mouseY >= y1)&&(mouseY <= y1 + 20) 
    &&(mousePressed)) { 
    for(int e=0;e < 100;e++)  {
      a[e]=random(0,400);
      b[e]=random(0,400);
      c[e]=random(0,400);
      d[e]=random(0,400);  
      stroke(0);
      fill(e,1*e,3*e,2*e);
      ellipse(a[e],b[e],e,e) ;
    }

  }
  if ((mouseX >= x3)&&(mouseX <= (x3 +30))&&(mouseY >= y1)&&(mouseY <= (y1 + 20)) 
    &&(mousePressed)) { 
    for(int f=0;f < 100;f++)  {
      a[f]=random(0,400);
      b[f]=random(0,400);
      c[f]=random(0,300);
      d[f]=random(0,400);  
      stroke(0);
      fill(1*f,2*f,9*f,1*f);
      triangle(a[f],b[f],c[f],d[f],f+10,f+20) ;
    }
  }
}
