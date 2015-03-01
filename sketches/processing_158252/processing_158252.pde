
// Processing sketch by Erim Kocatepe // 
// www.erimkocatepe.com //

float rad = 250 ;
float shape = TWO_PI;  
int count = 50;
int forms = 10;
float f;
int seed; 

void setup() { 
  size(600, 600);
  smooth(8);
  noiseDetail(3,0.5);
  strokeWeight(13);
  strokeJoin(MITER);
  noFill();   
}

void draw() {  
    background(255);
    f = frameCount*0.01;
    randomSeed(0);
     
    pushMatrix();
    translate(width/2,height/2);
    
    for (int i = 0; i < forms; i++) {
      float r = map (i,0,forms,count,10);
      noiseSeed(i);
      beginShape();
        for (int n = 0; n < r; n++) {
            float nx = (noise(n + (f * sin(i + 0.3))) * 30) + (map(i,0,forms,rad,0)) ;
            float x = sin(map(n,0,r-2,0,shape)) * nx ;
            float y = cos(map(n,0,r-2,0,shape)) * nx ;
            curveVertex(x,  y);
            //ellipse(x,y,5,5);
          }
        endShape(CLOSE);
       
    }
 popMatrix(); 
 //saveFrame("color-######.png");
}



