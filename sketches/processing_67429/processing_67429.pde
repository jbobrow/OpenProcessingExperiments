
//在窗口中填满一些矩形

int N=20;//x方向的矩形数量
int M=20;//y方向的矩形数量
float xianCu=7;//矩形框的线粗


float [] x = new float [N];
float [] y = new float [M];
int i;
int j;

 
void setup(){
  size(400,600);
   int chang = width/N;
   int gao = height/M;
   for (i=0;i<N;i++){
      x[i]=chang*i;
     // println(x[i]);
   for (j=0;j<M;j=j+1){
      y[j]=gao*j;
  }
}
}
void draw(){
   for(int i=0;i<N;i++){
     for(int j=0;j<M;j++){
          ziliu(x[i],y[j],width/N,height/M,xianCu,random(255));
         // println(x[i]+"   "+y[j]);
   }

   }
}
 
void ziliu(float x,float y,float chang,float kuan,float xianCu,float c){
  //translate(x,y);//当初用了translate，差点没害死我，这玩意儿移动的时候用好
  fill(c);
  strokeWeight(xianCu);
  rect(x,y,chang,kuan);
}
