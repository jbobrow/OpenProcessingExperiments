
int move=0;
int oppo=0;
int bounce=10;
int obounce=10;
int stack=0;

void setup(){
size(800,600);

}

void draw(){
background (255);
move=move+bounce;
oppo=oppo-obounce;

if(move>=1100){
  bounce=bounce*-1;
}
if(move<=-100){
  bounce=bounce*-1;
}
if(oppo<=-1100){
  obounce=obounce*-1;
}
if(oppo>=100){
  obounce=obounce*-1;
}


while(stack<height){
  if(move>=400 ){
    fill(#0713DE,150);
   stroke(#0713DE);
  
  }
  else {fill(#FF8E03,200);
  }
  
  noStroke();
  rect(move-200,0+stack,200,55);
   triangle(-300,27+stack,move-200,0+stack,move-200,55+stack);
   stroke(255);
   line(-400,27+stack,move-0,27+stack);
   line(-400,30+stack,move-0,30+stack);
   line(-400,24+stack,move-0,24+stack);
   stroke(#030B95);
   line(400,300,move-0,0+stack);
   line(400,300,move-0,55+stack);
  stack=stack+60;

}
stack=0;

while(stack<height){
  noStroke();
  rect(800+oppo,0+stack,200,55);
  triangle(1100,27+stack,1000+oppo,0+stack,1000+oppo,55+stack);
  stroke(255);
   line(1200,27+stack,800+oppo,27+stack);
   line(1200,30+stack,800+oppo,30+stack);
   line(1200,24+stack,800+oppo,24+stack);
   stroke(#030B95);
   line(400,300,800+oppo,0+stack);
   line(400,300,800+oppo,55+stack);
  
  stack=stack+60;
}
stack=0;
}


