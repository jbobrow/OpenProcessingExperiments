
int x1 = 250;
int y1 = 370;
int x2 = x1+30;
//int y2 = y1+30;
int x3 = x2+30;
//int y3 = y2+30;
int x4 = x3+30;

float[] a = new float[75];
float[] b = new float[75];
float[] c = new float[75];
float[] d = new float[75];

void setup() {
  size (400,400);
  stroke(0);
  background(0);
}
void draw() {
  ellipse (x1+10,y1+10,20,20);
  ellipse (x2+10,y1+10,20,20);
  ellipse (x3+10,y1+10,20,20);
  ellipse (x4+10,y1+10,20,20);
  fill(255,255,255,30);
  if ((mouseX >= x4)&&(mouseX <= (x4 +20))&&(mouseY >= y1)&&(mouseY <= (y1 + 20)) 
    &&(mousePressed)) { 
    background(0);
  }

}
void mousePressed() {
  if ((mouseX >= x1)&&(mouseX <= x1 +20)&&(mouseY >= y1)&&(mouseY <= y1 + 20) 
    &&(mousePressed)) { 
    for(int i=0;i < 75;i++)  {
      a[i]=random(0,400);
      b[i]=random(0,400);
      c[i]=random(0,400);
      d[i]=random(0,400);  
      stroke(0);
      fill(2*i,0,3*i,0.75*i);
      rect(a[i],b[i],i,i*1.5) ;
    }
  }
  if ((mouseX >= x2)&&(mouseX <= x2 +20)&&(mouseY >= y1)&&(mouseY <= y1 + 20) 
    &&(mousePressed)) { 
    for(int e=0;e < 75;e++)  {
      a[e]=random(0,400);
      b[e]=random(0,400);
      c[e]=random(0,400);
      d[e]=random(0,400);  
      stroke(0);
      fill(e,1*e,3*e,2*e);
      ellipse(a[e],b[e],e*random(0,4),e*random(0,2)) ;
    }

  }
  if ((mouseX >= x3)&&(mouseX <= (x3 +20))&&(mouseY >= y1)&&(mouseY <= (y1 + 20)) 
    &&(mousePressed)) { 
    for(int f=0;f < 75;f++)  {
      a[f]=random(0,400);
      b[f]=random(0,400);
      c[f]=random(0,400);
      d[f]=random(0,400);  
      stroke(0);
      fill(1*f,3*f,0.5*f,1*f);
      triangle(a[f]*random(0,30),b[f]*random(0,30),c[f]*random(0,30),d[f]*random(0,30),f+10*random(0,30),f+20*random(0,30)) ;
    }
  }
}




