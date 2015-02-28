
int x=0;
int y=0;
void setup(){
  strokeWeight(1);
  size(450,450);
  background(60,62,2);
  fill(88,64,4);
  rect(59,59,250,230);
  fill(214,176,78);
quad(70,70,100,200,120,123,89,79);
quad(89,79,120,123,225,245,300,100);
line(100,200,300,100);
line(100,200,225,245);
triangle(225,245,280,260,238,268);
fill(155,114,11);
triangle(238,268,280,290,316,220);
fill(206,157,33);
triangle(316,220,367,245,280,390);
fill(237,186,55);
triangle(280,390,400,340,500,500);
}
void draw(){
  strokeWeight(1);
    fill(88,64,4);
  rect(59,59,250,230);
  fill(214,176,78);
quad(70,70,100,200,120,123,89,79);
quad(89,79,120,123,225,245,300,100);
line(100,200,300,100);
line(100,200,225,245);
triangle(225,245,280,260,238,268);
fill(155,114,11);
triangle(238,268,280,290,316,220);
fill(206,157,33);
triangle(316,220,367,245,280,390);
fill(237,186,55);
triangle(280,390,400,340,500,500);
 if(mousePressed){
   noStroke();
  fill(random(100,255),random(50,255),random(0,15),22);
  ellipse(mouseX,mouseY,80,80);


  noStroke();
  fill(random(198,225),random(0,20),random(0,15),22);
  rect(x,y,80,80);
  if(x<400){
    x=x+10;
  }else{
    x=0;
    y=y+50;
  }
}}
  
  
  

