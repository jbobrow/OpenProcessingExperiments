
static int NUM = 10;
float [] x = new float[NUM];
float [] y = new float[NUM];
float [] c1 = new float[NUM];
float [] c2 = new float[NUM];
float [] c3 = new float[NUM];
int i,v,temp;

void setup(){
  size(500,500);
  v=5;
  
  // vertical 5
  for(i=0;i<NUM-5;i++){
   x[i]=i*80+80;
   c1[i]=random(0,255);
   c2[i]=random(0,255);
   c3[i]=random(0,255);
  }
  
  // horizontal 5
  for(i=5;i<NUM;i++){
   y[i]=i*80-320;
   c1[i]=random(0,255);
   c2[i]=random(0,255);
   c3[i]=random(0,255);
  }
}

void draw(){
  background(0);
  
  // vertical 5
  for(i=0;i<NUM-5;i++){
    if(y[i]>=485&&v==5){
      v=temp=-5;
    }else if(y[i]<=15&&v==-5){
      v=temp=5;
    }
    y[i]=y[i]+v;
  }
    
  // horizontal 5
  for(i=5;i<NUM;i++){
    if(x[i]>=485&&v==5){
      v=temp=-5;
    }else if(x[i]<=15&&v==-5){
      v=temp=5;
    }
    x[i]=x[i]+v;
  }  
  
  
  for(i=0;i<NUM-5;i++){
    fill(c1[i],c2[i],c3[i]);
   ellipse(x[i],y[i],30,30);
  }
  
  for(i=5;i<NUM;i++){
    fill(c1[i],c2[i],c3[i]);
   ellipse(x[i],y[i],30,30);
  }
}

void mouseClicked(){
  if(v!=0){
    v=0;
  } else {
    v=temp;
  }
}
