
int pix = 6;
int top = 200;
int[] tone;
int[] dirs;
PFont myfont;


void setup(){
  size(1000,800);
  tone = new int[4];
  dirs = new int[4];
  tone[0] = top;
  tone[1] = top/2;
  tone[2]= top/2;
  tone[3] = 0;
  dirs[0] = -1;
  dirs[1] = -1;
  dirs[2] = 1;
  dirs[3] = 1;

  myfont = createFont("helvetica",100);
}

void draw(){

  for (int i=0; i < 4; i++){
    strokeWeight(pix);
    for (int j=i*pix; j<height; j += pix*4){
      stroke(tone[i]);
      line(0,j,width/2,j);
      stroke(top-tone[i]);
      line(width/2,j,width,j);
    }
    tone[i] += dirs[i];
    if (tone[i] == top || tone[i] == 0){
      dirs[i] = dirs[i] * -1;
    }
  }

  textFont(myfont);
  textAlign(CENTER);
  fill(255);
  text("up",width/4,height/2);
  fill(0);
  text("down",3*width/4,height/2);
}





