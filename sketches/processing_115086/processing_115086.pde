
/*
bump de bump
Max Bowe
Visual foundation studio
*/
Timer time;
PImage[] pic=new PImage[3];
PFont font;
static final int sizeX=400, sizeY=400;
void setup(){
  size(400,400);
  background(23,52,3);
  rectMode(CORNERS);
  time= new Timer(2000);
  time.start();
  font= loadFont("font.vlw");
  textFont(font,32);
  for (int i =0; i < pic.length; i++) {        
    pic[i] = loadImage("woof" + i + ".png");
  }

 
}
void draw(){
  smooth();
  frameRate(9);
  fill(255);
  
  
  Box boxy =new Box(0,0,sizeX,sizeY);
  boxy.boxesMove();
 
  Explosion exploder=new Explosion();
  
  name();

  if (time.isFinished()){

    exploder.timedExplode(pic);
    time.start();    
    
  }

}




class Box{
 int x1=0, y1=0,x2=sizeX,y2=sizeY;
   Box(int x1, int y1, int x2, int y2){
   x1=x1;
   x2=x2;
   y1=y1; 
   y2=y2;
   }
   void boxMove(){
    float rand = randomSize();
    
    x1+=rand;
    x2-=rand;
    y1+=rand;
    y2-=rand;
    strokeWeight(1.5);
    stroke(randomColors());
    rect(x1,y1,x2,y2);
   
   }
  void boxesMove(){
  fill(0);
   while(x2>=sizeX/2){
    boxMove();
  }
 
}
}

class Explosion{
  float x,y;
 Explosion(){
 }
 void explode(float x, float y){
    ellipseMode(CORNERS);
    strokeWeight(1);
    ellipse(x-30,y-30,x+30,y+30);
    strokeWeight(4);
    line(x,y,x+20,y+20);
    line(x,y,x-20,y+20);
    line(x,y,x-20,y-20);
    line(x,y,x+20,y-20);
    line(x-20,y,x+20,y);
    line(x,y-20,x,y+20);  
  }
  void timedExplode(PImage[] pic){
       frameRate(4);
     fill(255);
     explode(200,100);
     int x=170,y=70;
     for(int i=0;i<pic.length;i++){
       
      image(pic[i],x,y);
        x+=10;
        y+=10;
     }
     explode(200,300);
     x=170;y=270;
     for(int i=0;i<pic.length;i++){
       
      image(pic[i],x,y);
        x+=10;
        y+=10;
     }
     explode(100,200);
     x=70;y=170;
     for(int i=0;i<pic.length;i++){
       
      image(pic[i],x,y);
        x+=10;
        y+=10;
     }
     explode(300,200);
     x=270;y=170;
     for(int i=0;i<pic.length;i++){
       
      image(pic[i],x,y);
        x+=10;
        y+=10;
     }
 }
}
  

  //randomize colors
color randomColors(){
  float R= random(1,250);
  float G =random(1,250);
  float B =random(1,250);
  return color(R,G,B);
}

float randomPlace(){
  float Rand =  random(10,390);
  return Rand;
}
//randomize size
float randomSize(){
  float Rand =  random(1,5);
  return Rand;
}

