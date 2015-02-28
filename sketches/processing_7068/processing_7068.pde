
int x1=50,y1=300,x2=550,y2=300,a1=0,a2=2,t,w=0,rs=0,bs;

PFont font;
void setup(){
  size(600,600);
  frameRate(100);
  background(255);
  font = loadFont("Monospaced-48.vlw");
  textFont(font,48);
  textAlign(LEFT,TOP);
  strokeWeight(2);
}

void draw(){
  if(t==0){
    noFill();
    loadPixels();

    stroke(0);
    rect(5,50,width-11,height-56);
    println(pixels[y1*width+(x1+1)]);
    fill(0);
      textAlign(LEFT,TOP);
    text("RED:"+rs,0,5);
      textAlign(RIGHT,TOP);
          text("BLUE:"+bs,width,5);
          textAlign(CENTER);
        noFill();
    if(a1==0){
      x1++;
      if(pixels[y1*width+(x1+1)]!=-1){
           bs++;
            t=1;
                    fill(0);
        text("Blue Wins",width/2,height/2);
      }
    }
    else if(a1==1){
      y1--;
      if(pixels[(y1-1)*width+(x1)]!=-1){
        bs++;
           t=1;
                               fill(0);
        text("Blue Wins",width/2,height/2);
      }
    }
    else if(a1==2){
      x1--;
      if(pixels[y1*width+(x1-1)]!=-1){
        bs++;
            t=1;
                                fill(0);
        text("Blue Wins",width/2,height/2);
      }
    }
    else if(a1==3){
      y1++;
      if(pixels[(y1+1)*width+(x1)]!=-1){
        bs++;
             t=1;
                                 fill(0);
        text("Blue Wins",width/2,height/2);
      }
    }
    if(a2==0){
      x2++;
      if(pixels[y2*width+(x2+1)]!=-1){
        rs++;
        fill(0);
        text("Red Wins",width/2,height/2);
             t=1;
      }
    }
    else if(a2==1){
      y2--;
      if(pixels[(y2-1)*width+(x2)]!=-1){
        rs++;
            t=1;
                    fill(0);
        text("Red Wins",width/2,height/2);
      }
    }
    else if(a2==2){
      x2--;
      if(pixels[y2*width+(x2-1)]!=-1){
        rs++;
            t=1;
                    fill(0);
        text("Red Wins",width/2,height/2);
      }
    }
    else if(a2==3){
      y2++;
      if(pixels[(y2+1)*width+(x2)]!=-1){
        rs++;
        t=1;
                fill(0);
        text("Red Wins",width/2,height/2);
      }
    }
    stroke(255,0,0);
    point(x1,y1);
    stroke(0,0,255);
    point(x2,y2);
  }
  else{
   fill(0);
   println(w);
noFill();
text("Click to Restart",width/2,height/2+50);
  t=1;
  x1=50;
  y1=300;
  x2=550;
  y2=300;
  a1=0;
  a2=2;
    if(mousePressed==true){
      t=0;
           background(255);
    }
  }


}

void keyPressed() {
  if(keyCode == UP&&a2!=3){
    a2=1;
  } 
  else if(keyCode == DOWN&&a2!=1) {
    a2=3;
  } 
  else if(keyCode == LEFT&&a2!=0) {
    a2=2;
  } 
  else if (keyCode == RIGHT&&a2!=2) {
    a2=0;
  }
  else if (key == 'w'&&a1!=3) {
    a1=1;
  } 
  else if (key == 'a'&&a1!=0) {
    a1=2;
  } 
  else if (key == 's'&&a1!=1) {
    a1=3;
  }
  else if (key == 'd'&&a1!=2) {
    a1=0;
  }
} 
void reset(){

 
}


