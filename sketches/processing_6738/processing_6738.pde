
int Ver = 10;
int Hor = 10;
//int Length = Ver * Hor;

int[] X = new int[Ver];
int[] Y = new int[Ver];

int[] Color = new int[Ver];

void setup(){
  size(700,700);
  colorMode(HSB,359,100,100);
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
  background(300);

  for(int i=0; i<Ver; i++){
    for(int j=0; j<Hor; j++){
      draweye(i, j);
    }
  }
}

void draweye(int i, int j){
  pushMatrix();

  translate(X[i], Y[j]);
  rotate(atan2(mouseY - Y[j], mouseX - X[i]));

  float congestion = dist(mouseX, mouseY, X[i], Y[j]);
  float dist_max = dist(0, 0, 200, 200);

  ellipseMode(CENTER);
  noStroke();
  fill(172,70,97);
  //fill(Color[i],70,97);
  ellipse(0, 0, 20, 20);
  //  fill(359, 0, 99);
  fill(0,0, 99);
  ellipse(4, 0, 10,10) ;
  fill(0);
  ellipse(5, 0, 5,5) ;

  popMatrix();
}