void name(){
  strokeWeight(10);
  //m
  float x= mouseX;//keeps Letters in proper shape
  float y=mouseY; 
  String[] lines = loadStrings("name.txt");
  String lines2 = join(lines," ");
  char[] nameArray = lines2.toCharArray();
  fill(randomColors());
  
  for(int i=0; i<lines2.length(); i++){
   stroke(randomColors());
   if(nameArray[i]=='a'){
     //A
       line(x, y+80, x+30, y);
       line(x+60, y+80,x+30, y);
       line(x+10, y+55, x+50, y+55);
    }
  else if(nameArray[i]=='b'){
    //B
       line(x,y, x, y+80);
       line(x+60, y, x+60, y+80);
       line(x,y,x+60,y);
       line(x,y+40,x+60,y+40);
       line(x,y+80,x+60,y+80);
  }
  else if(nameArray[i]=='c'){
   //C
       line(x,y, x, y+80);
       line(x,y+80,x+60,y+80);
       line(x,y,x+60,y);
  }
  else if(nameArray[i]=='d'){
  //D
      line(x,y, x, y+80);
      line(x+60, y+20, x+60, y+60);  
      line(x,y+80, x+60,y+60);
      line(x,y,x+60,y+20);
  }
  else if(nameArray[i]=='e'){
  //E
      line(x,y, x, y+80);
      line(x,y,x+60,y);
      line(x,y+40,x+60,y+40);
      line(x,y+80,x+60,y+80);
  }
  else if(nameArray[i]=='f'){
  //F
      line(x,y, x, y+80);
      line(x,y,x+60,y);
      line(x,y+40,x+60,y+40);
  }
  else if(nameArray[i]=='g'){
  //G
      line(x,y, x, y+80);
      line(x+60, y+40, x+60, y+80);
      line(x,y+80, x+60,y+80);
      line(x,y,x+60,y);
      line(x+30,y+40,x+60,y+40);
  }
  else if(nameArray[i]=='h'){
  //H
      line(x,y, x, y+80);
      line(x+60, y, x+60, y+80);
      line(x,y+40,x+60,y+40);
  }
  else if(nameArray[i]=='i'){
  //I
      line(x,y+80,x+60,y+80);
      line(x,y,x+60,y);
      line(x+30,y,x+30,y+80);
  }
  else if(nameArray[i]=='j'){
  //J
      line(x,y+80,x+30,y+80);
      line(x+30,y,x+30,y+80);
      line(x,y,x+60,y);
  }
  else if(nameArray[i]=='k'){
  //K
      line(x,y, x, y+80);
      line(x,y+40,x+60,y);
      line(x,y+40,x+60,y+80);
  }
  else if(nameArray[i]=='l'){
  //L
      line(x,y, x, y+80);
      line(x,y+80,x+60,y+80);
  }
  else if(nameArray[i]=='m'){
  //M
      line(x, y,x, y+80);
      line(x,y,x+30,y+80);
      line(x+60,y,x+30,y+80);
      line(x+60,y, x+60,y+80);
  }
  else if(nameArray[i]=='n'){
  //N
      line(x, y,x, y+80);
      line(x,y,x+60,y+80);
      line(x+60,y,x+60,y+80);
  }
 else if(nameArray[i]=='o'){
 //O
      line(x,y, x, y+80);
      line(x+60, y, x+60, y+80);
      line(x,y+80, x+60,y+80);
      line(x,y,x+60,y);
 }
 else if(nameArray[i]=='p'){
 //P
      line(x,y, x, y+80);
      line(x+60, y, x+60, y+40);
      line(x,y,x+60,y);
      line(x,y+40,x+60,y+40);
 }
  else if(nameArray[i]=='q'){
  //Q
      line(x,y, x, y+80);
      line(x+60, y, x+60, y+80);
      line(x,y+80, x+60,y+80);
      line(x,y,x+60,y);
      line(x+30,y+40,x+60,y+80);
  }
  else if(nameArray[i]=='r'){
  //R
      line(x,y, x, y+80);
      line(x+60, y, x+60, y+40);
      line(x,y,x+60,y);
      line(x,y+40,x+60,y+40);
      line(x,y+40,x+60,y+80);
  }
  else if(nameArray[i]=='s'){
  //S
      line(x,y, x, y+40);
      line(x+60, y+40, x+60, y+80);
      line(x,y,x+60,y);
      line(x,y+40,x+60,y+40);
      line(x,y+80,x+60,y+80);
  }
  else if(nameArray[i]=='t'){
  //T
      line(x+30,y,x+30,y+80);
      line(x,y,x+60,y);
  }
  else if(nameArray[i]=='u'){
  //U
      line(x,y, x, y+80);
      line(x+60, y, x+60, y+80);
      line(x,y+80, x+60,y+80);
  }
  else if(nameArray[i]=='v'){
  //V
      line(x,y, x+30, y+80);
      line(x+60, y, x+30, y+80);
  }
  else if(nameArray[i]=='w'){
  //W
      line(x, y,x, y+80);
      line(x+30,y+20,x,y+80);
      line(x+30,y+20,x+60,y+80);
      line(x+60,y, x+60,y+80);
  }
 else if(nameArray[i]=='x'){
  //X
      line(x, y, x+40, y+80);
      line(x, y+80, x+40, y); 
 }
  else if(nameArray[i]=='y'){
  //Y
      line(x,y,x+30,y+40);
      line(x+70,y,x+30,y+40);
      line(x+30,y+40,x+30,y+80);
  }
  else if(nameArray[i]=='z'){
  //Z
      line(x,y,x+60,y);
      line(x,y+80,x+60,y+80);
      line(x,y+80,x+60,y);
    }
    if (nameArray[i]==' ' && x-50<0){
      
    }
    else if (x+110>sizeX){
    y+=100;
     x=10; 
    }
    else{
     x+=80; 
    }
    if(mousePressed){
    text(lines2,400-mouseX,400-mouseY);
    }
  }
}




class Timer {
 int time; 
 int limit;
 
 Timer(int timeLimit){
   limit=timeLimit; 
  }
  void start(){
   time=millis(); 
  }
  boolean isFinished() {
  int passedTime=millis()-time;
  if (passedTime > limit){
      return true;
     } 
  else{
     return false;
   }
  }
}


