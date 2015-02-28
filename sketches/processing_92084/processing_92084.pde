
PFont display;
int running;
int stored =0;
float rectMap;
int a =0;
int aa =0;
int b = 16;
int size = 8;
int spc = 2;
int margX = 100;
int margY = 30;
PImage wfall;



void setup() {
  display = createFont("Arial", 32);
  textFont(display, 28);
  size(720, 650);
    wfall = loadImage("waterfall.jpg");
    stroke(200,0,0);

}
void draw() {
  
  int tDiff = millis()-stored;
  image(wfall,0,0,width,height);
  a=(tDiff/1000)+aa;
  int secs =a%60;
  int mins =(a/60)%60;
  int hrs =(a/3600)%24;
  text(secs+1,6,30);
  text(mins+1,6,60);
  text(hrs+1,6,90);
  noFill();
  for (int m=30;m<528+30;m+=22){
    rect(50,m,38,22);}
  
  fill(300,0,0);
    rect(50,(hrs*22)+30,38,24);
    
   
for (int i=margX;i<(secs+1)*(size+spc)+margX;i+=size+spc) {  
  for (int j=margY;j<(mins+1)*(size+spc)+margY;j+=size+spc)
      rect(i,j,size,size);}
      println(hrs*10+30);


}

void keyPressed(){
  if (keyCode==38){aa+=1;}
  else if (keyCode==40){aa-=1;}
    else if (keyCode==39){aa+=100;}
      else if (keyCode==37){aa-=100;}
      else if (keyCode==32){aa=0;  stored=millis();
}
       
}


