
//Referenced from http://www.openprocessing.org/sketch/15839, Asher Salomon

int m;
int a;
int b;
int c;
int d;
int e;


void setup(){
  size(400,200);
  reset();
  loop();
}
void draw(){
  
  for(m=0;m<100000;m++){
    

    // create onehundredthousand random points
    int a = floor(random(1,width));
    int b = floor(random(1,height));
    if(red(get(a,b))!=0){// if pixel is black
      c = floor(random(0,4));// one of 4 directions below, case 0-3
      d = 0;// an x offset for direction
      e = 0;// an y offset for direction
      switch(c){// assign x and y offsets
       case 0://These are the values at which the points increase, for this one it will increase 2 pixels on the x axis
        d=2;
        e=0;
        break;
        case 1:
        d=0;
        e=2;
        break;
        case 2:
        d=-2;
        e=0;
        break;
        case 3:
        d=0;
        e=-2;
        break;




      }
      if((a+d>0)&&(b+e>0)&&
         (a+d<width-1)&&(b+e<height-1)&&
         (a+d<400)&&

       

       red(get(a+d,b+e))==0){// if the target is black
        int ram = 5;// makes the color change
        color clr = get(a,b);//
        int gr = int(constrain(green(clr)+random(-ram,ram),1,255));
        int re = int(constrain(red(clr)+random(-ram,ram),1,255));
        int bu = int(constrain(blue(clr)+random(-ram,ram),1,255));
        set(a+d,b+e,color(re,gr,bu));
      }
         }
  }
}




void keyPressed(){
  if(key==' '){
    reset();
  }
}




void reset(){
  background(0);
  stroke(#4F79AA);
  ellipse(1,1,1,1);
  stroke(#2E834D);
  ellipse(1,height,1,1);
  

//  set(width/2,height/2,color(255));

}
