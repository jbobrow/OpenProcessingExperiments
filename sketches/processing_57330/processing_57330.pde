
int sizework = 150;
int sizeside = 10;


int hsizework = sizework/2;
int hsizeside = sizeside/2;

color c1 = color(204, 153, 0);
color c2= #F7E405;
int i,j;

void setup() {  //setup function called initially, only once
 background(0,0,0,0);
  size(sizework, sizework);
  frameRate(0.5);
  i=0;
  j=0;
}
void draw(){

i = i+(sizeside*2);
j = j+(sizeside*2);
 fill(c1);
 ellipse(i+hsizeside,j+hsizeside,sizeside,sizeside); //first line}
 ellipse(i+hsizeside+sizeside,j+hsizeside+sizeside,sizeside,sizeside); //second line
 fill(c2);
 rect((i+hsizeside*2),j,sizeside,sizeside); //first line
 rect(i,j+sizeside,sizeside,sizeside);  //second line
}

