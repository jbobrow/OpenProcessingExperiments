
/**
 * Follow 1  
 * based on code from Keith Peters. 
 * 
 * A line segment is pushed and pulled by the cursor.
 */

int w = 300;
float hz = 4;
int N = 4;

float r = 70;
float[] A = new float[N];
PVector[] m = new PVector[N];


void setup() {

  frameRate(60);
  //size(w*N, w);
  size(1200,300)

  noCursor();

  for(int j=0; j<N; j++){
    m[j] = new PVector(0,0);
  }

}


void draw() {
  background(0);
  

   float i = frameCount % 360*6*hz;
   float a = radians(i);


   for(int j=0; j<N; j++){
    
     if(frameCount % (j+1) == 0){
       A[j] = a;
       if(j*w < mouseX && mouseX < (j+1)*w) m[j].set(mouseX,mouseY);
     }

     strokeWeight(20.0);
     stroke(255, 100);
     float xb = j*w; 
     line(xb,0,xb,height);
  
     noStroke();
       
     resetMatrix();
     translate(j*w + w/2, w/2);
     text(nf(frameRate/(j+1),2,0),0,0);

     rotate(A[j]);
     translate(r,0);
     fill(255);
     ellipse(0, 0, 20,20);
     
     resetMatrix();
     fill(100);
     ellipse(m[j].x, m[j].y, 20,20);
     
   }
    
}
