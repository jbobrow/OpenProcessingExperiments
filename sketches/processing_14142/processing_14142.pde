

int blux=25,
bluy=150,
lblux=375,
lbluy=150,
bmov=0,
lbmov=2,
win=0,
bscore=0,
lbscore=0;

PFont font;
void setup(){
  size(400,300);
  frameRate(200);
  background(255);
  font = loadFont("joystix.vlw");
  textFont(font,18);
  textAlign(LEFT,TOP);
}

void draw(){
  if(win==0){
    noFill();
    loadPixels();
    stroke(0);
    rect(5,30,width-11,height-35);
    println(pixels[bluy*width+(blux+2)]);
    fill(0);
    textAlign(LEFT,TOP);
    fill(0,0,255);
    text("Blue:"+bscore,0,5);
    textAlign(RIGHT,TOP);
    fill(0,255,255);
    text("LightBlue:"+lbscore,width,5);
    textAlign(CENTER);
    noFill();
    if(bmov==0){
      blux++;
      if(pixels[bluy*width+(blux+1)]!=-1){
        lbscore++;
        fill(0,255,255);
        win=1;
        text("LightBlue wins!",width/2,height/2);
        text("Press Space",width/2,height/2+50);
      }
    } else if(bmov==1){
      bluy--;
      if(pixels[(bluy-1)*width+(blux)]!=-1){
        lbscore++;
        fill(0,255,255);
        win=1;
        text("LightBlue wins!",width/2,height/2);
        text("Press Space",width/2,height/2+50);
      }
    } else if(bmov==2){
      blux--;
      if(pixels[bluy*width+(blux-1)]!=-1){
        lbscore++;
        fill(0,255,255);
        win=1;
        text("LightBlue wins!",width/2,height/2);
        text("Press Space",width/2,height/2+50);
      }
    }
    else if(bmov==3){
      bluy++;
      if(pixels[(bluy+1)*width+(blux)]!=-1){
        lbscore++;
        fill(0,255,255);
        win=1;
        text("LightBlue wins!",width/2,height/2);
        text("Press Space",width/2,height/2+50);
      }
    }
    if(lbmov==0){
      lblux++;
      if(pixels[lbluy*width+(lblux+1)]!=-1){
        bscore++;
        fill(0,0,255);
        win=1;
        text("Blue wins!",width/2,height/2);
        text("Press Space",width/2,height/2+50);
      }
    } else if(lbmov==1){
      lbluy--;
      if(pixels[(lbluy-1)*width+(lblux)]!=-1){
        bscore++;
        fill(0,0,255);
        win=1;
        text("Blue wins!",width/2,height/2);
        text("Press Space",width/2,height/2+50);
      }
    } else if(lbmov==2){
      lblux--;
      if(pixels[lbluy*width+(lblux-1)]!=-1){
        bscore++;
        fill(0,0,255);
        win=1;
        text("Blue wins!",width/2,height/2);
        text("Press Space",width/2,height/2+50);
      }
    } else if(lbmov==3){
      lbluy++;
      if(pixels[(lbluy+1)*width+(lblux)]!=-1){
        bscore++;
        fill(0,0,255);
        win=1;
        text("Blue wins!",width/2,height/2);
        text("Press Space",width/2,height/2+50);
        
      }
    }
    stroke(0,0,255);
    point(blux,bluy);
    stroke(0,255,255);
    point(lblux,lbluy);
  } else{
   
   win=1;
   blux=25;
   bluy=150;
   lblux=375;
   lbluy=150;
   bmov=0;
   lbmov=2;
   if(key == ' '){
     win=0;
     background(255);
    }
  }
}

void keyPressed() {
  if(keyCode == UP&&lbmov!=3){
    lbmov=1;
  } 
  else if(keyCode == DOWN&&lbmov!=1) {
    lbmov=3;
  } 
  else if(keyCode == LEFT&&lbmov!=0) {
    lbmov=2;
  } 
  else if (keyCode == RIGHT&&lbmov!=2) {
    lbmov=0;
  }
  else if (key == 'w'&&bmov!=3) {
    bmov=1;
  } 
  else if (key == 'a'&&bmov!=0) {
    bmov=2;
  } 
  else if (key == 's'&&bmov!=1) {
    bmov=3;
  }
  else if (key == 'd'&&bmov!=2) {
    bmov=0;
  }
} 



