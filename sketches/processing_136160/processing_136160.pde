
//Jordana Bungard
//Feb 24,14
//Homework 5:Arrays and Text
void setup(){
size(500,500);
background(100,50,200);//purple
frameRate(5);}

int x=90;
int y=180;
float rot=50;
void draw(){
  fill(random(255));

  for (int a=100;a<350;a=a+50){
    for(int b=10;b<400;b=b+80);
    triangle(250,0,y,y,random(500),300);
}
  fill(100,40,0,7);

  for(int a=90;a<500;a=a+50){
    for (int b=50;b<500;b=b+70);
    ellipse(250,random(500),y,y);
    textSize(50);
    
text("hello world",a,a);
text("hello world",a,y);
text("hello world",y,x);
text("hello world",0,250);
text("hello world",random(200),random(500));
}}

