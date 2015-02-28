
Trunk[] tree = new Trunk[10];
int c;
float k=0;
float x=0;
float y=0;
void setup(){
  background(200);
  smooth();
  size(1200,900);
  strokeCap(SQUARE);
for(int i=0;i<10;i++){
  c = int(random(5));
  tree[i] = new Trunk(150+i*250,850,17);
  tree[i].initial();
}
/*  tree[0] = new Trunk(600,850,15);
  tree[1] = new Trunk(400,850,10);
  tree[2] = new Trunk(800,850,20);
  tree[0].initial();
  tree[1].initial();
  tree[2].initial();
  */
}

void draw(){
//  background(230); 
fill(255,4);
rect(0,0,width,height);
for(int i=0;i<10;i++){
  tree[i].display(); 
}
save("Trees.tif");
}

class Branch{ //################################# class Branch
  int d;
  int num; //0, 1 or 2 pls
  float[] x = new float[21];
  float[] y = new float[21];
  float[] turn = new float[20];
  int[] branch = new int[20];
  float[] twoBranchX = new float[21];
  float[] twoBranchY = new float[21];
  Branch(float initialX,float initialY,int initialD,int initialNum){
    d=initialD-2;
    x[0]=initialX;
    y[0]=initialY;
    num=initialNum;
    twoBranchX[0]=initialX;
    twoBranchY[0]=initialY;
  }
  
  void once(){
    if(num==1){
      
      if(int(random(200))%2==1){
        for(int i=0; i<d; i++){
          turn[i]=random(100)-50;
          y[1+i]=y[i]+turn[i];
          x[1+i]=x[i]-random(d*4-d)-5;
        }
      }
        else{
          for(int i=0; i<d; i++){
            turn[i]=random(100)-50;
            y[1+i]=y[i]+turn[i];
            x[1+i]=x[i]+random(d*4-d)+5;
          }
        }
      }
      
    else if(num==2){
      for(int i=0; i<d; i++){
        turn[i]=random(100)-50;
        y[1+i]=y[i]+turn[i];
        x[1+i]=x[i]-random(d*4-d)-5;
      }
      for(int i=0; i<d; i++){
        turn[i]=random(100)-50;
        y[1+i]=y[i]+turn[i];
        x[1+i]=x[i]-random(d*4-d)-5;
        turn[i]=random(100)-50;
        twoBranchY[1+i]=twoBranchY[i]+turn[i];
        twoBranchX[1+i]=twoBranchX[i]+random(d*4-d)+5;
      }
    }
  } //end of once
  void display(){
    if(num==1){
      for(int i=0;i<d;i++){
        strokeWeight(d*3-i*3);
        stroke(85,50,35);
        line(x[i],y[i],x[i+1],y[i+1]);
        x[i]=x[i]+random(10)-5;
        y[i]=y[i]+random(4)-2;
      }
     
    }
    else if(num==2){
      for(int i=0;i<d;i++){
        strokeWeight(d*3-i*3);
        stroke(85,50,35);
        line(x[i],y[i],x[i+1],y[i+1]);
        line(twoBranchX[i],twoBranchY[i],twoBranchX[i+1],twoBranchY[i+1]);
        x[i]=x[i]+random(10)-5;
        y[i]=y[i]+random(4)-2;
        twoBranchX[i]=twoBranchX[i]+random(10)-5;
        twoBranchY[i]=twoBranchY[i]+random(4)-2;
      }
    }
  } // end of display
} // end of class Branch

class Trunk { //####################################### class Trunk
  int d; //diameter max 20?
  float[] x = new float[21];
  float[] y = new float[21];
  float[] turn = new float[20];
  int[] branch = new int[20];
  Branch[] stick = new Branch[20];
  
  Trunk(float initialX,float initialY,int initialD){
    x[0]=initialX;
    y[0]=initialY;
    d=initialD;
  }
  
  void initial(){
    for(int i=0; i<d; i++){
      turn[i]=random(40)-20;
      x[1+i]=x[i]+turn[i];
      y[1+i]=y[i]-random(d*5-d)-10;
      if(i>0){
        if(random(9)>=8){
          if(random(4)>=1){
            branch[i]=1;
          }
          else{
            branch[i]=2;
          }
        }
      }
      stick[i]=new Branch(x[i+1],y[i+1], d-i-1, branch[i]);
      stick[i].once();
    }
  }
  
  void display(){
    for(int i=0; i<d; i++){
      stick[i].display();
      strokeWeight(d*3-i*3);
      stroke(50,25,15);
      line(x[i],y[i],x[i+1],y[i+1]);
     x[i]=x[i]+random(10)-5;
     y[i]=y[i]+random(4)-2;
    }
    x[d]=x[d]+random(10)-5;
    y[d]=y[d]+random(4)-2;
  }
}
