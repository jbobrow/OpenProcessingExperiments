
//many thanks to JohnGruen.
//He really steered me towards the light. 

final int MAX = 300;

float[] x = new float[MAX];
float[] y = new float[MAX];
float dia[] = new float[MAX];
float xInc[] = new float[MAX];
float yInc[] = new float[MAX];
color c[] = new color[MAX];

void setup() {
 size(600,600);
 smooth();
 noStroke();
 for(int i = 0; i < MAX; i++) {
   x[i] = random(0,width);
   y[i] = random(0,height);
   dia[i] = random(5,50);
   xInc[i] = random(-2,2);
   yInc[i] = random(-2,2);
   c[i] = color(random(255),random(255),random(255));
 }

}

void draw() {  
    fill(0,5);
    rect(0,0,width,height);
  for(int i = 0; i < MAX; i++) {

     fill(c[i]);

     ellipse(x[i],y[i],dia[i],dia[i]);

     if(x[i] > width || x[i] < 0) {
       xInc[i] = -xInc[i];
     }

     if(y[i] > height || y[i] < 0) {
       yInc[i] = -yInc[i];
     }

     x[i]+=xInc[i];
     y[i]+=yInc[i];

 }
}

