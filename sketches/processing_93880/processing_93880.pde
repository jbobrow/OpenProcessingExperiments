
PImage weed;
PImage weed2;
PFont f;
String[] s;

void setup(){
  size(160, 200);
  weed = loadImage("weed1.png");
  weed2 = loadImage("weed outline.png");
  fill(105);
  noStroke();
  
  f = createFont("Georgia", 10, true);
  textFont(f);
  textAlign(CENTER);
  smooth();
  
  parse();
}

void parse(){
  s = loadStrings("weed.txt");
}

//void draw(){
//  int year_ = mouseY / 200 * 5 + 2000;
//  int i;
//  for(i = 0; toInt(s[i].substring(0, 4)) != year_; i++){}
//  
//  int height_ = (int)((double)toInt(s[i].substring(7, 11))/10000*160);
//  
//  background(105);
//  image(weed, 0, 0);
//  rect(0, 0, 160, height_);
//  image(weed2, 0, 0);
//}

void draw() {
  background(255);
  image(weed, 0, 0);
  
  int height_ = 0;
  
  if(mouseX > 0 && mouseX <= 32){height_ = (int)((double)toInt(s[0].substring(7, 11))/10000*160);}
    else{if(mouseX > 32 && mouseX <= 64){height_ = (int)((double)toInt(s[1].substring(7, 11))/10000*160);}
      else{if(mouseX > 64 && mouseX <= 96){height_ = (int)((double)toInt(s[2].substring(7, 11))/10000*160);}
        else{if(mouseX > 96 && mouseX <= 128){height_ = (int)((double)toInt(s[3].substring(7, 11))/10000*160);}
          else{if(mouseX > 128 && mouseX <= 160){height_ = (int)((double)toInt(s[4].substring(7, 11))/10000*160);}
  }}}}
  //2000
  if(mouseX > 0 && mouseX <= 32) {
    fill(255, 0, 0);
    text("2000", 16, 190);  
    fill(0);
    text("2001", 48, 190);  
    text("2002", 80, 190);  
    text("2003", 112, 190);  
    text("2004", 148, 190);
    text(s[0].substring(6, s[0].length()), 80, 170);
  }
  else{
    //2001
    if(mouseX > 32 && mouseX <= 64) {
      fill(0);
      text(s[1].substring(6, s[1].length()), 80, 170);
      text("2000", 16, 190);  
      fill(255, 0, 0);
      text("2001", 48, 190);  
      fill(0);
      text("2002", 80, 190);  
      text("2003", 112, 190);  
      text("2004", 148, 190);
    }
    else{
      //2002
      if(mouseX > 64 && mouseX <= 96) {   
        fill(0);
        text(s[2].substring(6, s[2].length()), 80, 170);
        text("2000", 16, 190);  
        text("2001", 48, 190);  
        fill(255, 0, 0);
        text("2002", 80, 190);  
        fill(0);
        text("2003", 112, 190);  
        text("2004", 148, 190);
      }
      else{
        //2003
        if(mouseX > 96 && mouseX <= 128) {
          fill(0);
          text(s[3].substring(6, s[3].length()), 80, 170);
          text("2000", 16, 190);  
          text("2001", 48, 190);  
          text("2002", 80, 190);  
          fill(255, 0, 0);
          text("2003", 112, 190);  
          fill(0);
          text("2004", 148, 190);
        }
        else{
          //2004
          if(mouseX > 128 && mouseX <= 160) {
            fill(0);
            text(s[4].substring(6, s[4].length()), 80, 170);
            text("2000", 16, 190);            
            text("2001", 48, 190);  
            text("2002", 80, 190);  
            text("2003", 112, 190); 
            fill(255, 0, 0); 
            text("2004", 148, 190);
          }
        }
      }
    }
  }
  
  fill(255);
  rect(0, 0, 160, height_);
  image(weed2, 0, 0);
}

double toInt(String s){
  double num = 0;
  boolean decimal = false;
  int dec = 0;
  boolean negative = false;
  
  for(int i = 0; i < s.length(); i++){
    if(s.charAt(i) == '-'){
      negative = true;
    }else{
      if(s.charAt(i) == '.'){
        decimal = true;
      }else{
        num = num + ((int)s.charAt(i)) - 48;
        num *= 10;
      }
    }
    if(decimal){
      dec++;
    }
  }
  
  while(dec > 1){
    num /= 10;
    dec--;
  }
  num /= 10;
  if(negative){
    num = -num;
  }
  return num;
}

