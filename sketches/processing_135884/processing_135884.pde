
int i;
float a,b;
float x,y;
float n;
 
void setup(){
  size(480,480);
  background(106, 220,255);
  a=0;
  b=0;
  n=0;
}
 
void draw(){
  background(106, 220,255);
  //fill(20,20,20,254);
  //rect(20,20,30,390);
  if (n<480){
    n++;
  }
  else n=0;
  for(i=0;i<9;i++){
    a=i*50+random(24)*3;
    for(b=0;b<480;b+=4){
      ellipseMode(CENTER);
      noStroke();
      fill(200+a,50+a,48*a);
      if (a<=n-65 ||a>=n+65){
      fill(20,80,150,3)
      rect(a,b,30,30);
      }
     
     if (a<=360-n/2-65 ||a>=360-n/2+65){
     fill(20,80,150,3)
       rect(b,a,30,30);
      }
      fill(30,150,255,255);
      ellipse(n,360-n/2, 40,40);
      }
     
    }
  }
 
    
    
