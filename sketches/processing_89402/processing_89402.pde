
string s = "Hold on tight!!! Weeeeeeeeeeeeee!";
int l=s.length();

float[] x=new float[l];
float[] y=new float[l];

for (int i=0;i<l;i++){
   x[i]=100+(i+1)*10;
   y[i]=100;
}

void setup(){
  size(700, 400);      
  smooth();
  strokeWeight(3);
  noCursor();
}
 
void draw(){
  background(50,100,120);
     fill(255);
     text(s.substring(0,1),x[0],y[0]);
      x[0]+=((mouseX+10)-x[0])*.3;
      y[0]+=(mouseY-y[0])*.3;
   for (int i=1;i<l;i++){
      text(s.substring(i,i+1),x[i],y[i]);
      x[i]+=((x[i-1]+10)-x[i])*.3;
      y[i]+=(y[i-1]-y[i])*.3;
    }
    noStroke();
    ellipse(mouseX, mouseY, 5, 5);
}
