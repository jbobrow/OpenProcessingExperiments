
size(600,300);

//左

noStroke();
fill(0,102,165);
rect(0,0,300,300);

noFill();

stroke(0);

ellipse(150,150,250,250);//丸５

ellipse(150,150,300,300);//丸６

ellipse(150,150,350,350);//丸７



stroke(0);
strokeWeight(3);

line(150,0,150,300);//縦線
line(0,150,300,150);//横線


strokeWeight(1);

fill(0,102,165);


ellipse(150,150,200,200);//丸４


ellipse(150,150,150,150);//丸３

line(0,0,300,300);//斜め線左上
line(300,0,0,300);//斜め線右上

ellipse(150,150,100,100);//丸２

stroke(199,29,30);
ellipse(150,150,50,50);//丸１

stroke(0);
noFill();
rectMode(CENTER);
rect(150,150,150,150);

//右


noStroke();
fill(255,229,24);
rectMode(CORNER);
rect(300,0,300,600);

colorMode(RGB,600);
int CC=600/255;
for(int y=0; y<=height; y++){
  for (int x=0; x<=width; x++){
    fill(255*CC,178-y*0.5*CC,10*CC,x*0.8*CC);
    ellipse(300+x,y,1,1);
  }
}

colorMode(RGB,255);
fill(255,170);
ellipse(600,310,280,250);//下の楕円
fill(255,120);
ellipse(400,100,90,70);//上の楕円

stroke(0);
noFill();

triangle(550,-10,630,40,460,80);//右の三角
triangle(320,150,400,60,500,230);//左の三角

stroke(39,133,214);
line(300,130,360,-10);//青線

strokeWeight(2);
stroke(214,56,39);
line(310,-20,420,320);//赤線

strokeWeight(1);
stroke(12,229,35);
line(340,300,580,0);//緑線


