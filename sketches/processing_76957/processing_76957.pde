
//Devon Kelley midterm project
//used for reference-processing.org, orange book, and class notes.


float x,y,angle;

void setup(){
  size(800,800);
  x=0;
  y=0;
  angle=0;
}

void draw(){
  println(mouseX);
  println(mouseY);
 if(angle>0&&angle<200){
   background(55,255,150);
 }else if(angle>200&&angle<400){
   background(240,0,255);
 }else if(angle>400&&angle<600){
   background(65,0,255);
 }else if(angle>600&&angle<800){
   background(255,45,0);
 }else if(angle>800){
   angle=0;
 }
 
 //cloud
 for(int x=50;x<750;x+=20){
   for(int y=0;y<200;y+=20){
   fill(255);
   ellipse(x,y,30,30);
 }
 }

  //mother stegasaurus drawing
  fill(0,90,10);
  stroke(5,5,5);
  ellipse(400,600,400,200);
  line(150,560,205,580);
  line(285,680,285,750);
  line(350,695,350,750);
  line(415,700,415,750);
  line(500,685,500,750);
  ellipse(100,550,100,100);
  fill(255);
  ellipse(125,540,30,30);
  ellipse(70,550,30,30);
  fill(0);
  noFill();
  arc(100,550,70,70,radians(20),radians(140));
  //back spikes
  fill(0,130,15);
 triangle(150,560,170,545,180,570);
 triangle(180,570,200,560,205,580);
 triangle(210,570,210,520,240,540);
 triangle(240,540,250,495,280,520);
 triangle(280,520,285,485,320,510);
 triangle(320,510,330,480,360,500);
 triangle(360,500,380,475,400,500);
 triangle(400,500,420,475,440,502);
 triangle(440,502,465,480,480,508);
 triangle(480,508,505,485,520,520);
 triangle(520,520,550,500,560,540);
 triangle(560,540,590,530,585,560);
 //tail
 fill(0,90,10);
 triangle(585,560,780,600,595,625);
 fill(0,130,15);
 triangle(585,560,608,550,620,568);
 triangle(620,568,645,560,655,575);
 triangle(655,575,675,565,690,582);
 triangle(690,582,710,570,740,592);
 triangle(740,592,755,575,780,600);
 
//baby stegasaurus drawing
  fill(0,130,15);
 ellipse(400,400,200,100);
 line(340,440,340,485);
 line(360,447,360,495);
 line(400,450,400,490);
 line(440,445,440,490);
 line(300,395,265,375);
 ellipse(238,360,60,60);
 fill(255);
 ellipse(250,350,20,20);
 ellipse(220,355,20,20);
 noFill();
 arc(238,355,40,50,radians(20),radians(140));
 //back spikes
 fill(0,165,10);
 triangle(265,375,280,375,285,387);
 triangle(285,387,295,382,300,394);
 triangle(305,385,305,365,315,375);
 triangle(315,375,320,355,330,364);
 triangle(330,364,335,350,345,360);
 triangle(345,360,350,346,360,355);
 triangle(360,355,367,340,380,352);
 triangle(380,352,388,335,395,350);
 triangle(395,350,405,335,415,350);
 triangle(415,350,425,335,440,355);
 triangle(440,355,450,340,455,358);
 triangle(455,358,470,350,475,366);
 triangle(475,366,490,360,490,378);
 //tail
 fill(0,130,15);
 triangle(490,378,575,395,495,415);
 fill(0,165,10);
 triangle(490,378,500,370,510,382);
 triangle(510,382,518,373,525,385);
 triangle(525,385,530,375,540,388);
 triangle(540,388,550,380,555,390);
 triangle(555,390,565,380,575,395);
 
 //eye movement
 if(angle>0&&angle<200){
    fill(5,5,5);
    ellipse(70,540,5,5);
    ellipse(133,550,5,5);
    ellipse(217,350,5,5);
    ellipse(256,350,5,5);
  }else if(angle>200&&angle<400){
    fill(5,5,5);
    ellipse(80,540,5,5);
    ellipse(130,545,5,5);
    ellipse(228,356,5,5);
    ellipse(252,355,5,5);
  }else if(angle>400&&angle<600){
    fill(5,5,5);
    ellipse(115,545,5,5);
    ellipse(83,553,5,5);
    ellipse(243,348,5,5);
    ellipse(219,361,5,5);
  }else if(angle>600&&angle<800){
    fill(5,5,5);
    ellipse(60,550,5,5);
    ellipse(132,540,5,5);
    ellipse(222,350,5,5);
    ellipse(250,347,5,5);
  }else if(angle>800){
    angle=0;
  }
 
 //sun movement
 x=300*cos(radians(angle));
 fill(255,225,0);
 noStroke();
 ellipse(x+width/2,200,100,100);
 angle++;
 
 //poop
 fill(50,25,25);
 ellipse(500,422,20,20);
 translate(30,30);
 ellipse(500,422,20,20);
 translate(50,50);
 ellipse(500,422,20,20);
}


