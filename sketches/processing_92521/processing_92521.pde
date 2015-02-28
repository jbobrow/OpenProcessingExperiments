
int v=100;
int d=0;
float[] x=new float[v];
float[] y=new float[v];
float[] xv=new float[v];
float[] yv=new float[v];

for (int i=0;i<v;i++){
   x[i]=random(500);
   y[i]=random(500);
   xv[i]=random(4)-2;
      yv[i]=random(4)-2;
}


void setup(){
  size(500,500);      
  smooth();
  strokeWeight(1);
  fill(200,10);
}
 
void draw(){
  background(50,100,120);
  stroke(200);
  d=mouseY/2;
  for (int i=0; i<mouseX/5; i++;){
     x[i]+=xv[i];
     y[i]+=yv[i];
     if ((x[i]>500) || (x[i]<0)) {xv[i]=-xv[i];}
       if ((y[i]>500) || (y[i]<0)) {yv[i]=-yv[i];}
     ellipse(x[i], y[i], 3,3);
     noStroke();
     ellipse(x[i], y[i], d,d);
     stroke(200);
           for (int ii=i+1; ii<mouseX/5; ii++;){
         if (dist(x[i], y[i], x[ii], y[ii])<d) {
//            line(x[i], y[i], x[ii], y[ii]);
                 curveTightness(random(10)-5);
                 curve(x[i]+random(100)-50,y[i]+random(100)-50,x[i],y[i],x[ii],y[ii],x[ii]+random(100)-50,y[ii]+random(100)-50);
            }
       }
  }
}
