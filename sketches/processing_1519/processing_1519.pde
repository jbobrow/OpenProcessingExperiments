
float a=0.5;
int b=50;
void setup(){
  size(500,500);
  background(0);
  smooth();
  //noLoop();
  }
  void draw(){
    //frameRate(2);
    background(0);
    krug(width/2,height/2,width/5,int(random(255)),int(random(50)));
     for(int i=0;i<250;i++){
    novo(i,int(random(i)),i,int(random(250)));
   
  }
    }
    void krug(int x,int y,int size,int boja,int razno){
      for(float c=0.1; c<500; c+=5){
      //strokeWeight(random((3)));
      stroke(boja,c,c,boja);
      noFill();
      ellipse(c,y,size,size);
      ellipse(x,c,size,c);
      //line(c,c,boja,razno);
      //ellipse(a+razno,a+boja,a,a);
      }
       }
        void novo(float x, int y, int size, int boja){
   x=x+0.6;
   strokeWeight(50/x);
    stroke(x+boja,y+boja,boja);
    noFill();
    
    ellipse(y+boja,x,size,size-10);
    ellipse((y*0.4)+boja,x*2,height,size-10);
    ellipse(x,y,size+boja,size+10);
    ellipse(x+boja+50,y,size/height+boja,size-10);
    
     a=a+0.5;
    ellipse(a,height/2,70,70);
    fill(random(0,255),random(0,255));
    ellipse(a,height/2,b,b);
    if(a>500){
      a=0;
      }
      }

