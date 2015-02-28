
int rd=-290;
int ls=-330;
int ld=-330;
int lr=420;
int md=300;
int tp=-200;
void setup(){
  background(0);
  size(900,800);
  noStroke();
}
void draw(){

  background(0);
 
  lr=lr-1;
  lr=max(0,lr);
  rect(100+lr,220,300,20);//Long horizontal line 
  
  ld=ld+1;//ld is long down
  ld=min(0,ld);// long down
  rect(240+ld,210,20,250);//Long going down
  
  ls=ls+1;//left small
  ls=min(0,ls);//left small
  rect(180+ls,110,20,40);//left small
  
  rd=rd+1;
  rd=min(0,rd);
  rect(300+rd,110,20,40);//right small
  
  md=md-1;
  md=max(0,md);
  rect(240+md,70,20,80);//middle block 
  
  tp=tp+1;
  tp=min(0,tp);
  rect(200+tp,70,120,20);//Top horizontal line
  
  
  
  
  
  
  
  
  
  
}

