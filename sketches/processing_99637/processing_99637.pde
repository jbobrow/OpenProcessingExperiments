
int x1 = 250;
int y1 = 250;
int x2 = x1+30;
int y2 = y1+30;
int x3 = x2+30;
int y3 = y2+30;
int x4 = y3+30;
int y4 = x3+30;
int x5 = y4+30;

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
  rect  (x1,y1,20,20);
  rect  (x2,y1,20,20);
  rect  (x3,y1,20,20);
  rect  (x4,y1,20,20);
  rect  (x5,y1,20,20);
  if ((mouseX >= x5)&&(mouseX <= (x5 +20))&&(mouseY >= y1)&&(mouseY <= (y1 + 20)) 
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
      stroke(0);
      fill(2*i,8*i,3*i,1*i);
      rect(a[i],b[i],i,i) ;
    }
  }
  if ((mouseX >= x2)&&(mouseX <= x2 +20)&&(mouseY >= y1)&&(mouseY <= y1 + 20) 
    &&(mousePressed)) { 
    for(int e=0;e < 100;e++)  {
      a[e]=random(0,400);
      b[e]=random(0,400);
      c[e]=random(0,400);
      d[e]=random(0,400);  
      stroke(0);
      fill(5*e,1*e,3*e,2*e);
      ellipse(a[e],b[e],e,e) ;
    }

  }
  if ((mouseX >= x3)&&(mouseX <= (x3 +20))&&(mouseY >= y1)&&(mouseY <= (y1 + 20)) 
    &&(mousePressed)) { 
    for(int f=0;f < 100;f++)  {
      a[f]=random(0,400);
      b[f]=random(0,400);
      c[f]=random(0,400);
      d[f]=random(0,400);  
      stroke(0);
      fill(1*f,2*f,15*f,1*f);
      
       beginShape(POLYGON);
  vertex(a[f]+c[f]/4,b[f]);
  vertex(a[f]+c[f],b[f]+d[f]/4);
  vertex(a[f]+c[f]/2,b[f]+d[f]/2);
  vertex(a[f]+c[f],b[f]+3*d[f]/4);
  vertex(a[f]+c[f]/2,b[f]+d[f]);
  vertex(a[f]+3*c[f]/4,b[f]+3*d[f]/4);
  vertex(a[f]+c[f]/4,b[f]+d[f]/2);
  vertex(a[f]+3*c[f]/4,b[f]+d[f]/4);
  vertex(a[f]+c[f]/4,b[f]);
  endShape();
    }}
     if ((mouseX >= x4)&&(mouseX <= x4 +20)&&(mouseY >= y1)&&(mouseY <= y1 + 20) 
    &&(mousePressed)) { 
    for(int g=0;g < 100;g++)  {
      a[g]=random(0,400);
      b[g]=random(0,400);
      c[g]=random(0,400);
      d[g]=random(0,400);  
      stroke(0);
      fill(23*g,8*g,15*g,1*g);
      triangle(a[g],b[g],c[g],d[g],g+10,g+20) ;
    }
  }
  }



