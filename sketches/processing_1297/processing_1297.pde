
/** 
write some text. DELETE to clear 
*/
// by Bartosz Polonski myspace.com/gluklab
// 2009 kovo 23
String a="abcdefghijklmnopqrstuvwxyz";
String s="";
float[] l=new float[a.length()];
PFont font;
int def=30;
void setup(){
  size(400,400);  
  font=loadFont("Verdana-10.vlw"); 
  for (int i=0;i<a.length();i++){
  l[i]=def;
  }
}
void draw(){

  background(255);
  int n=0;
  for (float i=1;i<360;i+=13.9){
    pushMatrix();
    translate(width/2,height/4);
    beginShape();
    vertex(0,0);
    vertex(l[n]*sin(radians(i)),l[n]*cos(radians(i)));
    endShape();
    fill(100,255,50);
    stroke(100,255,50);
    ellipse(l[n]*sin(radians(i)),l[n]*cos(radians(i)),3,3);
    textFont(font); 
    fill(l[n]*2,0,0);
    translate(-4,4);
    if (n<26){
      text(a.charAt(n),(l[n]+11)*sin(radians(i)),(l[n]+11)*cos(radians(i)));       
      n++;
    }
    popMatrix();
  }
 fill(150);
 textFont(font);
 text(s, 40, height/2, width-40-40, height-40);
}

 void keyPressed() {
 s=s+key;
    for (int i=0;i<a.length();i++)
 if (key == a.charAt(i)) {    
    l[i]=l[i]+3.8;   
  }
  if (key == DELETE){
  kill();
  }
 if (s.length()==746){
 kill();
 }
  }
 void kill(){
   for (int i=0;i<a.length();i++){
     l[i]=def;
    }
    s="";
 }

