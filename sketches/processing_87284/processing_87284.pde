
void setup(){
  size(500,500);
  colorMode(HSB,360,100,100,100);
  background(0,0,100,100);
  smooth();
}
int value=1;
void draw(){
 
  if(value==1){
  
 for(int i=0;i<width;i+=100){                                 //背景
   noStroke();
   int h=15;
   int s=50;
   int b=90;
   for(int j=0;j<height;j+=50){
     fill(h,s,b,70);
     rect(i,j,i+100,j+50);
     h+=20;
   }
 }

  for(int i=0;i<width;i+=25){
    stroke(0,0,100,100);
    strokeWeight(0.9);
    
    int jMax=(int)random(1,4);                              //大圆
    for(int j=0;j<=jMax;j++){
      if(j==1||j==2){
      fill(random(0,30),random(30,70),random(80,100),random(30,60));
      ellipse(100*((int)random(7)),i*2,200,200);}
       else if(j==3){
      fill(random(330,360),random(60,80),random(70,95),50);
      ellipse(50*((int)random(10)+25),i*2,200,200);
      }
      else{
      fill(random(200,280),random(40,60),random(70,95),50);
      ellipse(100*((int)random(7)),i*2,200,200);
      }
    }
    jMax=(int)random(1,5);                                   //小圆
    for(int j=0;j<=jMax;j++){
       if(j==1||j==2){
      fill(random(0,45),random(30,60),random(70,90),random(40,60));
      ellipse(100*((int)random(8)),i*2,100,100);}
      else if(j==3||j==4){
         fill(random(330,360),random(50,70),random(70,90),random(40,60));
      ellipse(50*((int)random(8)),i*2,100,100);}
      else
      {
      fill(random(200,240),random(40,60),random(70,90),50);
      ellipse(100*((int)random(8)+25),i*2,100,100);}
      
    }
}
  stroke(0,0,100,100);
  
  for(int i=0;i<width;i+=25){                         //横竖线
  strokeWeight(1);
    line(i*2,0,i*2,height);
    line(0,i,height,i);
}
  for(int i=0;i<2*width;i+=25){                  //斜线
    strokeWeight(0.9);
    stroke(0,0,100,70);
    line(width-i*2,0,height,i);
    line(2*i-width,0,-height,i);
  }
   for(int i=0;i<4*width;i+=50){                 
    strokeWeight(0.9);
    stroke(0,0,100,70);
    line(width-2*i/3,0,height,i);
    line(2*i/3-width,0,-height,i);
  }
  }
  value=0;

}

void mouseClicked(){
  value=1;
}
