

int Ver = 4;
int Hor = 4;  //int Length = Ver * Hor; number of eyes in the background
int r2 = 1;
int circleSize = 52;
 
int[] X = new int[Ver];
int[] Y = new int[Ver];
 
int[] Color = new int[Ver];
 
void setup(){
  size(300,300); //size of the sketch
  colorMode(HSB,100,100,100);
  smooth();
  frameRate(15);
 
 
  for(int i=0; i<Ver; i++){
    for(int j=0; j<Hor; j++){
      X[i] = (i * 70) + 35;
      Y[j] = (j * 70) + 35;
      Color[i] = int(random(359));
    } 
  } 
}
 
void draw(){
  background(432); //background color 
 
  for(int i=0; i<Ver; i++){
    for(int j=0; j<Hor; j++){
      draweye(i, j);
    }
  }
}
 
void draweye(int i, int j){
  pushMatrix(); //to control rotate 
 
  translate(X[i], Y[j]); // displaying eyes X[i] amount left and right , Y[j] amount up and down 
  rotate(atan2(mouseY - Y[j], mouseX - X[i])); //angle parameter is mouseY - Y[j] and  mouseX - X[i] and rotating by this angle 
 
  float congestion = dist(mouseX, mouseY, X[i], Y[j]);
  float dist_max = dist(0, 0, 200, 200);
 
  ellipseMode(CORNER); // position and coloring of ellipses
  noStroke();
  fill(172,70,97);
   ellipse(0, 0, 20, 20);
  fill(0,0, 99);
  ellipse(4, 0, 10,10) ;
  fill(0);
  ellipse(5, 0, 5,5) ;
 
  popMatrix();
   
  fill(r2);

  ellipse( mouseX, mouseY, circleSize+(abs(pmouseX - mouseX)*5), circleSize+(abs(pmouseX - mouseX)*5)); // to make the stroke grow in size instead of the circle
  println("r2 = " + r2);
    fill((r2)/4*1+r2, r2, 5, 5);

  
}


