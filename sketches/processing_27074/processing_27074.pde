
class Letter {

  char letter_key;
  int size_offset;
  float transparent;
  float x;
  float y;
  float fade_rate;
  
  Letter(char constr_key, int size_offset) {
    this(constr_key, size_offset, random(0,width-fontsize), random(0+fontsize,height), fade_speed);
  }  
  Letter(char constr_key, int size_offset, float x, float y, float fade_rate) {
    this.letter_key = constr_key;
    this.size_offset = size_offset;
    this.transparent = 255;
    this.x = x;
    this.y = y;
    this.fade_rate = fade_rate;
  }

  void display() {
    fill(random(0,255),random(0,255),random(0,255),transparent);
    textFont(font,fontsize+size_offset);
    text(letter_key,x,y);
    transparent -= fade_rate;
  }
  
  boolean gone() {
    if (transparent < 0) {
      return true;
    } else {
      return false;
    }
  }
}


