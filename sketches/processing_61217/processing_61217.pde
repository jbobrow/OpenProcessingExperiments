
class Strings{
  String str;
  int x,y;
  String user;
  int number;
  Strings(String s, int tx, int ty, String tuser, int no){
    x = tx;
    y = ty;
    str = s;
    user = "@" + tuser;
    number = no;
  }
  void move(int tx, int ty){
    x += tx;
    y += ty;
  }
  void set(String strings,int tx, int ty){
    x = tx;
    y = ty;
    str = strings;
  }
  int returnx(){
    return x;
  }
  int returny(){
    return y;
  }
  String returns(){
    return str;
  }
  int returnno(){
    return number;
  }
  String returnuser(){
    return user;
  }

  void info(){  
    textFont(bigfont, 30); 
    int tx,ty;
    tx = constrain(x,0,width - 400);
    ty = constrain(y,0,height - 290);
    fill(0,0,0,150);
    rect(tx,ty,400,290);
    stroke(255);
    fill(20,20,255);
    text(user + ":",tx+1,ty+30);
    String line = "";
    int l = 0;
    for(int i = 0;i < str.length(); i++){
      line = line + str(str.charAt(i));
      if(textWidth(line) > 385){
        l++;
        fill(255);
        text(line, tx+1,ty+30+(30*l));
        line = "";
      }
    }
    fill(255);
    l++;
    text(line, tx+1,ty+30+(30*l));
    //the @dudes at the end
    //begin @people
    l=6;
    line = "";
    fill(50,255,50);
    for(int i = 0;i < getat(str,' ').length(); i++){
      line = line + str(getat(str,' ').charAt(i));
      if(textWidth(line) > 385){
        l++;
        text(line, tx+1,ty+30+(30*l));
        line = "";
      }
    }
    l++;
    text(line, tx+1,ty+30+(30*l));
    //done with the @people
  }
  void draw(){
    stroke(255);
    fill(255);  
    text(str,x,y);
  }
}



