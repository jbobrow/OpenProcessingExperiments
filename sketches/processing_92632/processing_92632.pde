
PFont letras;
char[] minombre={'H','O','L','A'};
int x1,y1,x2,y2,x3,y3,x4,y4;

void setup(){
  size(500,500);
  letras=createFont("Verdana-48.vlw",1);
  textFont(letras,50);
  fill(0);
  background(255);

}

void draw(){
  background(255);
 if(x1 != 100 && y1 !=250){
  x1=int(random(499));
  y1=int(random(499));
  text(minombre[0],x1,y1);
  x2=int(random(499));
  y2=int(random(499));
  text(minombre[1],x2,y2);
  x3=int(random(499));
  y3=int(random(499));
  text(minombre[2],x3,y3);
  x4=int(random(499));
  y4=int(random(499));
  text(minombre[3],x4,y4);
 }
  else {
    text(minombre[0],100,250);
  }
  
 if(x2 != 150 && y2 !=250){
  x2=int(random(499));
  y2=int(random(499));
  text(minombre[1],x2,y2);
  x3=int(random(499));
  y3=int(random(499));
  text(minombre[2],x3,y3);
  x4=int(random(499));
  y4=int(random(499));
  text(minombre[3],x4,y4);
 }
  else {
    text(minombre[1],150,250);
  }
  
 if(x3 != 200 && y3 !=250){
  x3=int(random(499));
  y3=int(random(499));
  text(minombre[2],x3,y3);
  x4=int(random(499));
  y4=int(random(499));
  text(minombre[3],x4,y4);
 }
  else {
    text(minombre[2],200,250);
  }
 if(x4 != 250 && y4 !=250){
  x4=int(random(499));
  y4=int(random(499));
  text(minombre[3],x4,y4);
 }
  else {
    text(minombre[3],250,250);
  }
  
}
