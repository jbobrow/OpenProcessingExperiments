
Word word;
boolean hide = false;
 
void setup(){
  size(800,480);
  textAlign(CENTER);
  ellipseMode(CENTER);
  smooth();
  word = new Word("");
}
 
 
void draw(){
  background(100);
 
  pushMatrix();
  translate(width/2,height/2-30);
  word.draw();
 
  popMatrix();
 
}
 
 
class Word{
  String src;
  char [] message;
  float cx;
 
  Word(String _src){
    src = _src;
 
 
    rewrite();
 
    cx = (13*16 - message.length*16/2.0);
  }
 
  void rewrite(){
    message = new char[src.length()];
 
    for(int i = 0 ; i < src.length(); i++){
      message[i] = src.charAt(i);
    }
  }
 
  void draw(){
    pushMatrix();
    translate(-26*16/2.0-10,-50);
    cx +=  ((13*16 - message.length*16/2.0)-cx)/20.0 ;
 
    if(src.length()<=0){
      fill(255);
      text("type something",cx,120);
    }
 
    for(int i  = 0 ; i <  message.length ; i++){
 
      float x1 = i*16+20 + cx;
      float x2 = (((int)message[i])-97)*16+20;
 
      stroke(255,120);
 
      if(message[i]!=' '){
        //line(x1,120-14,x2,20+6);
        line(x1,120-14,x1,height);
        line(x2,20+6,x2,-height);
 
 
        noFill();
 
        bezier(x1,120-14,x1,80,x2,60,x2,20+6);
 
        if(!hide){
          fill(0);
          stroke(255);
 
 
 
          ellipse(x1,116,12,12);
 
 
          fill(255);
 
          text(message[i],x1,120);
        }
      }
    }
 
    if(!hide)
      for(int i  = 0 ; i <  26 ; i++){
 
        stroke(255);
        fill(#3A8C7E);
        ellipse(i*16+20,16,20 ,20);
 
        fill(255);
 
 
        text((char)(97+i),i*16+20,20);
      }
 
    popMatrix();
 
  }
}
 
void keyPressed(){
  if(key>=97 && key<=122 || key == ' '){
 
    if(word.src.length()<48){
      word.src += (char)key;
      word.rewrite();
    }
 
  }else if(keyCode==BACKSPACE){
    if(word.src.length()>=1)
      word.src = word.src.substring(0,word.src.length()-1);
    word.rewrite();
  }else if(keyCode==ENTER){
    hide=!hide;
  }
 
}


