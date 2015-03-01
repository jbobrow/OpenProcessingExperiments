

int pilotes=10;

float[] x= new float[pilotes];
float[] y= new float[pilotes];
float[] velocitatx = new float [pilotes];
float[] velocitaty = new float [pilotes];


float midaelipse;

void setup() {
  size(400, 300);
  //inicialitzaciÃ³
  for (int i=0; i<pilotes; i++) {
    x[i] =width/2;
    y[i] =height/2;
    velocitatx[i]=random(1, 5);
    velocitaty[i]=random(1, 5);
  }
  
  midaelipse=20;
}

void draw() {
  //actualitzaciÃ³
  for (int i=0; i<pilotes; i++) {
    x[i]=x[i]+velocitatx[i];
    y[i]=y[i]+velocitaty[i];
    ellipse (x[i], y[i], midaelipse, midaelipse);
    if (x[i]>=width-(midaelipse/2)||x[i]<=0+(midaelipse/2)) {
      velocitatx[i]=-velocitatx[i];
    }
    if (y[i]>=height-(midaelipse/2)||y[i]<=0+(midaelipse/2)) {
      velocitaty[i]=-velocitaty[i];
    }
  }
}

void mouseReleased() {
  background(random(255), random(255), random(255));
  fill(random(255), random(255), random(255));
  midaelipse= random(20,50);
}






