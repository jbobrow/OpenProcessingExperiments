
int x=200;
int y=200;
void setup(){
  size(400,400);}
void keyPressed(){
  if (key == CODED){
    if (keyCode == UP){
      int d= int(random(400));
      int f= int(random(400));
      line(200,60,d+10,f+20);
      line(200,60,d+20,f+40);
      line(200,60,d+30,f+60);
      line(200,60,d+40,f+80);
      line(200,60,d,f);}
     if (keyCode == LEFT){
             int d= int(random(400));
      int f= int(random(400));
      line(200,60,d+10,f+20);
      line(200,60,d+20,f+40);
      line(200,60,d+30,f+60);
      line(200,60,d+40,f+80);
      line(200,60,d,f);}
     if (keyCode == RIGHT){
             int d= int(random(400));
      int f= int(random(400));
      line(200,60,d+10,f+20);
      line(200,60,d+20,f+40);
      line(200,60,d+30,f+60);
      line(200,60,d+40,f+80);
      line(200,60,d,f);}}}
       
void draw(){
  keyPressed();
  noFill();
  strokeWeight(2);
  smooth();
  if (mousePressed == true){
    int r = int(random(255));
    int g = int(random(255));
    int b = int(random(255));
    background(r,g,b);
    line(200,0,200,20);
    fill(106,106,105);
    ellipse(200,60,80,80);
    noFill();
    ellipse(x,y,50,50);
    line(x,25+y,x,y+100);
    line(x,y+100,50+x,170+y);
    line(x,y+100,x-50,170+y);
    line(x,45+y,40+x,20+y);
    line(x,45+y,x-40,y+20);
    x= x+int(random(5));
    y= y+int(random(5));
    if (y >=3 || x>=3){
      x=x-int(random(5));
      y=y-int(random(5));}
      fill(236,245,0);
    ellipse(pmouseX,pmouseY,40,40);
    fill(0);
    ellipse(mouseX,mouseY,60,60);
  }
}


