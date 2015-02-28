
int numberCircle=175;

float[] circleX =new float[numberCircle];
float[] circleY =new float[numberCircle];

float[] velXcircleX=new float[numberCircle];
float[] velYcircleY=new float[numberCircle];


void setup() {

     size(500,500);
     for(int i=0; i<numberCircle; i++){
     circleX[i] =random(10,width-10);
     circleY[i] =random(10,width-10);
     velXcircleX[i] =random(20);
     velYcircleY[i] =random(15);

   }
}


void draw() {


 background(0);
 fill(220,65,100);
 noStroke();
 for(int i=0;i<numberCircle;i++)
 {
 circleX[i]+=velXcircleX[i];
 circleY[i]+=velYcircleY[i];
 ellipse(circleX[i],circleY[i],10,10);


 if((circleX[i]<=0)||(circleX[i]>=width-10)) {
   velXcircleX[i]=-velXcircleX[i];
 }

 if((circleY[i]<=0)||(circleY[i]>=height-10)) {
   velYcircleY[i]=-velYcircleY[i];
 }
 }
}

