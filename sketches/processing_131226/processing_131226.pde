
int time=0;
int Out1=0;
int Out2=0;
int Up = 0;


int[] o1 = new int[9];
int[] o2 = new int[9];



void setup() {
  size(600, 600);

  frameRate(50);
      noStroke();
}

void draw() {
  time+=1;
  if (Out1 >= 100) {
    Up = 1;
  }
  if (Out1 <= -100) {
    Up = 0;
  }
  float str = 1;
  switch(Up) {

  case 0: 
    Out1+=str;
    break;
  case 1: 
    Out1-=str;
    break;
  }

  
  o1[0] = o1[1];
  o1[1] = o1[2];
  o1[2] = o1[3];
  o1[3] = o1[4];
  o1[4] = o1[5];
  o1[5] = o1[6];
  o1[6] = o1[7];
  o1[7] = o1[8];
  o1[8] = round(cos(time)*10*(0.1*Out1))+mouseX+round(0);

  o2[0] = o2[1];
  o2[1] = o2[2];
  o2[2] = o2[3];
  o2[3] = o2[4];
  o2[4] = o2[5];
  o2[5] = o2[6];
  o2[6] = o2[7];
  o2[7] = o2[8];
  o2[8] = round(sin(time)*(1+Out1/5%(mouseX+1))*(0.1*Out1))+mouseY+round(0);
  

  //background(0);
  for (int i = 0; i < o1.length-1; i++) {
      if(time>20) {
      
      
      fill(Out1,0,Out1, 5);
      

      //line(o1[i], o2[i], o1[i+1], o2[i+1]);
      //line(o1[i], o2[i], o1[o1.length-i-1], o2[o1.length-i-1]);
      
      ellipse(width/2, height/2, 1000,1000);

      fill(255,Out1,Out1, 90);
      ellipse(o1[i], o2[i], 15,15);
      }
    
  }
}

