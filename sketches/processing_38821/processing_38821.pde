

PFont font;
String think = "I think about being close to you.";
//String[] IDo= {"I still do.", "I do."};
int s = 10;//text size
//int index = int(random(IDo.length));
int i= 0;
int x=0;//"think" coordinate
int f=0;//"think" fill
int okX=80;
int okY=30;
int IDo;

void setup(){
  size(700,700);
  background(234,247,190);
  font = loadFont("Haettenschweiler-48.vlw");
  textFont(font);
  smooth();
  textAlign(CENTER);
}


void draw(){
  //background(234,247,190);
  if (keyPressed){
    if (key == '1'){
      fill(f);
      textSize(s);
      text(think, random(0,width), random(0,height)); 
    }
  }
  if (mousePressed){
    textSize(35);
    fill(234,247,190, 50);
    text("There, there.", mouseX, mouseY);
  }
}

void keyPressed(){
  if (key == CODED){
    if (keyCode == UP){
      s = s+3;
    }else if(s>1){
      if(keyCode == DOWN){
      s = s-2;
      }  
    }
    if(keyCode == RIGHT){
      f=f+5;
      if(f>75){
        f=75;
      }
    }
    if(keyCode == LEFT){
      f=f-5;
      if(f<0){
        f=0;
      }
    }
  }
}

void keyTyped(){
  if(key == CODED){
        if(keyCode == ' '){
          IDo = int(random(2*width/3, width));
        }
      }
    if(key == '2'){
      fill(0,0,72);
      textSize(25);
      //text(IDo[index], random(width/3), random(height)); 
      i=i+25;
      IDo = int(random(width/3));
      text("I do.", random(IDo), i);
      if(i>height){
        i=0;
      }
    }
    if(key == '3'){
      fill(44,26,121, 150);
      textSize(30);
      text("I still do.", random(0, width), random(height/2, height));
    }
    if (key == BACKSPACE || key == DELETE){
      okY=okY+30;
      fill(234,247,190);
      textSize(50);
      text("It's okay.", okX, okY);
      if (okY>height){
        okY=30;
        okX=okX+120;
      }
      if(okX>width){
        okX=80;
      }
      
    }
  }


