
void setup(){
size(250,250);
smooth();
}
int n=0;
int i=20;
void draw(){
  background(#2D59AD);
  noStroke();
  fill(255,60);
  ellipse(n,40,70,70);
    ellipse(60,n,70,70);
        ellipse(210,n,70,70);
        strokeWeight(3);
        stroke(255);
line(i,20,i,180);
line(i,220,i,50);
line(20,i,i,180);
}
void mouseMoved(){
  n=n+18;
  i=i+20;
  if (n>235){
    n=0;
        if (i>240){
          i=20;
  }
}
}

