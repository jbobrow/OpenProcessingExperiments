
/* @pjs preload="ColorWheel.jpg,t1.jpg"; */ 
color col;
PImage img;
PImage img2;
PImage img3;
PImage img4;
int x;
int y;
int i;
int e;
int r;
boolean a;
boolean b;
boolean c;

void setup(){
  size(700,700);
  background(255);
  img = loadImage("ColorWheel.jpg");
  img.resize(150,150);
  img2 = loadImage("t1.jpg");
  img2.resize(120,120);
  col = 0;
  i = 25;
  e=0;
  x=350;
  y=350;
}

void draw(){
  image(img,0,0); 
  if(mousePressed == true){
    if(mouseButton == LEFT){
      if (mouseX<=145 && mouseY<=145){
        col = get(mouseX,mouseY);       
      }
      fill(col);
      if(a==true){
        //if (mouseX<=150 && mouseY <=150){}
        //else{
        noStroke();
        ellipse(mouseX,mouseY,25,25);
        stroke(col);
        strokeWeight(25);
        line(mouseX,mouseY,x,y);
        x=mouseX;
        y=mouseY;
        //}
      }
      if(b==true){
       if(x == mouseX && y == mouseY){
            stroke(col);
            strokeWeight(i);
            ellipse(mouseX,mouseY,25,25);
            i++;
     }else{
      i=25;
      noStroke();  
      ellipse(mouseX,mouseY,25,25);
    }
      x=mouseX;
      y=mouseY;
    }
    if(c==true){
        image(img2,mouseX,mouseY);
    }
  }
    else{
      noStroke();
      fill(255);
      rect(mouseX,mouseY,25+e,25+e);
    }  
  }
  if(keyPressed){
    if(key=='d'||key=='D'){
      col=0;
    }
    if(key=='e'||key=='E'){
      e+=5;
    }
    if(key=='w'||key=='W'){
      e-=5;
    }
    if(key=='a'||key=='A'){
      a=true;
      b=false;
      c=false;
    }
    if(key=='b'||key=='B'){
      a=false;
      b=true;
      c=false;
    }
    if(key=='c'||key=='C'){
      a=false;
      b=false;
      c=true;
    }
    
   }
}

