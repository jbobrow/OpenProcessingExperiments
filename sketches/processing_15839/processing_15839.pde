
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/15839*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
void setup(){
  size(600,400);
  reset();
}
void draw(){
  for(int m=0;m<100000;m++){
    // create onehundredthousand random points
    int a = floor(random(1,width));
    int b = floor(random(1,height));
    if(red(get(a,b))!=0){// if pixel is black
      int c = floor(random(0,4));// one of 4 directions
      int d = 0;// an x offset for direction
      int e = 0;// an y offset for direction
      switch(c){// assign x and y offsets
        case 0:
        d=1;
        e=0;
        break;
        case 1:
        d=0;
        e=1;
        break;
        case 2:
        d=-1;
        e=0;
        break;
        case 3:
        d=0;
        e=-1;
        break;
      }
      if((a+d>0)&&(b+e>0)&&
         (a+d<width-1)&&(b+e<height-1)&&
         // i was worried about the domain of get() or set()
         // it will not throw an "index out of bounds" anyway
       red(get(a+d,b+e))==0){// if the target is black
        int ram = 10;// makes the color change
        color clr = get(a,b);//
        int re = int(constrain(red(clr)+random(-ram,ram),1,255));
        int gr = int(constrain(green(clr)+random(-ram,ram),1,255));
        int bu = int(constrain(blue(clr)+random(-ram,ram),1,255));
        set(a+d,b+e,color(re,gr,bu));
      }
    }
  }
}
void keyPressed(){
  if(key==' '){
    reset();
//    save("evolution.bmp");
  }
}
void reset(){
  background(0);
  float edge = 1;// distance from inner to outer circle
  float diam = width/2;
  noFill();
  ellipseMode(CENTER);
  stroke(#8800FF);// blue
  ellipse(width/2,height/2,diam-edge,diam-edge);
  stroke(#FF8800);// orange
  ellipse(width/2,height/2,diam+edge,diam+edge);
//  set(width/2,height/2,color(255));
}


