
//
//  class Walker {
//    int pos;
//    float h;
//    float freq;
//    boolean isTop;
//    float v;
//    int dPos;
//    color c;
//    float m;
//
//    Walker(int pos, float freq) {
//      this.pos   = pos;
//      this.freq  = freq;
//      this.isTop = true;
//      this.v     = 0;
//      this.dPos  = 0;
//      this.c     = color( random(255), random(255), random(255), 200 );
//      this.m     = 10;
//      this.h     = 1;
//    }
//
//    void update() {
//      //      v=h;
//      //      h=sin(frameCount*freq);
//      //      v=h-v;
//      isTop = (oscilsH[pos-1]<h && oscilsH[pos+1]<h) || (oscilsH[pos-1]>h && oscilsH[pos+1]>h);
//
//      dPos = 0;
//      if (!isTop) {
//        //        print(frameCount+":  ");
//        if ( oscilsH[pos-1]<h && oscilsH[pos+1]>h ) {
//          //          print("MOVE_Left ");
//          dPos = -1;
//        }
//        if ( oscilsH[pos-1]>h && oscilsH[pos+1]<h ) {
//          //          print("MOVE_Right ");
//          dPos =  1;
//        }
//
//        pos = constrain(pos+dPos, 1, oscilsN-2);
//        //        println();
//      }
//    }
//
//    void influence() {
//      //      oscilsHNew[pos] = h;
//      //      oscilsVNew[pos] = 0;
//      float aOnWave    = 0.005*(h-oscilsH[pos]);
//      oscilsVNew[pos] += aOnWave;
//      float aOnWalker  = 0.005*(h-oscilsH[pos]);
//      v += -aOnWalker/m;
//      h += v;
//    }
//
//    void draw() {
//      float wd = width/oscilsH.length;
//      fill(c);
//      //      fill(255, 10);
//      //      if (dPos<0) fill(255, 0, 0);
//      //      if (dPos>0) fill(0, 255, 0);
//
//      noStroke();
//      rect(pos*wd, height/4-scale*h, 4, 4);
//    }
//  }

