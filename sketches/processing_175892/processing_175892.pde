

float col, col2, col3;
float randEl;

void setup(){
size(500, 500);
background(0);
smooth();
noStroke();
col = 0.1;
col2 = 0.1;
col3 = 0.1;
}

void draw(){
  
fill(noise(col)*255, noise(col2)*255, noise(col3)*105);
//translate(width/2, height/2);
for( int i = 10; i < 500 ; i+=10){
  for(int j = 10; j < 500 ; j+=10){
    randEl = random(0.1, 10);
ellipse(i, j, randEl, randEl);
  }
}



col += random(0, 0.1);
col2 += random(0, 0.1);
col3 += random(0, 0.1);
}


