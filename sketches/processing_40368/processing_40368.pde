
PFont f;

String word = "I AM WHO I AM";
String name = "I";
String pronoun = "AM";
String posess = "WHO" ;
void setup(){
  size(900,900);
  smooth();
  f= loadFont("ACaslonPro-Italic-48.vlw");
  background(0);
  
}
float selector=2;
float posX=50;
float posY=50;
int a=0;
int b=0;
int c=0;
float i=1;

void draw(){
  //text conversion;
  fill(0,0,0,.1);
  rect(0,0,width,height);
 selector=random(1,3);
  posX=random(50,width-100);
  posY=random(50,width-100);
   textFont(f);
  if(selector<1){
    fill(255,255,255,i);
   pushMatrix();
   translate(posX,posY);
   rotate(2*i);
    text(name,posX,posY);
    popMatrix();
    a=1;
  }
  else if(selector<2){
      fill(255,255,255,i);
      pushMatrix();
      translate(posX,posY);
      rotate(2*i);
    text(pronoun,posX,posY);
    popMatrix();
    b=1;
  }
  else if(selector<3){
    pushMatrix();
    translate(posX,posY);
    rotate(2*i);
      fill(255,255,255,i);
    text(posess, posX,posY);
    popMatrix();
    c=1;
  }
 
  for(int t=0; t<=height; t=t+50){
    for(int z=0; z<=width; z=z+250){
    fill(0,0,0,random(0,20));
text(name+pronoun+posess,20+z,20+t);
    }
  }
  //string parsing
  //line brea::\ln
  //chracters inside the sring " \[insertcharacter]"

 i=i+0.1;
 if(i>100){
   i=1;
 }

for (int q=0;q<word.length();q++)
{
  fill(255,255,255);
  float j = mouseX-pmouseX;
  float y = mouseY-pmouseY;
char letter = word.charAt(q);
text(letter, mouseX+q*20,mouseY+50*cos(q));

}
}



