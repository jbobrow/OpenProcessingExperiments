
color dark, lite;
int i;
void setup(){
  size(500,500);
  background(0);
  stroke(0);
  frameRate(10);
}
void draw(){
  lite = color(255,185,0);
  dark = color(64,48,0);
  i = i+1;
  three_digit(i,50,90);
}
  


  
  void hexa(float xbase, float ybase) {
    rect(xbase,ybase+10, 20, 40);
    triangle (xbase, ybase+10, xbase+20, ybase+10, xbase + 10, ybase);
    triangle(xbase, ybase+50, xbase+20,ybase+50,xbase+10,ybase+60);
  }

void rexa(float xbase, float ybase){
  triangle(xbase, ybase+10,xbase+10,ybase, xbase+10, ybase+20);
  rect(xbase+10,ybase,40,20);
  triangle(xbase+50,ybase,xbase+50,ybase+20,xbase+60,ybase+10);
}
void digit(float xbase, float ybase){
  hexa(xbase, ybase+10);
  hexa(xbase,ybase+70);
  rexa(xbase+10,ybase);
  rexa(xbase+10,ybase+60);
  rexa(xbase+10,ybase+120);
  hexa(xbase+60,ybase+10);
  hexa(xbase+60,ybase+70);
}
void one(float xbase,float ybase){
  hexa(xbase+60,ybase+10);
  hexa(xbase+60,ybase+70);
}
void two(float xbase, float ybase){
  rexa(xbase+10, ybase);
  rexa(xbase+10,ybase+60);
  rexa(xbase+10,ybase+120);
  hexa(xbase+60,ybase+10);
  hexa(xbase,ybase+70);
}

void three(float xbase, float ybase){
  rexa(xbase+10,ybase);
  hexa(xbase+60,ybase+10);
  rexa(xbase+10,ybase+60);
  hexa(xbase+60,ybase+70);
  rexa(xbase+10,ybase+120);
}

void four(float xbase, float ybase){
  hexa(xbase,ybase+10);
  rexa(xbase+10,ybase+60);
  hexa(xbase+60,ybase+10);
  hexa(xbase+60,ybase+70);
}

void five(float xbase, float ybase){
  rexa(xbase+10,ybase);
  hexa(xbase, ybase+10);
  rexa(xbase+10,ybase+60);
  hexa(xbase+60,ybase+70);
  rexa(xbase+10,ybase+120);
}

void six(float xbase, float ybase){
  rexa(xbase+10,ybase);
  hexa(xbase, ybase+10);
  rexa(xbase+10,ybase+60);
  hexa(xbase+60,ybase+70);
  rexa(xbase+10,ybase+120);
  hexa(xbase, ybase+70);
}
void seven(float xbase, float ybase){
   hexa(xbase+60,ybase+10);
  hexa(xbase+60,ybase+70);
  rexa(xbase+10, ybase);
}
void eight(float xbase, float ybase){
    hexa(xbase, ybase+10);
  hexa(xbase,ybase+70);
  rexa(xbase+10,ybase);
  rexa(xbase+10,ybase+60);
  rexa(xbase+10,ybase+120);
  hexa(xbase+60,ybase+10);
  hexa(xbase+60,ybase+70);
}

void nine(float xbase, float ybase){
     hexa(xbase, ybase+10);
  hexa(xbase+60,ybase+70);
  rexa(xbase+10,ybase);
  rexa(xbase+10,ybase+60);
  hexa(xbase+60,ybase+10);
}

void zero(float xbase, float ybase){
     hexa(xbase, ybase+10);
  hexa(xbase,ybase+70);
  rexa(xbase+10,ybase);
  rexa(xbase+10,ybase+120);
  hexa(xbase+60,ybase+10);
  hexa(xbase+60,ybase+70);
}

void sel(int n, float xbase, float ybase) {
  fill(lite);
  if (n == 0) {
      zero(xbase,ybase);
  }
  if (n==1) {
    one(xbase,ybase);
  }
  if (n==2) {
    two(xbase,ybase);
  }
  if (n==3){
    three(xbase,ybase);
  }
  if (n==4){
    four(xbase,ybase);
  }
  if (n==5){
    five(xbase,ybase);
  }
  if (n==6){
    six(xbase,ybase);
  }
  if (n==7){
    seven(xbase,ybase);
  }
  if (n==8){
    eight(xbase,ybase);
  }
  if (n==9){
    nine(xbase,ybase);
  }
}
void three_digit(int n, float xbase, float ybase) {
  fill(dark);
  digit(50,90);
  digit(140,90);
  digit(260,90);
  fill(lite);
  rect(xbase+185, ybase+125, 15, 15);
  sel((n/100)%10,xbase,ybase);
  sel((n/10)%10,xbase+90,ybase);
  sel(n%10,xbase+210,ybase);
}



