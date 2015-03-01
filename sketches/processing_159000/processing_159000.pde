
//joseph albers interaction of color - color value, hues

int timer = 0;
float rand1a = 0;
float rand1b = 0;
float rand2a = 0;
float rand2b = 0;
float rand3a = 0;
float rand3b = 0;
float rand4a = 0;
float rand4b = 0;
float bw = 0;
float check = 0;
float bw2 = 100;
float check2 = 0;


void setup() {
  size(700,700);
  
}

void draw(){
  if (timer > 6) {

  background(255-rand1a);
  fill(rand1a);
  triangle(0,0,0,800,800,800);
  rand1a = random(255);
  rand1b = random(255);
  rand2a = random(100);
  rand2b = random(100);
  rand3a = random(100);
  rand3b = random(100);
  rand4a = random(100);
  rand4b = random(100);
  noStroke();
  fill(155+bw,155+bw,0);
  rect(75+(bw2*.5),75+(bw2*.5),200,200);
  fill(0,155+bw2,155+bw2);
  rect(375-(bw*.5),75+(bw*.5),200,200);
  fill(155+bw,0,155+bw);
  rect(375-(bw2*.5),375-(bw2*.5),200,200);
  fill(155+bw2,155+bw2,155+bw2);
  rect(75+(bw*.5),375-(bw*.5),200,200);
  timer = 0;
  }
  else{
    timer = timer +1;
    
  }
  if (check==0){
    if (bw < 100){
      bw = bw+1;
    }
    else{ check=1;
  }
  }
  else{
    if (bw>0){
      bw = bw-1;
    }
    else{ check=0;
    }
  }
  
  if (check2==0){
    if (bw2 < 100){
      bw2 = bw2+1;
    }
    else{ check2=1;
  }
  }
  else{
    if (bw2>0){
      bw2 = bw2-1;
    }
    else{ check2=0;
    }
  }
}


