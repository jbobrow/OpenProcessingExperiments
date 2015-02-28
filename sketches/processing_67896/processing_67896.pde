
//移动鼠标试试看
//do you want to try move your mouse?


int R=3;

float s;
void setup(){
  size(400,400);
 
  ellipseMode(RADIUS);
  smooth();
}

void draw(){
   background(0);
  for(float x=0+R;x<width-R;x+=2){
    for(float y=170;y<height-170;y+=6){
 
         
       float X=mouseX;
       if(x>=X-66 && x<=X+66){
         float d=dist(x,0,X,0);
         
         d=map(d,0,66,0.48,0.99);
          //println(d);
         s=d;
         
         fill(255);
         noStroke();
         yuanquan(x,y,R,R,s);
        }else{
         yuanquan(x,y,R,R,1);
       }
    }
    }
  }

         
void yuanquan(float x,float y,float r,float r1,float s){
pushMatrix();
translate(x,y);
scale(s);
ellipse(0,0,r,r1);
popMatrix();
}
