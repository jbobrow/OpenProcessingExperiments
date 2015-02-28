
int canvasWidth=200;
int canvasHeight=200;
int currentNum=0;

void setup(){
  size(canvasWidth,canvasHeight);
  background(255);
  //noLoop();
}

void draw(){
    background(255);
    delay(1200);
    noSmooth();
    strokeCap(SQUARE);
    currentNum=(int)random(10);
    drawExample(currentNum);
}

void drawExample(int num){
  float i,j,x,y,xPrev,yPrev;
  
  switch(num){
    case 1:
      stroke(128);
      strokeWeight(2);
      for(i=2;i<canvasHeight;i+=4){
        line(i%(canvasHeight/2),i,canvasWidth-i%(canvasHeight/2),i);
      }
    break;
   
    case 2:
      stroke(0);
      strokeWeight(1);
      for(i=0;i<canvasHeight;i+=2){
        line(i,0,random(canvasWidth),canvasHeight);
      }    
    break;
   
    case 3:
      stroke(128);
      strokeWeight(2);
      for(i=0;i<17;i++){
        for(j=0;j<17;j++){
          line(j*11+7,i*11+10,j*11+i*0.5+8,i*11+10);
        }
      }
    break;

    case 4:
      stroke(0);
      strokeWeight(1);
      for(i=0;i<160;i+=4){
        for(j=0;j<160;j+=4){
          if(!(40<i&&i<120&&40<j&&j<120))
          point(j+20,i+20);
        }
      }      
    break;
   
    case 5:
      fill(0);
      noStroke();
      float r=0;
      for(i=0;i<2400;i+=0.6){
        ellipse(canvasWidth/2+r*sin(radians(i)),canvasHeight/2+r*cos(radians(i)),10,10);
        r+=0.04;
      }
    break;
    
    case 6:
      stroke(1);
      strokeWeight(1);
      int r1=70;
      int r2=50;
      float xe,ye;
      for(i=0;i<360;i+=6){
        x=canvasWidth/2+r1*cos(radians(i));
        y=canvasHeight/2+r1*sin(radians(i));
        xe=canvasWidth/2+r2*cos(radians(i));
        ye=canvasHeight/2+r2*sin(radians(i));
        line(x,y,xe,ye);
      }
    break;
    
    case 7:
      ellipseMode(CENTER);
      strokeWeight(8);
      stroke(0);
      noFill();
      for(i=0;i<10;i++){
        if(i<5){
          ellipse(canvasWidth/2,canvasHeight/2-(5-i)*6,(i+1)*30,(i+1)*30);
        }else{
           ellipse(canvasWidth/2,canvasHeight/2+(7-i)*6,(i+1)*30,(i+1)*30);
        }
      }
    break;
    
    case 8:
      stroke(0);
      strokeWeight(0.5);
      line(10,10,canvasWidth-10,canvasHeight-10);    
      line(10,canvasHeight-10,canvasWidth-10,10);
    break;
    
    case 9:
      smooth();
      int numCircle=10;
      int sizeCircle=4;
      stroke(0);
      strokeWeight(0.5);
      ellipseMode(CENTER);
      for(i=0;i<numCircle;i++){
        for(j=0;j<numCircle;j++){
          if((i+j)%2==0)
            fill(0);
          else
            fill(255);
          ellipse(j*(canvasWidth/numCircle)+10,i*(canvasHeight/numCircle)+10,10,10);
        }
      }
      
    break;
    
    case 10:
      stroke(0);
      strokeWeight(0.5);
      xPrev=0;
      yPrev=0;
      for(i=0;i<canvasWidth;i++){
        x=i;
        y=(sin(radians(i*4))+sin(radians(i*10)))*canvasHeight/4+canvasHeight/2;
        line(xPrev,yPrev,x,y);
        xPrev=x;
        yPrev=y;  
      }
      
    break;
   
    default:
      stroke(128);
      for(i=2;i<canvasHeight;i+=5){
        strokeWeight(2);
        line(canvasWidth/2-i/2,i,canvasWidth/2+i/2,i);
      }
      break;
  }
}

