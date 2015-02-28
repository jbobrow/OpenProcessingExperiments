
int c=0;
char flag=0;

void setup () {
  size(512, 160);
  smooth();
  frameRate(8);
}

void draw () {
  background(0);
  for (int i=0; i<512; i=i+3) {
    line (i+10,80,i+1,sin(radians(i*2))*c+80);
    stroke(255,0,0);
  }
  if ((c <= 80) && (flag == 0)); {
       c+=1;  
  }  
  if (c==80) {
       flag=1;
  }
  if ((c > -80) && (flag == 1)) {
       c-=2;
       if (c == -80) {
           flag=0;
       }
   }     
}


