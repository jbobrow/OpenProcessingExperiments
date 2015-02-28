
import peasy.*;
PeasyCam cam;


 String tests;
 String tester;
PFont fontA;

int a=0;
int load=0;
String allText;
  String[] tokens; 
int mat=0;
int [] t=new int [1000000];
int test;
float v;
void setup()
{
  size(800,600,P3D);
cam = new PeasyCam(this, 100);
  
  fontA = loadFont("LucidaBright-Demi-100.vlw");


  textFont(fontA, 32);

fill(0);
}
 
 
void mousePressed(){
  if((mouseX<50)&&(mouseY<50)){
String loadPath = selectInput();  
if (loadPath == null) {
 
  println("No file was selected...");
}
else {

 String[] lines = loadStrings(loadPath);
 allText = join(lines, " ");
 tokens = splitTokens(allText, " ;.':,?!");
  
  println(loadPath);

tokens=sort(tokens);
load=1;

for(int i=0;i<tokens.length-1;i++){
tests=tokens[i];
for(int j=0;j<tokens.length-1;j++){
  
tester=tokens[j];

if((tests.equals(tester))){

t[i]+=10;
 
}


}
} 

}}}

void draw(){
background(230);


 if (load != 0) {
   for(int i=0;i<tokens.length-1;i++){

textFont(fontA, t[i]);

fill(i,t[i],0,100);
text(tokens[i], 0, t[i]);
rotateX(0);
}

 }
v+=0.001;
}




