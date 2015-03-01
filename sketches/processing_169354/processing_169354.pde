
float t;
float x;
int S;
int I;
int R;
float b;
float k;


void setup() {  //setup function called initially, only once
  size(480, 480);
  background(255);  //set background white
}

void draw() {  //draw function loops 
  t=0;
  S=7900000;
  I=10;
  R=0;
  b=0.5;
  k=1.0/3.0;
  while(t<800)
  {
      SI=(b*S*I)/(N*N);
      IR=k*I/N;
      x=-log(random(0,1))/(SI+IR);
      stroke(0,0,0,5); line(t,height-S,t+x,height-S);
      //stroke(1,0,0,5); line(t,height-I,t+x,height-I);
      //stroke(2,0,0,5); line(t,height-R,t+x,height-R);
      t=t+x;
      r=random(0,SI+IR);
      if(r<SI){S=S-1; I=I+1;} else {I=I-1; R=R+1;}
  }
  }
}
