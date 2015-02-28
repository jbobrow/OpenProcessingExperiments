
int die;
final int FACES = 6;

int[] results = new int[FACES];

void setup() {
  reset();
 rollFloor();
}

void reset() {
  results = new int[FACES];
}

void rollRound() {
   for (int i=0; i< 500; i++) {
    die = round(random(0,FACES-1));    
    results[die]++;
  }
}

void rollFloor() {
   for (int i=0; i< 500; i++) {
    die = floor(random(0,FACES));
    results[die]++;
  }
}


void draw() {
  background(202);
  float media=0;
  stroke(0);
  for (int i=0; i< results.length; i++) {
    rect(0,i*height/FACES,results[i], height/FACES); 
    media += results[i];   
  }
  media /= results.length;
  stroke(255, 0, 0, 40);
  line(media, 0, media, height);
  line(media*.5, 0, media*.5, height);
}

void mouseClicked() {
  reset();
  rollFloor();
}

void keyPressed() {
  reset();
  rollRound();
}

                
                
