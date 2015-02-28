
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
  size (400,400);
  stroke(0);
  background(0);
}
void draw() {
  rect  (x1,y1,30,20);
  rect  (x2,y1,30,20);
  rect  (x3,y1,30,20);
  rect  (x4,y1,30,20);
  if ((mouseX >= x4)&&(mouseX <= (x4 +20))&&(mouseY >= y1)&&(mouseY <= (y1 + 20)) 
    &&(mousePressed)) { 
    background(0);
  }

}
void mousePressed() {
  if ((mouseX >= x1)&&(mouseX <= x1 +20)&&(mouseY >= y1)&&(mouseY <= y1 + 20) 
    &&(mousePressed)) { 
    for(int i=0;i < 100;i++)  {
      a[i]=random(0,400);
      b[i]=random(0,400);
      c[i]=random(0,400);
      d[i]=random(0,400);  
      stroke(255);
       stroke(random(255),random(255),random(255),100);
        strokeWeight(2.0);
strokeCap(PROJECT); 
      fill(2*i,4*i,3*i,1*i);
      fill(random(255),4*i,3*i,1*i);
     
      rect(a[i],b[i],mouseX,i) ;
    }
  }
  if ((mouseX >= x2)&&(mouseX <= x2 +20)&&(mouseY >= y1)&&(mouseY <= y1 + 20) 
    &&(mousePressed)) { 
    for(int e=0;e < 100;e++)  {
      a[e]=random(0,400);
      b[e]=random(0,400);
      c[e]=random(0,400);
      d[e]=random(0,400); 
     strokeWeight(2.0);
strokeCap(ROUND); 
      stroke(255,255,255);
      stroke(random(255),random(255),random(255),100);
     fill(98,242,28,100);
     fill(random(255),242,random(255),random(255));
      ellipse(a[e],b[e],e,e) ;
    }

  }
  if ((mouseX >= x3)&&(mouseX <= (x3 +20))&&(mouseY >= y1)&&(mouseY <= (y1 + 20)) 
    &&(mousePressed)) { 
    for(int f=0;f < 100;f++)  {
      a[f]=random(0,200);
      b[f]=random(0,40);
      c[f]=random(0,400);
      d[f]=random(0,100);  
      stroke(0);
      strokeCap(ROUND); 
       stroke(random(255),random(255),random(255),100);
      fill(1*f,2*f,9*f,1*f);
      fill(random(255),random(255),9*f,1*f);
     
      triangle(a[f],b[f],c[f],d[f],f+10,f+20) ;
    }
  }
}




