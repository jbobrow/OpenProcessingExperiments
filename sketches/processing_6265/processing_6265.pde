
float mix(float p,float a,float b){ return a*(1.0-p)+p*b; }

float ax=0f,ay=0f,aw=0f;  //averaged position+weight
float sx=0f,sy=0f; // speed
float cx=0f,cy=0f; // current (actually drawn) position
float px=0f,py=0f; // previous position
float p=0.15;      //mix ratio
float fadeRate=0.1;
KeyTouchpad touchpad;

void setup(){
  size(900,300,P2D);
  background(0);
  frameRate(60);
  noStroke();
  smooth();
  touchpad=new KeyTouchpad();
}
void draw(){
  fill(0,0,0,max(1,fadeRate));
  if((fadeRate>=1)||(frameCount%(1f/fadeRate)<1)) rect(0,0,width,height);
  boolean disappeared=(aw<0.001);
  if((disappeared)&&(touchpad.downKeys>0)){ // if dot disappeared, reset position to new key
    aw=1;
    ax=touchpad.x;
    ay=touchpad.y;
    cx=ax;
    cy=ay;
    sx=0;
    sy=0;
  }

  float aw1=mix(p,aw,touchpad.downKeys);
  if(aw1>0.001){
    ax=mix(p, ax*aw, touchpad.x*touchpad.downKeys)/aw1;
    ay=mix(p, ay*aw, touchpad.y*touchpad.downKeys)/aw1;
  }
  aw=aw1;

  sx=mix(p,sx,cx-ax);
  sy=mix(p,sy,cy-ay);
  px=cx;
  py=cy;
  cx+=-p*sx*2;
  cy+=-p*sy*2;

  float brightness=255;
  fill(
    128+cx*3+cy*0
   ,128+cx*2+cy*1
   ,128+cx*0+cy*3
   ,brightness
  );
  if(!disappeared)ellipse(width/2+ cx*6.3,cy*6.3 +height/2,aw*10+4,aw*10+4);
}


void keyPressed(){
  if(keyCode==java.awt.event.KeyEvent.VK_PAGE_UP)   fadeRate*=1f/1.3;
  if(keyCode==java.awt.event.KeyEvent.VK_PAGE_DOWN) fadeRate*=   1.3;
  if(keyCode==java.awt.event.KeyEvent.VK_UP)   p*=   1.1;
  if(keyCode==java.awt.event.KeyEvent.VK_DOWN) p*=1f/1.1;
  if(keyCode==java.awt.event.KeyEvent.VK_DELETE)    background(0);
  if(keyCode==java.awt.event.KeyEvent.VK_HOME)      if(!online) saveFrame("frames/filename-#####.png");
  if(keyCode==java.awt.event.KeyEvent.VK_END)       if(!online) touchpad.debug();
  //print("UP:   "); print(key); print(" "); println(keyCode);
  touchpad.keyInput(true,key,keyCode);
}
void keyReleased(){
  //print("DOWN: "); print(key); print(" "); println(keyCode);
  touchpad.keyInput(false,key,keyCode);
}


class KeyTouchpad {
  int x=0;
  int y=0;
  int downKeys=0;

  class KeyItem { boolean valid; char key; int keyCode; int x; int y; }
  KeyItem keys[]=new KeyItem[20];

  KeyItem processKey(char key,int keyCode){
    KeyItem k=new KeyItem();
    k.valid=false;
    if(key!=CODED){
      for(int y=0;y<kbdCodes.length;y++){
        int x=-1;
        for(int xi=0;xi<kbdCodes[y].length;xi++) if(kbdCodes[y][xi]==keyCode){ x=xi; break; };
        if(x>=0){
          k.valid=true;
          k.key=key;
          k.keyCode=keyCode;
          k.x=x*12+y*4 -5*12-12/2;
          k.y=y*12     -1*12-12/2;
        }
      }
    }
    return k;
  }

