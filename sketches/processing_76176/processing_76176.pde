
PImage img;
PFont font;
void setup(){
  frameRate(15);
  background(255);
  font = createFont("メイリオ",48);
  textFont(font);
  textSize(255);
  textAlign(CENTER,CENTER);
  fill(0);
  //text("あ", width/2,height/2-40);
  //img = get();
    img = loadImage("original.jpg");
    size(1280,720);
  //size(img.width,img.height);
  smooth();
  noStroke();
  imgExt();
}
String [] moziR = {"手","寅"};
int shik = 40;
int part =11;
int pikax = 255;
void imgExt(){
  background(0);
  fill(255);
  int moziCNT = 0;
  textSize(part);
  for(int x=0;x<width;x+=part){
    for(int y=0;y<height;y+=part){
      boolean f = false;
      for(int x2=x;x2<x+part&!f&x2<width;x2++){
        for(int y2=y;y2<y+part&!f&y2<height;y2++){
          if(red(img.get(x2,y2)) <= shik |
             blue(img.get(x2,y2))  <= shik |
             green(img.get(x2,y2))  <= shik){
            f = true;
            fill(img.get(x2,y2));
          }
          if(red(img.get(x2,y2)) == shik |
             blue(img.get(x2,y2))  == shik |
             green(img.get(x2,y2))  == shik){
              fill(pikax);
             }
        }
      }
      if(f){
        text(moziR[moziCNT%moziR.length],x,y);
        moziCNT++;
        //rect(x,y,part,part);
      }
    }
  }
}
int pmins = 25;
void draw(){
  imgExt();
  shik++;
  if(pikax>pmins){
    pikax-= pmins;
  }
}

void keyPressed(){
  if(keyCode == LEFT)shik++;
  if(keyCode == RIGHT)shik--;
  if(keyCode == UP)shik=255;
  if(keyCode == DOWN)shik=0;
  if(key == ' ')pikax=255;
}




