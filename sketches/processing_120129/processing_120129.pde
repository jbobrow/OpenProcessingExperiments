
String [] answers = {"yes", "no", "maybe", "it is certain", "cannot predict now", "concentrate and ask again", "my sources say no", "better not tell you now"};
boolean flag = false;   

void setup(){      
size(400, 400);    
noLoop();} 

void draw(){
fill(255,255,255);    
rect(0,350,400,50);    
int x = int(random(0,8));   
if (flag == true){    
  fill(0);
  ellipse(200,200,300,300);
  fill(255);
  ellipse(200,200,120,120);     
  fill(0);    
  textSize(25);    
  text(answers[x], 200, 390);}

else{
  fill(0,0,0);
  ellipse(200,200,300,300);
  fill(255,255,255);
  ellipse(200,200,120,120);
  noFill();
  ellipse(200,175,50,50);
  ellipse(200,225,50,50);
  textSize(100);    
  textAlign(CENTER);    
  fill(0,0,0);}}

void mousePressed()
{
  if (mouseX > 0 && mouseY > 0){
    flag = !flag;    
    redraw();}
}
  







