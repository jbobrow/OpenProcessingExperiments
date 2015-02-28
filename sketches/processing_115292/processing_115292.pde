
String[] numbers = {"1","2","3","4","5","6","7","8","9"
};
int[] paletagris=new int[9];

PFont font;

void setup (){
  size(900, 900);
  smooth();
  font = loadFont("fuenterl.vlw");
  }
  
    void draw(){
     background(100);
    
paletagris[0]=0;
paletagris[1]=43;
paletagris[2]=64;
paletagris[3]=94;
paletagris[4]=126;
paletagris[5]=158;
paletagris[6]=175;
paletagris[7]=200;
paletagris[8]=255;

     fill(255,0,0);

  for(int i=0; i<=8; i++){println( paletagris[i]);}

if (mouseX>5 & mouseX<300 & mouseY>5 & mouseY<300){
  fill(paletagris[0]);rect(5,5,295,295);fill(paletagris[8]);
textFont(font,400);
textMode(CENTER);
text(numbers[0],45,290);}

if (mouseX>305 & mouseX<600 & mouseY>5 & mouseY<300){
  fill(paletagris[1]); rect(305,5,295,295); fill(paletagris[7]);
textFont(font,400);
textMode(CENTER);
text(numbers[1],345,290);}

if (mouseX>605 & mouseX<900 & mouseY>5 & mouseY<300){
  fill(paletagris[2]);rect(605,5,295,295);
textFont(font,400);fill(paletagris[6]);
textMode(CENTER);
text(numbers[2],645,290);}



if (mouseX>5 & mouseX<300 & mouseY>300 & mouseY<600){
 fill(paletagris[3]); rect(5,305,295,295);
textFont(font,400); fill(paletagris[5]);
textMode(CENTER);
text(numbers[3],45,590);}

if (mouseX>305 & mouseX<600 & mouseY>300 & mouseY<600){
  fill(paletagris[4]);  rect(305,305,295,295);
textFont(font,400); fill(paletagris[4]+10);
textMode(CENTER);
text(numbers[4],345,590);}

if (mouseX>605 & mouseX<900 & mouseY>300 & mouseY<600){
  fill(paletagris[5]); rect(605,305,295,295);
textFont(font,400); fill(paletagris[3]);
textMode(CENTER);
text(numbers[5],645,590);}



if (mouseX>5 & mouseX<300 & mouseY>600 & mouseY<900){
  fill(paletagris[6]); rect(5,605,295,295);
textFont(font,400);  fill(paletagris[2]);
textMode(CENTER);
text(numbers[6],45,890);}

if (mouseX>305 & mouseX<600 & mouseY>600 & mouseY<900){
 fill(paletagris[7]);rect(305,605,295,295);
textFont(font,400); fill(paletagris[1]);
textMode(CENTER);
text(numbers[7],345,890);}

if (mouseX>600 & mouseX<900 & mouseY>600 & mouseY<900){
  fill(paletagris[8]);rect(605,605,295,295);
textFont(font,400);fill(paletagris[0]);
textMode(CENTER);
text(numbers[8],645,890);}

}

    

