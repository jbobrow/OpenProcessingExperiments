
int ccc=#E817C6;
int aaa=#17D5E8;
int x1=#41FA19;
void setup(){
  size(600,600);
  background(0);
}
void draw(){
  if(mousePressed)
{
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  if(keyPressed){
    if(key=='a'){
  stroke(ccc);  }
}
if(key=='b'){
  stroke(aaa);
}
  if(key=='c'){
    stroke(x1);
  }
  if(key=='d'){
    stroke(#40A5F5);
  }
  if(key=='e'){
    stroke(#70C137);
  }
  if(key=='f'){
    stroke(#F0E927);
  }
      if(key=='g'){
        stroke(#FA8C47);
      }
      if(key=='h'){
        stroke(#FA475F);
      }
      if(key=='i'){
        stroke(#E83F75);
      }
      if(key=='j'){
        stroke(#AC3BEA);
      }
}
