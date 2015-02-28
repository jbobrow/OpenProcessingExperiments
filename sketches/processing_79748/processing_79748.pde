
//Victoria H, MagicBall, CP1 mods 16/17

void setup(){
  size(300,300);
  smooth();
  frameRate(1);
}
boolean question=true;
String answers[]={"outlook not\nso good","don't count\non it","my sources\nsay no","without a\ndoubt","reply hazy,\ntry again","it is\ncertain","my reply\nis no","as I see\nit, yes","most\nlikely","you may rely\non it","cannot predict now","better not tell\nyou now","very\ndoubtful","outlook\ngood","yes\ndefinitely","concentrate and\nask again"};
void draw(){
  if(question==true){
    background(88,130,242);
    eight();
  } else if(question==false){
    int x=int(random(17));
    background(88,130,242);
    answer();
    textAlign(CENTER);
    fill(255);
    textSize(10);
    text(answers[x],150,150);
  }
}
void mouseClicked(){
  if(mouseX>50 && mouseX<250 && mouseY>50 && mouseY<250){
    question=!question;
    redraw();
  }
}
void eight(){
  fill(0);
  ellipse(150,150,200,200);
  fill(255);
  ellipse(150,75,80,42);
  noFill();
  strokeWeight(2);
  stroke(0);
  ellipse(150,65,20,12);
  ellipse(150,82,30,20);
}
void answer(){
  fill(0);
  ellipse(150,150,200,200);
  noFill();
  stroke(157);
  ellipse(150,150,80,80);
  stroke(230);
  ellipse(150,150,85,85);
  noStroke();
  fill(0,0,255);
  triangle(125,135,175,135,150,175);
  }
