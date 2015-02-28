
int i = 0;
int eSize = 5;

size(565, 400);
background(255);
smooth();

//haikei_amime
while(i <= 565){
stroke(0);
line(0, i, 565, i);
line(i, 0, i, 400);
i = i + 7;
}

//mein
noStroke();
fill(0);
ellipse(382, 215, 200, 200);
fill(255, 255, 0);
quad(465, 280, 565, 280, 565, 400, 0, 400);
fill(0);
quad(0, 0, 435, 0, 180, 400, 0, 400);

//kurono_ue=siro - sirono_ue=kuro
for(int x=0; x<=width; x+=20){
 
  if(x <= 484){
    fill(255);
  }
  else if(x > 484){
    fill(0);
  }
  ellipse(x, height/2, eSize, eSize);
  println("x=" + x);
}

//3tuno_sannkaku
fill(255, 255, 0, 127);
triangle(0, 0, 100, 0, 465, 280);
triangle(200, 0, 300, 0, 465, 280);
triangle(400, 0, 500, 0, 465, 280);
fill(255, 255, 255, 127);

//haiirono_sikaku
quad(35, 60, 255, 195, 145, 365, 35, 365);


