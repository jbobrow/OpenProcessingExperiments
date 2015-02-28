
int rule=90;
String mode;
 
void setup(){
background(255);
size(800,600);
colorMode(HSB,width);
PFont myFont; myFont = createFont("arial", 30); textFont (myFont); textAlign(CENTER);
mode = "javascript";
}
 
void draw(){
background(0);

boolean[][] a = new boolean[width][height];
boolean[] d = {false, false, false, false, false, false, false, false};

if (mode == "javascript"){
  //comment this out for java/*
  String b = rule.toString(2);
  for (int i=0; i<b.length(); i++)
  if (b.charAt(b.length()-1-i) == "1")
      d[i] = true;
   //*/
}
else if (mode == "java"){
  String b = Integer.toBinaryString(rule);
  for (int i=0; i<b.length(); i++)
  if (b.charAt(b.length()-1-i) == '1')
    d[i] = true;  
}


for(int i=7; i>-1; i--)
a[width/2+1][0] = true;
 
for(int y=1; y<height; y++)
for(int x=1; x<width-1; x++){
 
  a[x][y] = false;
 
 if( !a[x-1][y-1] && !a[x][y-1] && !a[x+1][y-1])
   a[x][y] = d[0];
 if( !a[x-1][y-1] && !a[x][y-1] && a[x+1][y-1])
   a[x][y] = d[1];
 if( !a[x-1][y-1] && a[x][y-1] && !a[x+1][y-1])
   a[x][y] = d[2];
 if( !a[x-1][y-1] && a[x][y-1] && a[x+1][y-1])
   a[x][y] = d[3];
 if( a[x-1][y-1] && !a[x][y-1] && !a[x+1][y-1])
   a[x][y] = d[4];
 if( a[x-1][y-1] && !a[x][y-1] && a[x+1][y-1])
   a[x][y] = d[5];
 if( a[x-1][y-1] && a[x][y-1] && !a[x+1][y-1])
   a[x][y] = d[6];
 if( a[x-1][y-1] && a[x][y-1] && a[x+1][y-1])
   a[x][y] = d[7];
  }
 
  for(int y=1; y<height; y++)
  {
    for(int x=1; x<width-1; x++)
    if (a[x][y] == true){
      stroke(x,y,width);
      point(x,y);
    }
  }
  text(rule + " of 255", width/2, height*.95);
  if (millis()/1000 < 5){
  text("Use mouse or arrow keys.", width/2, height*.85);
 
}

//saveFrame("/frames/frame-####.bmp");

//if (rule > 255)
  //exit();

}
 
void keyPressed(){
  if (key == 's' || key == 'S')
    saveFrame("frame-####.bmp");
  if (key == CODED){
    if(keyCode == RIGHT)
       rule+=1;
     if (keyCode == LEFT){
       if (rule == 0)
         rule = 256;
       rule-=1;}
     rule%=256;
   }
}
void mousePressed(){
  if (mouseButton == LEFT)
        rule+=1;
  if (mouseButton == RIGHT){
       if (rule == 0)
         rule = 256;
       rule-=1;}
     rule%=256;
   } 



