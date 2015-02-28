
void setup(){
  size(400,400);
  //noStroke();
  rect(0,0,400,150);
  rect(0,150,250,250);
  rect(250,150,150,170);
  rect(250,320,150,80);
}

void draw(){
  //noStroke();
  float q = random(20);
  float qq= random (80);
  float qqq = random(140);
  float i = random(130);
  float u = random(255);
  float uu = random(255);
  float uuu = random (255);
  String s = "THIS SQUARE";
  String jj = "IS CALM";
  if ((mouseX<=400) && (mouseY<150)){
    frameRate(20);
    stroke(0,0);
    fill(255);
      rect(0,0,400,150);
    for (int y=390; y>0; y=y-15){ for (int x=140;x>0;x=x-15){
    fill(q,i,50,130);
    ellipse(y,x,10,q);
    fill(i,q,50,130);
    ellipse(y-5,x-5,10,q);
  }
}}
else if ((mouseX<=250) && (mouseY>150)){
  if (mousePressed==true){
    stroke(0);
    fill(140,130,mouseY);
    rect(0,150,250,250);
    fill(mouseX,20,130);
    text(jj,140,270);
  }
  else
  {
stroke(0);
    fill(255);
    rect(0,150,250,250);
    fill(mouseY,130,130);
    text(s,80,270);
  }}
  else if ((mouseX>250) && (mouseY>150) && (mouseY<320)){
    stroke(0);
    fill(u,u,uuu,u);
    rect(250,150,150,170);
    //rectMode(CENTER);
    fill(u,uu,uuu,u);
    stroke(0,0);
    rect(325,235,qq,qq);
    stroke(0,0);
    fill(uu,uuu,u,uu);
    ellipse(325,235,qqq,qqq);
    
  }
else if ((mouseX>250) && (mouseY>340)){
  /*frameRate(4);
  stroke(0);
    fill(255,100);
    rect(250,320,150,80);
  for (int t=250; t<400; t=t+30){
    for(int tt=357; tt<380; tt=tt+20){*/
    if (mousePressed ==true){
      stroke(0);
    fill(255,100);
    rect(250,320,150,80);
    }
    else{
    fill(40);
    text("LA", mouseX, mouseY);
    }
  //}
//}
}}
