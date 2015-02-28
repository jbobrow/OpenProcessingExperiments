
//Array assignment
//Tommy Coggin

//sets the number of boxes in 1st veritcal bar
int num=30;
float[] y1=new float [num];


//sets number of boxes in 2nd vertical bar
int num2=10;
float[] y2=new float [num2];

//sets number of boxes in 1st horizontal bar
int num3=30;
float[] x1=new float [num3];

//sets number of boxes in 2nd horizontal bar
int num4=10;
float[] x2=new float [num4];

void setup() {
  size(300,300);
  background(255);
  
  //seeding the array
  for (int a=0; a<y1.length; a++){
    y1[a] = random(height);
  }
  
  for (int b=0; b<y2.length; b++){
    y2[b]= random(height);
  }
  
  for (int c=0; c<x1.length; c++){
    x1[c]=random(width);
  }
  
  for (int d=0; d<x2.length; d++){
    x2[d]= random(width);
  }
}

void draw(){
  background(255);
  stroke(100);
  fill(0);
  
  //sets the properties for left vertical
  for (int a=0; a<y1.length; a++){
    rect(100, y1[a], 10, 10);
    y1[a]= y1[a]+1;
    if (y1[a]>height) y1[a]=0;
  }
  
   //sets properties of top horizontal
  for (int c=0; c<x1.length; c++){
    rect(x1[c], 100, 10, 10);
    x1[c]= x1[c]+1;
    if (x1[c]>width) x1[c]=0;
  }
  
  //sets properties for right vertical
  for (int b=0; b<y2.length; b++){
    rect(200, y2[b], 30, 30);
    y2[b]= y2[b]+1;
    if (y2[b]>height) y2[b]=0;
  }
  
  //sets properties of bottom horizontal 
  
  for (int d=0; d<x2.length; d++){
   rect(x2[d], 200, 30, 30);
   x2[d]= x2[d]+1;
   if (x2[d]>width) x2[d]=0;
  }
}



