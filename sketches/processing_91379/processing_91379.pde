
int colors[]=new int[255];
int x[]=new int[6];
int y[]=new int[6];
int test=0;

void setup (){
background(0);
  size(600,600);
 x[0]=20;
 x[1]=40;
 x[2]=40;
 x[3]=60;
 x[4]=60;
 x[5]=20;
 
 y[0]=20;
 y[1]=20;
 y[2]=40;
 y[3]=40;
 y[4]=60;
 y[5]=60;
  }
  
   
    
void draw(){
  for(int i=0;i<height;i++){
    float p=(float)i/height;
  stroke(0,0,255*p); 
  strokeWeight(1);
  line(0,i,width,i);
    
  }
  for(int m=0;m<height;m+=60){
    stroke(255);
    strokeWeight(10);
    line(m,0,m,height);
  }
  for(int n=0;n<width;n+=60){
    stroke(255);
    strokeWeight(10);
    line(0,n,width,n);
  }
  drawshape();
  pushMatrix(); 
    translate(test,test);     
    rotate(test); 
    drawshape();
    popMatrix();
    pushMatrix(); 
    translate(70,80);     
    rotate(45); 
    drawshape();
   
    translate(10,-30);     
    rotate(10); 
    drawshape();
    popMatrix();
    pushMatrix(); 
    translate(500,500);     
    rotate(90); 
    drawshape();
    popMatrix();
    test++;
  }
  
void drawshape(){
  strokeWeight(1);
  fill(255,0,0);
 beginShape();
  for(int q=0;q<6;q++)
 vertex(x[q],y[q]);
 endShape(CLOSE);
  
}


