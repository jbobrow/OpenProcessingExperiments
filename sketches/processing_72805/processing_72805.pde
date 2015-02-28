
import hypermedia.video.*;

OpenCV opencv;
PImage movementImg;
int poppedBubbles;
ArrayList bubbles;
PImage bubblePNG;
PFont font;

void setup(){
  size(640,480);
  opencv=new OpenCV(this);
  opencv.capture(640,480);
  movementImg=new PImage(640,480);
  poppedBubbles=0;
  bubbles=new ArrayList();
  bubblePNG=loadImage("nife.png");
  font=loadFont("AgencyFB-Reg-48.vlw");
  textFont(font,32);
}
void draw(){
  bubbles.add(new Bubble((int)random(0,width-40),-bubblePNG.height,bubblePNG.width,bubblePNG.height));
  opencv.read();
  opencv.flip(OpenCV.FLIP_HORIZONTAL);//Flip the PIC
  image(opencv.image(),0,0);
  opencv.absDiff();
  
  opencv.convert(OpenCV.GRAY);
  opencv.blur(OpenCV.BLUR,3);
  opencv.threshold(20);
  movementImg=opencv.image();//remeber the img
  
  for(int i=0;i<bubbles.size();i++){
    Bubble _bubble=(Bubble)bubbles.get(i);
    
    if(_bubble.update()==1){
      bubbles.remove(i);
      _bubble=null;
      i--;
    }else{
      bubbles.set(i, _bubble);
      _bubble=null;
    }
  }
  
  opencv.remember(OpenCV.SOURCE,OpenCV.FLIP_HORIZONTAL);
  text("Bubbles popped:"+poppedBubbles,20,40);
}


class Bubble{
  int bubbleX,bubbleY,bubbleWidth,bubbleHeight;
  Bubble(int bX,int bY,int bW,int bH){
    bubbleX=bX;
    bubbleY=bY;
    bubbleWidth=bW;
    bubbleHeight=bH;
  }
  int update(){
    int movementAmount;
    movementAmount=0;
    for(int y=bubbleY;y<(bubbleY+(bubbleHeight-1));y++){
      for(int x=bubbleX;x<(bubbleX+(bubbleWidth-1));x++){
        if(x<width&&x>0&&y<height&&y>0){
          if(brightness(movementImg.pixels[x+(y*width)])>127){
            movementAmount++;
          }
        }
      }
    }
    if(movementAmount>5){
      poppedBubbles++;
      return 1;
    }else{
      bubbleY+=10;
      if(bubbleY>height){
        return 1;
      }
      image(bubblePNG,bubbleX,bubbleY);
      return 0;
      
    }
  }
}

