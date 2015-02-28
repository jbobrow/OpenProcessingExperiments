
int cat = 0;
int p = 0;


void setup(){
size(600,600);
background(156,156,227);

}

void draw(){

  while (cat < 600){
    noStroke();
    fill(8);
     rect(0,cat,200,20);
     cat = cat+30;
     
  }
  cat = 0;
  
    while (cat < 600){
    noStroke();
    fill(8);
     rect(400,cat,200,20);
     cat = cat+30;
     
  }

}


