
int items = 500;
float x1[] = new float[items];
float y1[] = new float[items];
float x2[] = new float[items];
float y2[] = new float[items];
float x3[] = new float[items];
float y3[] = new float[items];
int wts[] = new int[items];
int fallRate[] = new int[items];
int xMotion[] = new int[items];

void setup() {
  size(500,500);
  int x = 20; 
  int y = (int)random(500);
  for (int i=0; i<items; i++){
    x1[i] = (int)random(width);
    y1[i] = (int)random(height);
    wts[i] = (int) random(20) + 10;
    fallRate[i]= (int) random(5)-2;
    xMotion[i] = (int) random(3)-1;
    if (fallRate[i]==0) {
      if ((int)random(2)== 0) fallRate[i] = 1;
      else fallRate[i] = -1;
    }
    x2[i] = x;
    y2[i] = y+40;
    x3[i] = x;
    y3[i] = y+80;
    x = x + 30;
  }
}

void draw(){
  background(255);
  float alpha1=200;
  float alpha2=100;
  float alpha3=40;
  float red = 200;
  float green =1 ;
  float blue = 1;
  for (int i=0; i<items; i++){
    stroke(red-y1[i],green*mouseX,blue*(y1[i]/2),alpha1);
    strokeWeight(wts[i] + mouseY/10);
    point(x1[i],y1[i]);
    stroke(red,green,blue,alpha2);
    point(x2[i],y2[i]);
    stroke(red,green,blue,alpha3);
    point(x3[i],y3[i]); 
  }
  for (int i=0; i<items;i++){
    x3[i] = x2[i];
    y3[i] = y2[i];
    x2[i] = x1[i];
    y2[i] = y1[i];
    x1[i] = x1[i]+ xMotion[i];
    y1[i] = y1[i]+ fallRate[i];
    if (y1[i]>height) y1[i] = 0;
    if (y1[i]<0) y1[i] = height;
    if (x1[i] > width) x1[i] = 0;
    if (x1[i] < 0) x1[i] = width;
    //if (mouseX > pmouseX) x1[i] = x1[i] + (int)random(3);
    //if (mouseX < pmouseX) x1[i] = x1[i] - (int)random(3);
  }
}


