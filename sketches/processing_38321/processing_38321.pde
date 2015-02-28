
PFont font;
String think = "I think about being this close to you.";
int x;
int y;
int z;
int i=0;
int s;//spacing
int l = 12;//lines per square

void setup(){
  size(700,700);
  font = loadFont("Haettenschweiler-18.vlw");
  textFont(font);
  s = width/10;
  smooth();
  textAlign(CENTER);
}

void draw(){
  background(206,186,133);//brown cream
  textSize(6.9);
  
  for(x=0; x<=width; x=x+s){
    for(y=0; y<=height; y=y+s){
      noFill();
      //rect(x,y,s,s);
      fill(72,25,9);//red brown
      fill(63,4,0);
      for(z=0; z<=l-4; z=z+4){
        text("I think about being this close to you", x, y+  (z+0)*s/l,  s,s);
        fill(72,25,9);//red brown
        text("I think about being this",    x, y+  (z+1)*s/l,  s,s);
        fill(142,38,17);//med red
        text("close to you. I think",     x, y+  (z+2)*s/l,  s,s);
        fill(100,31,27);//dark red
        text("about being this close to you.", x, y+  (z+3)*s/l,  s,s);
      }
    }
  }
 
}

