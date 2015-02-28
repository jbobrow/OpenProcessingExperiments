
void setup(){
  size(500,500);
  background(255,255,255);
  smooth();
}
int x=0;
int y1;
int i=0;
void draw(){
  
 for(int y=-30;y<=500;y=y+10){
  noFill();
 colorStrokes();
   strokeWeight(4);
bezier(x+0,y+30,x+115,y+0,x+110,y+60,x+225,y+30);
bezier(x+225,y+30,x+340,y+0,x+335,y+60,x+450,y+30);
bezier(x+450,y+30,x+545,y+0,x+560,y+60,x+675,y+30);
bezier(x+675,y+30,x+770,y+0,x+785,y+60,x+900,y+30);
bezier(x+900,y+30,x+995,y+0,x+1010,y+60,x+1125,y+30);
bezier(x+1125,y+30,x+1220,y+0,x+1235,y+60,x+1350,y+30);
   x=x-15;
 }
 

noLoop();

}

void colorStrokes(){

i=i+1;
if(i==1||i==4){
  stroke(0,0,255);
}
else if(i==2 || i==3 ||i==6 ||i==7){
  stroke(255,0,0);
}
else if(i==5){
  stroke(50,255,100);
}

else if(i==8){
  stroke(50,200,100);
  i=0;
}
}
  


