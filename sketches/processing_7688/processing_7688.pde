
int eyes_no=4;
int[] posses = new int[4*eyes_no];
int i;

void setup(){
  size(400,400);
  frameRate(20); 
  smooth();
  for(i=0;i<eyes_no;i++){
    posses[4*i] = int(random(10,width-10));
    posses[4*i+1] = int(random(10,height-10));
    posses[4*i+2] = int(random(10,100));
    posses[4*i+3] = int(random(5,posses[4*i+2]-7));
  }
}

void draw(){
  background(200);
  noStroke(); 


  float mx=mouseX;
  float my=mouseY;

  for(int i=0;i<eyes_no;i++){
    eye(posses[4*i],posses[4*i+1],posses[4*i+2],posses[4*i+3],mx,my);

  }


}

void eye(int x, int y, int rad_b, int rad_s, float mx, float my){

  int rad_pos = rad_b-rad_s;

  float theta= atan((my-y)/(mx-x));
  if(mx<x) theta= theta+PI;

  fill(255);
  ellipse(x,y,2*rad_b,2*rad_b);

  fill(0);

  if(sqrt(pow((my-y),2)+pow((mx-x),2))<rad_pos) {
    ellipse(mx,my,2*rad_s,2*rad_s);
  }
  else ellipse(x + rad_pos*cos(theta),y+rad_pos*sin(theta),2*rad_s,2*rad_s);
}


void mousePressed() {
  for(i=0;i<eyes_no;i++){
    posses[4*i] = int(random(10,width-10));
    posses[4*i+1] = int(random(10,height-10));
    posses[4*i+2] = int(random(10,100));
    posses[4*i+3] = int(random(5,posses[4*i+2]-7));
  }
}


