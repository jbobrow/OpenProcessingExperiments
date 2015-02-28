
int EdgeLength=350;
float angle;
float Theta=0;
float Scaler; //=1/(cos(Theta)+sin(Theta));
int NumLevels=15;

void setup() {
  size(300, 300);
  stroke(0);
  background(255);
  //fill(0, 102, 153,30);
  strokeWeight(3);
  smooth();
}

void draw() {
 //float Theta=mouseX*PI/(2*width);
  //Theta=PI/4 + sin(angle)*PI/5;
  Scaler=1/(cos(Theta)+sin(Theta));
  background(255);
  translate (height/2,width/2);
  rect(-EdgeLength/2,-EdgeLength/2,EdgeLength,EdgeLength);  
  for(int i=0; i<NumLevels; i++){
    rotate (Theta);
    scale (Scaler);
    rect(-EdgeLength/2,-EdgeLength/2,EdgeLength,EdgeLength); 
  } 
 Theta +=.01;
 if (Theta > HALF_PI) { Theta = 0; }

// angle +=.02;
// if (angle > TWO_PI) { angle = 0; }

}

//void circles(int x, int y, int Dx, int Dy ) {
//  ellipse(x, y, 5+Dx, 5+Dy);
//}

