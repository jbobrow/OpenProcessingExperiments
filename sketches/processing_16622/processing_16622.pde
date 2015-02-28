
import codeanticode.gsvideo.*;

GSMovie video;

float b,b0,r,g,t;
PFont font;

void setup() {
 size(screen.width/2+70,screen.height/2);
 background(255);
  video = new GSMovie(this, "video.mpg"); 
  b=0;
  
  video.loop();
font = createFont("",30);  
}
void draw(){
  
  //video.play();
  if(video.available() ){
    video.read();
    tint(r,g,b0/*,t*/);
    image(video,random(-5,5),random(-15,15),width,height);
    filter(BLUR);
    filter(POSTERIZE, 15);
    }
  constrain(b,0,255);
  escreve(" Cenário em decomposição.");
  comeBack();
  }

void escreve(String t){
fill(r,g,b0);
textFont(font);
text(t,0,height-80);
noFill();
}  

void comeBack(){
r=millis()/10;
  b0=millis()/20;
  g=millis()/90;
  t=millis()/1000;
 
}

