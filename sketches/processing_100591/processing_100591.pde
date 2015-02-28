
void setup(){
size(400, 400);
noStroke();
}

int i=0;
int speedi = 10;
int speedj= -10;
int k=0;
int q=0;

void draw(){
     if (i<400){
      i=i+speedi;
        background(50, 50, 50);
  frameRate(24);
    stroke(255);
    strokeWeight(2);
    fill(0, 0, 0, 0);
    frameRate(24);
    ellipse(i, 100, i/2, i/2);
   }
    
    else{i=i+40*speedj;
      background(50, 50, 50);
  frameRate(24);
    stroke(255);
    strokeWeight(2);
    fill(0, 0, 0, 0);
    frameRate(24);
    ellipse(i+speedj, 100, i/2, i/2);
   }
laurenAction(60, 40);
}

void laurenAction(int x, int y){
noStroke();

    for(int q=0; q<400; q=q+1){
    float l=random(255);
    float m=random(255);
    float n=random(255);
    float p=random(255);
    fill(l, m, m, p);
    rect(q, 300, x, y);
  }

  for(int i=0; i<400; i=i+1){
    float l=random(255);
    float m=random(255);
    float n=random(255);
    float p=random(255);
    fill(l, m, n, p);
    
    float r=random(400);
    fill(l, m, m, p);
    rect(i, 200, x, y);
    
  }
  
    for(int k=0; k<400; k=k+5){
    float l=random(255);
    float m=random(255);
    float n=random(255);
    float p=random(255);
    fill(m, n, l, p);
    rect(k, 250, x, y);
  }
  
      for(int k=0; k<400; k=k+1){
    float l=random(255);
    float m=random(255);
    float n=random(255);
    float p=random(255);
    fill(m, n, l, p);
    rect(k, 50, x, y/15);
  }
}


