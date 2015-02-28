
float h=256,t,T,x,y;
void setup(){size(512,512);}
void draw(){
  //x=.3-mouseY/h/5;
  x=(-1f*touchpad.y/touchpad.maxY/2f+0.5)/4;
  t+=x;
  //T+=(mouseX/h-1)*x;
  T+=(1f*touchpad.x/touchpad.maxX)*x;
  noStroke();
  for(y=0;++y<h;){
    fill(h-y,85);
    rect(0,h+y,h*2,1);
    x=h/y+t;
    fill(x%20*9,85);
    x=T+noise(x/99)*60-30;
    rect(h-x*y-2*y,h+y,y*4,1);
  }
}



void keyPressed(){
  touchpad.keyInput(true,key,keyCode);
}
void keyReleased(){
  touchpad.keyInput(false,key,keyCode);
}
KeyTouchpad touchpad=new KeyTouchpad();
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
          k.x=x*12+y*4 -5*12-12/2; //TL=-66 BL=-54 TR=66 BR=78  
          k.y=y*12     -1*12-12/2; //T=-18 B=18
        }
      }
    }
    return k;
  }
  int maxX=66;
  int maxY=18;

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

  int kbdCodes[][]={ //length:12,12,12,10
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

