
int m=0;
int[] xPosBall=new int[500];
int n=-1;
int l=-1;
void setup(){
  size(500, 500);
  for (int i=0; i<500;i++) {
    xPosBall[i]=i;
  }
}

void draw() {
  noStroke();
  fill(255, 103, 0);
  background(0, 162, 135);
  for (int i=0; i<499;i++) {
    xPosBall[i]=xPosBall[i+1]; 
    xPosBall[499]=m;
    m=xPosBall[0];
  } 
 //for above for loop; the position of ball xPosBall[0] get larger when next void draw happends, it will be like 0,1,2,3....497,498,0,1,2,3,...497,498,0.......no end.
  if(xPosBall[498]==498){
    n=-n;
    l=-l;
  } 
  ellipse(250*(l+1)-n*xPosBall[0], height/2, 35, 35);
  println(xPosBall[499]);
}



