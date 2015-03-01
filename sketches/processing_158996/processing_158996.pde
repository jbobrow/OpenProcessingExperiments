
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


void setup() {
  size(700,700);
  
}

void draw(){
  if (timer > 2) {

  background(255-bw);
  fill(bw);
  triangle(0,0,0,800,800,800);
  rand1a = random(100);
  rand1b = random(100);
  rand2a = random(100);
  rand2b = random(100);
  rand3a = random(100);
  rand3b = random(100);
  rand4a = random(100);
  rand4b = random(100);
  noStroke();
  fill(155+rand1a,155+rand2b,0);
  rect(75+(rand1a*.5),75+(rand1b*.5),200,200);
  fill(0,155+rand2a,155+rand2b);
  rect(375+(rand2a*.5),75+(rand2b*.5),200,200);
  fill(155+rand3a,0,155+rand3b);
  rect(375+(rand3a*.5),375+(rand3b*.5),200,200);
  fill(155+rand4a,155+rand4a,155+rand4b);
  rect(75+(rand4a*.5),375+(rand4b*.5),200,200);
  timer = 0;
  }
  else{
    timer = timer +1;
    
  }
  if (check==0){
    if (bw < 255){
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
}


