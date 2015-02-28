
int x=0;
int y=0;
int z=50;
int a=0;
int b=0;

void setup(){
  size (600,600);
  background (255);
  
  }
  void draw(){
  for (int i=0; i<10; i++){
    fill(255,237,36);
    stroke(66,116,13);
    strokeWeight (4);
    ellipse(x,y,100,100);
    fill(245,178,7);
    ellipse(x,y,80,80);
    fill(255,237,36);
    ellipse(x,y,60,60);
    fill(245,178,7);
    ellipse(x,y,40,40);
     fill(255,237,36);
    ellipse(x,y,20,20);
    x=x+50;
    y=y;}
   
   if (x>1280){
   
   y=y+50;
   x=0;}
       


 }

  
void mousePressed(){
for (int i=0; i<10; i++){
  fill(255,237,36);
  ellipse(a,b,50,50);
  fill(245,178,7);
  ellipse(a,b,30,30);
  fill(255,237,36);
  ellipse(a,b,10,10);
  ellipse(a+25,b+25,50,50);
a=a+50;
b=b;}

if (a>1280){
a=0;
b=b+100;}
}

void keyPressed(){ save("sketch1.jpg");}                
