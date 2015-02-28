
float mm;
float mf;
int k=200;
int j=10;
int n=10;
float ty = 150;


void setup(){
  size(500,300);
}

void draw(){
  fill(0);
  rect(0,0,width,height);
  int i =frameCount % k; 
  if(i<k/2){
    mm=i/j+n;
    mf=i;
  }else{
    mm=(-1*i+k)/j+n;
    mf=-1*i+k;
  }
  drawtext();
}

void drawtext(){ 
  textSize(mm+20);
  text("s",width/2-200-mm/6,ty-sqrt(mf));
  fill(255);
  textSize(mm+20);
  text("s",width/2-100-mm/6,ty-sqrt(mf));
  textSize(mm*1.5+20);
  text("l",width/2-75-mm/2,ty-sqrt(mf)*2);
  textSize(mm*2+20);
  text("e",width/2-63-mm/3,ty-sqrt(mf)*3);
  textSize(mm*2.2+20);
  text("e",width/2-37-mm/4,ty-sqrt(mf)*4);
  text("p",width/2-14+mm/4,ty-sqrt(mf)*4);
  textSize(mm*2+20);
  text("i",width/2+19+mm/3,ty-sqrt(mf)*3);
  textSize(mm*1.5+20);
  text("n",width/2+28+mm/2,ty-sqrt(mf)*2);
  textSize(mm+20);
  text("g",width/2+55+mm/6,ty-sqrt(mf));
}