  void debug(){
    println("---------- KeyTouchpad debug begin ----------");
    for(int i=0;i<keys.length;i++){
      print("["+i+"]=");
      if(keys[i]==null){
        print("null");
      }else{
        print("valid: "+keys[i].valid+" ");
        print("key: "+keys[i].key+" ");
        print("code: "+keys[i].keyCode+" ");
        print("x: "+keys[i].x+" ");
        print("y: "+keys[i].y+" ");
      }
      println("");
    }
    println("---------- KeyTouchpad debug end ----------");
  }

  void updatePos(){
    int ax=0,ay=0;
    downKeys=0;
    for(int i=0;i<keys.length;i++){
      if((keys[i]!=null)&&(keys[i].valid)){
        ax+=keys[i].x;
        ay+=keys[i].y;
        downKeys++;
      }
    }
    if(downKeys>0){
      x=ax/downKeys;
      y=ay/downKeys;
    }
  }

  void keyInput(boolean isPressed,char key,int keyCode){
    KeyItem k=processKey(key,keyCode);
    boolean done=false;
    if(k.valid){
      for(int i=0;i<keys.length;i++){
        boolean empty=(keys[i]==null);
        boolean same=(!empty) && (k.keyCode==keys[i].keyCode);
        if(isPressed){
          if(same&&done)    keys[i]=null;
          if(empty&&!done){ keys[i]=k; done=true; }
          if(same)                     done=true;
        }else{ //release
          if(same){ keys[i]=null; }
        }
      }
    }
    updatePos();
  }

  int kbdCodes[][]={
    {java.awt.event.KeyEvent.VK_1
    ,java.awt.event.KeyEvent.VK_2
    ,java.awt.event.KeyEvent.VK_3
    ,java.awt.event.KeyEvent.VK_4
    ,java.awt.event.KeyEvent.VK_5
    ,java.awt.event.KeyEvent.VK_6
    ,java.awt.event.KeyEvent.VK_7
    ,java.awt.event.KeyEvent.VK_8
    ,java.awt.event.KeyEvent.VK_9
    ,java.awt.event.KeyEvent.VK_0
    ,java.awt.event.KeyEvent.VK_MINUS
    ,java.awt.event.KeyEvent.VK_EQUALS
    }
   ,{java.awt.event.KeyEvent.VK_Q
    ,java.awt.event.KeyEvent.VK_W
    ,java.awt.event.KeyEvent.VK_E
    ,java.awt.event.KeyEvent.VK_R
    ,java.awt.event.KeyEvent.VK_T
    ,java.awt.event.KeyEvent.VK_Y
    ,java.awt.event.KeyEvent.VK_U
    ,java.awt.event.KeyEvent.VK_I
    ,java.awt.event.KeyEvent.VK_O
    ,java.awt.event.KeyEvent.VK_P
    ,java.awt.event.KeyEvent.VK_OPEN_BRACKET
    ,java.awt.event.KeyEvent.VK_CLOSE_BRACKET
    }
   ,{java.awt.event.KeyEvent.VK_A
    ,java.awt.event.KeyEvent.VK_S
    ,java.awt.event.KeyEvent.VK_D
    ,java.awt.event.KeyEvent.VK_F
    ,java.awt.event.KeyEvent.VK_G
    ,java.awt.event.KeyEvent.VK_H
    ,java.awt.event.KeyEvent.VK_J
    ,java.awt.event.KeyEvent.VK_K
    ,java.awt.event.KeyEvent.VK_L
    ,java.awt.event.KeyEvent.VK_SEMICOLON
    ,java.awt.event.KeyEvent.VK_QUOTE
    ,java.awt.event.KeyEvent.VK_BACK_SLASH
    }
   ,{java.awt.event.KeyEvent.VK_Z
    ,java.awt.event.KeyEvent.VK_X
    ,java.awt.event.KeyEvent.VK_C
    ,java.awt.event.KeyEvent.VK_V
    ,java.awt.event.KeyEvent.VK_B
    ,java.awt.event.KeyEvent.VK_N
    ,java.awt.event.KeyEvent.VK_M
    ,java.awt.event.KeyEvent.VK_COMMA
    ,java.awt.event.KeyEvent.VK_PERIOD
    ,java.awt.event.KeyEvent.VK_SLASH
    }
  };
}

