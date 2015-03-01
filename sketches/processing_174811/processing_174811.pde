
void setup() {
  background(0);
  text("RAINBOW PAGE\n SAY WHAT", 5, 30);// draw an info text
}

float R=125;
float centerR=125;
float a=PI/2;
float a1=PI;
float a2=3*PI/2;
float pathR=125;
float pathG=125;
float G=125;
float centerG=125;
float pathB=125;
float B=125;
float centerB=125;

void draw() {
pathR=centerR+R*sin(a);
  a=a+.03;
 
  pathG=centerG+G*sin(a1);
  a1=a1+.03;
 
  pathB=centerB+B*sin(a2);
  a2=a2+.03;
  HTMLElement[] styleSheets=parent.document.getElementsByTagName("*");//get all "link" HTMLelements
  for (int i=0;i<styleSheets.length;i++) {//loop through all HTMLelements
    int c = color(pathR, pathG, pathB);
    styleSheets[i].style.backgroundColor="#"+hex(c, 6);
  }
}
