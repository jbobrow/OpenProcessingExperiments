
float note=random(24);
int y=1;

void setup(){
  size(800,400);
}

void staff(){
  fill(0);
  rect(0,0,800,280);
  fill(255);
  rect(100,0,600,280);
  stroke(0);
  strokeWeight(2);
  line(150,40,650,40);
  line(150,60,650,60);
  line(150,80,650,80);
  line(150,100,650,100);
  line(150,120,650,120);
  line(150,160,650,160);
  line(150,180,650,180);
  line(150,200,650,200);
  line(150,220,650,220);
  line(150,240,650,240);
}
void piano(){
  int x=0;
  for(int n=25;n<width-25;n=n+30){
    stroke(100);
    fill(255);
    rect(n,280,30,120);
  }
  for(int n=45;n<width-45;n=n+30){
    if(x!=3&&x!=6&&x!=10&&x!=13&&x!=17&&x!=20&&x!=24){
      stroke(100);
      fill(0);
      rect(n,280,20,70);
    }
    x=x+1;
  }
  stroke(200);
  fill(200);
  ellipse(370,390,10,10);
}
void notes(){
  note=int(note);
  stroke(0);
  fill(255);
  ellipse(y*100+120,(note+1)*10,20,20);
  if(note==13){
    line(y*100+100,(note+1)*10,y*100+140,(note+1)*10);
  }
  if(note==0){
    line(y*100+100,(note+2)*10,y*100+140,(note+2)*10);
  }
  if(note==1){
    line(y*100+100,(note+1)*10,y*100+140,(note+1)*10);
  }


}
  
  
void draw(){
  background(0);
  staff();
  piano();
  notes();
}
void newnote(){
  note=random(24);
  note=note;
  notes();
  y=y+1;
  if(y==6){y=1;}
}
void mouseClicked(){
  float notval=25-note;
  notval=40+(30*(notval-1));
  if((mouseY<400)&&(mouseY>340)&&(mouseX<notval+15)&&(mouseX>notval-15)){
    newnote();
  }
}
