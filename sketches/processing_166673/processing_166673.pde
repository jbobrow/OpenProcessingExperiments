
int[] xpos = new int[50];
int[] ypos = new int[50];
//int[] speed=new  int[100];
//int x = random(1,7);
void setup(){
  size(800,600);
  smooth();
  frameRate(1000);
 
  //for(int i = 0; i < 50; i++){
   // xpos[i] = 0;
   // ypos[i] = 0;
  //}
  //noCursor();
}
 
void draw(){
  background(255);
  for(int i = 0; i < 49; i++){
    xpos[i] = xpos[i+1]+ int(random(-10,10));
    ypos[i] = ypos[i+1] -6;
  //  speed[i]=-10;

  }
 
  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;
 
  for(int i = 0; i < 50; i++){
    //background(255);
    noStroke();
    fill(255-i*5,0,150);
    ellipse(xpos[i]+random(-5,5), ypos[i], i*2, i*2);
   // ypos[i]+=speed[i];
  }
}

