
int spacing = 3;
int tilt = 0;
int x;
int y;
int j=0;
int i=0;
float l=2;//line weight
color c=color(0);//lines
color f=color(255);//background


void setup(){
  size(1000,1000);
  background(255);
  smooth();
  strokeWeight(l);
  y=height/2;
}

void draw(){
  background(f);
  fill(f);
  beginShape();
    vertex(-150,0);
    vertex(-150,0);
    vertex(mouseX-150,y);
    vertex(-150, height);
    vertex(width, height);
    vertex(width,0);
    endShape(CLOSE);
  tilt=mouseX;
  strokeWeight(l);
  stroke(c);
  for (int x= -150; x <= width; x = x+spacing){
    line(x,0, x+tilt, y);
    line(x,height, x+tilt, y);
  }
  /*
  strokeWeight(l/4);
  //stroke(0,0,0, map(mouseX, 0,width, width/2,width));
  if (i<height*2){
    i = i+5;
    line(0+j, height/2+i, width*.8,y);
    if (i>=height/2){
      j=j+5;
    }
    if (j>=width*.8){
      i=i-5;
    }
    if (j>=height*2){
      j=0;
      i=0;
    }
  }
  */
}

void keyTyped(){
  if(key=='2'){
    l=l-.1;
    if(l<=0){
    l=.1;
    }
  }else if(key=='3'){
    l=l+.1;
    if(l>=10){
      l=10;
    }
  }
  if(key=='4'){
     spacing=spacing-1;
      if (spacing<=0){
        spacing=1;
      }
    }
  if(key=='5'){
    spacing=spacing+1;
    if (spacing>=10){
      spacing=10;
     }
   }
    if((key=='r')||(key=='R')){
      if(mousePressed){
        c=color(255,0,0);
      }else{
        f= color(255,0,0);
      }
    } 
    if((key=='o')||(key=='O')){
      if(mousePressed){
        c=color(255,110,0);
      }else{
      f= color(255,110,0);
      }
    }
    if((key=='y')||(key=='Y')){
      if(mousePressed){
        c=color(255,225,0);
      }else{
        f= color(255,255,0);
      }
    }
    if((key=='g')||(key=='G')){
      if(mousePressed){
        c=color(0,255,0);
      }else{
        f= color(0,255,0);
      }
    }
    if((key=='b')||(key=='B')){
      if(mousePressed){
        c=color(0,0,255);
      }else{
        f= color(0,0,225);
      }
    }
    if((key=='p')||(key=='P')){
      if(mousePressed){
        c=color(80,0,145);
      }else{
        f= color(80,0,145);
      }
    }   
}

void keyPressed(){
  if(key=='1'){
    y=mouseY;
  }
  if(key==' '){
    y=height/2;
  }
}


