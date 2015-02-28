
int rectsize = 7; 
color c1;
color c2;
 
void setup() {
  size(600,600);
  noFill();
  //noStroke();
  stroke(166,166,164);
  strokeWeight(1);
}
 
void draw() {
  background(255);

  c1 = color(159, 161, 122);
  field(0,0,width,height,rectsize, c1);

  noLoop();
}

void field(float x,float y,float w, float h, int level, color c1) {
  
  c2 = color(255, 255, 255);
  
  if (level==0) {
    setGradient(x,y,w,h, c1, c2);
    rect(x,y,w,h);
    //setGradient(x+2,y+2,w-4,h-4, c1, c2);
    //rect(x+1,y+1,w-2,h-2); 
    println("malenrect");
    return;
  }

  int which=int(random(0,5));
  switch(which) {
    case(0):
       field(x,y,w,h/2,level-1,color(159, 161, 122));
       field(x,y+(h/2),w,h/2,level-1,color(244,233,179));
       println("0");
       break;
    case(1):
       field(x,y,w/2,h,level-1,color(155, 158, 141));
       field(x+(w/2),y,w/2,h,level-1,color(191,191,189));
       println("1");
       break;
    case(2):
       field(x,y,w,h/3,level-1,color(151, 152, 138));
       field(x,y+(h/3),w,h/3,level-1,color(198,192,160));
       field(x,y+(h/3)+(h/3),w,h/3,level-1,color(190,202,198));
       println("2");
       break;
    case(3):
       field(x,y,w/3,h,level-1,color(215,205,193));
       field(x+(w/3),y,w/3,h,level-1,color(178,170,167));
       field(x+(w/3)+(w/3),y,w/3,h,level-1,color(209,138,106));
       println("3");
       break;  
    default:
       field(x,y,w,h,level-1,color(244,233,179));
       println("default");
       break;
  }
}

void setGradient(float x, float y, float w, float h, color c1, color c2){
  float deltaR = red(c2)-red(c1);
  float deltaG = green(c2)-green(c1);
  float deltaB = blue(c2)-blue(c1);
    for (int i=(int)x; i<=(x+w); i++){
      // row
      for (int j = (int)y; j<=(y+h); j++){
        color c = color(
        (red(c1)+(j-y)*(deltaR/h)),
        (green(c1)+(j-y)*(deltaG/h)),
        (blue(c1)+(j-y)*(deltaB/h)) 
          );
        set((int)i, (int)j, c);
     //   for ( int e = 0; e < 9; e++ )
       // {  
      //  line(i*w, j*h+ e*w/8, i*w+w, j*h+e*w/8); 
       // }
      }
    }  
}

void keyPressed() {
  redraw();
}        
                                
