
int a=5;//haba

size(400, 565);//window
background(245, 245, 220);//beige

noFill();//nuritubusanai

for (int x=0; x<=width; x+=20) {//maru
  if(x>80 && x<=120){
    strokeWeight(1);
    stroke(200,200);
    ellipse(x+5, x*565/400+5, a, a);
  }
    strokeWeight(5);
    stroke(0);
  ellipse(x, x*565/400, a, a);
  a = a*2;
}

stroke(0);
strokeWeight(200);//hutoisenn
line(0, 600, 600, 400);

stroke(100,155);//haiironosikaku
rect(0,400,10,100);



stroke(0);//kuro
strokeWeight(10);//wakusenn
rect(0, 0, width, height);

fill(255,0,0);//akanuritubusi
rotate(PI/6);//kaitenn
stroke(255, 0, 0);//akasenn
rect(400, 100, 100, 100);//seihoukei








