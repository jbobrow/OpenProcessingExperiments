
int r;
int a=50;
int g=50;
int p=0;

void setup()
{

size (1300,670);
}
void draw()
{

background (0);

 noStroke();
//start
if(a<10 && a>0 && g<670 && g>0){
 a=50;
 g=50;
}
//right wall boundries

if(a<1300 && a>0 && g<10 && g>0){
 a=50;
 g=50;
}
//top boundary
if(a<1300 && a>1290 && g<680 && g>0){
 a=50;
 g=50;
}
//right boundary
if(g<670 && g>660 && a<1300 && a>0){
 a=50;
 g=50;
}
//bottom boundary

 fill(random(0,255),random(0,255),random(0,255));
 rect(200,200,80,20);
 triangle(200,200,220,180,240,200);
 triangle(240,200,260,180,280,200);
 //first spike
 if(a<280 && a>200 && g<220 && g>180){
   a=50;
   g=50;
 }

 rect(500,100,20,120);
 triangle(500,100,480,120,500,140);
 triangle(500,140,480,160,500,180);
 triangle(500,180,480,200,500,220);
 rect(300,0,120,20);
 if(a<500 && a>460 && g<220 && g>100){
   a=50;
   g=50;
 }

 triangle(300,20,320,40,340,20);
 triangle(340,20,360,40,380,20);
 triangle(380,20,400,40,420,20);
 //spikes on top
 if(a<420 && a>300 && g<40 && g>0){
   a=50;
   g=50;
 }


 rect(0,100,20, 160);
 triangle(20,100,40,120,20,140);
 triangle(20,140,40,160,20,180);
 triangle(20,180,40,200,20,220); 
 triangle(20,220,40,240,20,260);
 //long row of spike by start
 if(a<40 && a>0 && g<260 && g>100){
   a=50;
   g=50;
 }

 rect(350,240,20,120); 
 triangle(370,240,390,260,370,280);
 triangle(370,280,390,300,370,320);
 triangle(370,320,390,340,370,360);
 //row facing right going down by start
 if(a<390 && a>350 && g<360 && g>240){
   a=50;
   g=50;
 }

 rect(400,500,20,160);
 triangle(400,500,380,520,400,540);
 triangle(400,540,380,560,400,580);
 triangle(400,580,380,600,400,620);
 triangle(400,620,380,640,400,660);
 //first side of double side
 triangle(420,500,440,520,420,540);
 triangle(420,540,440,560,420,580);
 triangle(420,580,440,600,420,620);
 triangle(420,620,440,640,420,660);
 //second side of double side
 if(a<440 && a>380 && g<660 && g>500){
   a=50;
   g=50;
 }

 noStroke();
 rect(800,400,10,80);
 rect(790,400,10,80);
 rect(800,320,10,80);
 rect(790,320,10,80);
 ellipse(800,400,40,40);
 //horizantal spinner
 if(a<810 && a>790 && g<480 && g>320){
   a=50;
   g=50;
 }

 rect(800,400,80,10);
 rect(800,390,80,10);
 rect(720,400,80,10);
 rect(720,390,80,10);
 //side ways spinny arms
 if(a<880 && a>720 && g<410 && g>390){
   a=50;
   g=50;
 }

 triangle(720,390,740,370,760,390);
 triangle(810,320,830,340,810,360);
 triangle(840,410,860,430,880,410);
 triangle(790,440,770,460,790,480);
 //spikes on spinny thing

 rect(1000,500,80,20);
 triangle(1000,500,1020,480,1040,500);
 triangle(1040,500,1060,480,1080,500);
 triangle(1000,520,1020,540,1040,520);
 triangle(1040,520,1060,540,1080,520);
 //small double spike thing
 if(a<1080 && a>1000 && g<540 && g>480){
   a=50;
   g=50;
 }

 rect(1100,200,20,120);
 triangle(1100,200,1080,220,1100,240);
 triangle(1100,240,1080,260,1100,280);
 triangle(1100,280,1080,300,1100,320);
 //notheast of spinny
 if(a<1120 && a>1080 && g<320 && g>200){
   a=50;
   g=50;
 }

 rect(600,650,160,20);
 triangle(600,650,620,630,640,650);
 triangle(640,650,660,630,680,650);
 triangle(680,650,700,630,720,650);
 triangle(720,650,740,630,760,650);
 //on bottom
 if(a<760 && a>600 && g<670 && g>630){
   a=50;
   g=50;
 }

fill(random(0,255),random(0,255),random(0,255));
if (mouseX <500 && mouseY<300 ) {r++;  rect(13,80,80,10);}
 else {r--;  rect(1100,600,80,20);  }
//start and finish pads
if(a<1180 && a>1100 && g<620 && g>600){
 textSize (90);
 text ("Winner!!",450,300);
 // fill (255,0,100);

  g=605;
  a=1140;
}

  stroke(random(0,255),random(0,255),(random(0,255)));
  ellipse (a,g,15,15);
  rect(a,g+8,1,15);
  rect (a+1,g+8,9,1);
  rect(a-10,g+8,9,1);
  strokeWeight(2);
  line(a,g+23,a-4,g+30);
  line(a,g+23,a+4,g+30);
  //person

  fill(random(0,255),random(0,255),random(0,255));
  noStroke();
  rect(800,100,20,120);
  triangle(820,100,840,120,820,140);
  triangle(820,140,840,160,820,180);
  triangle(820,180,840,200,820,220);
  //spike close to wall
  if(a<840 && a>800 && g<220 && g>100){
    a=50;
    g=50;
  }

  rect(1280,500,20,80);
  triangle(1280,500,1260,520,1280,540);
  triangle(1280,540,1260,560,1280,580);
  //close to finish
  if(a<1300 && a>1260 && g<580 && g>500){
    a=50;
    g=50;
  }

  rect(1280,0,20,120);
  triangle(1280,0,1260,20,1280,40);
  triangle(1280,40,1260,60,1280,80);
  triangle(1280,80,1260,100,1280,120);
  if(a<1300 && a>1260 && g<120 && g>0){
    a=50;
    g=50;
  }


  rect(50,500,200,20);
  triangle(50,500,70,480,90,500);
  triangle(90,500,110,480,130,500);
  triangle(130,500,150,480,170,500);
  triangle(170,500,190,480,210,500);
  triangle(210,500,230,480,250,500);
  //long one!
  if(a>50 && a<250 && g<520 && g>480){
    a=50;
    g=50;
  }

  if (key=='w')
 {
   g=g-11;
 }
 else if (key=='a')
 {
   a=a-11;
 }
 else if (key=='s')
 {
   g=g+11;
 }
 else if (key=='d')
 {
   a=a+11;
 }
//a,s,w,d comands
println("Use A,S,D,W Controls");
println("Also, don't go out of the screen your you will die.");
println("Move your mouse to try and locate the finsh block so it pops up");
println("Press R to restart");

if (key=='r')
{
 a=50;
 g=50;
}

}
