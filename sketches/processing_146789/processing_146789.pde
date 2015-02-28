

float rando = 25;
int x = 0;

void setup(){
  size(500,500);
  translate(50,50);
  repeatShape();
}

void draw(){
}

void repeatShape(){  
  noStroke();
  for (int i=0; i < 25; i++){
    rando = random(5,75);
    fill(255,0,0);
    ellipse(0,0,rando,rando);    
    translate(100,0);
    x++;
    if (x == 5){
      x = 0;
      translate(-500,100);  
    }
  }
}


