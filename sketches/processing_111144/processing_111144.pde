

void setup(){
  size(900,350);
  
}
void draw(){
  
  background(30,82,183);
  noStroke();
  
  //frome left to right
  //cloud
  smooth();
  cloud(200,100,50,20,158,163,193,255);
   cloud(220,90,50,20,158,163,193,255);
    cloud(235,102,55,23,158,163,193,255);
    
    cloud(200+500,100+30,50,20,158,163,193,255);
   cloud(220+500,90+30,50,20,158,163,193,255);
    cloud(235+500,102+30,55,23,158,163,193,255);
    
    cloud(360,150,300,7,177,182,211,180);
    cloud(100,60,200,7,177,182,211,180);
    
   //layer 1
  //building 2
  fill(19,24,54);
  rect(93,265,40,60);
  for (int y=270; y<300;y+=10){
    for(int x=96; x<130; x+=10){
    fill(165,160,102);
    rect(x,y,5,3);
    }
  }
  
  //building 1
  fill(9,13,39);
  rect(59,204,4,8);
  rect(57,210,8,10);
  quad(75,221,75,255,85,255,85,230);
  fill(18,25,70);
  rect(42,220,35,40,7);
  fill(17,23,59);
  rect(35,255,5,55);
  fill(31,38,77);
  rect(40,250,40,60);
  fill(14,19,52);
  quad(80,250,80,310,95,310,95,260);
  for (int y=258; y<310; y+=8){
    fill(255,246,142);
    rect(36,y,2,2);
  }
  for (int y=258; y<300;y+=10){
    for(int x=44; x<78; x+=10){
    fill(255,246,142);
    rect(x,y,3,3);
    }
  }
    
  //building 3
  fill(16,20,46);
  rect(164,215,10,140,6);
  fill(72,69,38);
  rect(166,218,2,140,7);
  fill(19,24,54);
  arc(170,250,70,70,-PI/2,0);
  rect(170,250,35,140);
  fill(13,18,46);
  arc(170,250,60,60,-PI/2,0);
  rect(170,250,30,140);
  fill(8,12,33);
  arc(170,250,40,40,-PI/2,0);
  rect(170,250,20,140);
  
  //building 4
  fill(20,25,57);
  rect(230,225,40,100);
  
  //building 5
  fill(14,18,44);
  triangle(300,225,330,225,315,206);
  rect(300,225,30,100);
  
  //building 6
  fill(21,27,62);
  rect(376,172,2,10);
  rect(375,180,3,15);
  quad(350,206,350,316,380,316,380,190);
  
  //building 7
  fill(27,35,85);
  quad(375,198,375,316,405,316,405,215);
  fill(19,20,44);
  rect(387,215,7,110);
  rect(396,215,7,110);
  
  //building 8
  fill(26,28,75);
  rect(435,190,30,170,7);
  quad(410,260,410,350,485,350,485,240);
  fill(23,22,62);
  quad(410,260,410,350,447,350,447,250);
  
  //building 9
  arc(540,190,70,70,-PI*4/6,-PI*1/6,CHORD);
  quad(523,159,523,325,570,325,570,172);
  for(int y=170;y<325 ;y+=5){
   fill(106,106,71);
  quad(523,y,570,y+2,570,y+4,523,y+2);
  }
  
  //building 10
   fill(23,22,62);
  quad(585,165,615,155,620,325,585,325);
  fill(31,30,72);
  triangle(614,155,622,158,619,325);
  for(int y=210;y<325 ;y+=5){
   fill(106,106,71);
  quad(585,y,615,y-1,615,y+1,585,y+2);
  }
  for(int y=210;y<325 ;y+=5){
   fill(64,64,34);
  quad(615,y-1,621,y,621,y+2,615,y+1);
  }
  
  //building 11
  fill(31,30,72);
  quad(635,130,670,120,675,325,632,325);
  fill(30,82,183);
  quad(638,140,667,130,665,145,640,153);
  fill(38,43,88);
  triangle(640,153,665,145,653,310);
  
  //building 12
  fill(22,21,57);
  quad(700,200,715,195,715,325,700,325);
  fill(75,88,20);
  
  fill(26,25,64);
  rect(715,195,30,120);
  
  fill(29,28,72);
  quad(695,240,725,235,725,325,695,725);
  fill(33,31,80);
  rect(725,235,25,120);
  for(int y=242;y<320;y+=10){
    fill(75,88,2);
  rect(698,y,5,5);
      }
       for(int y=240;y<320;y+=10){
    fill(75,88,2);
  rect(708,y,5,5);
      }
        for(int y=238;y<320;y+=10){
    fill(75,88,2);
  rect(718,y,5,5);
      }
        for(int y=236;y<320;y+=10){
    fill(75,88,30);
  rect(728,y,5,5);
      }
        for(int y=235;y<320;y+=10){
    fill(75,88,30);
  rect(738,y,5,5);
      }
    
  //building 14
 fill(22,21,64);
 quad(820,195,850,192,850,325,820,325);
 fill(24,23,70);
 quad(850,192,865,194,860,325,850,325);
  
 
 //building 13
 fill(30,29,77);
 rect(794,185,36,40);
 fill(24,23,67);
 rect(780,200,10,120);
 fill(27,25,72);
 quad(790,200,820,195,820,325,790,325);
 fill(34,33,85);
 quad(820,195,835,198,835,325,820,325);
 for(int y=202;y<320;y+=5){
   fill(85,89,98);
   quad(790,y,820,y-5,820,y-3,790,y+2);
   fill(93,95,103);
   quad(820,y-5,835,y-3,835,y-1,820,y-3);
 }
 
 //layer 2
 //building 1
 strokeWeight(10);
 stroke(40,44,54);
 line(270,240,250,310);
 line(290,240,310,310);
 noStroke();
 fill(59,63,75);
 rect(270,130,20,110);
 rect(275,70,10,60);
 rect(277,40,5,40);
 rect(279,5,2,40);
 fill(30,82,183);
 rect(275,157,10,13);
 rect(275,177,10,13);
 rect(275,197,10,13);
 fill(93,95,103);
 ellipse(280,240,47,47);
 ellipse(280,130,35,35);
 ellipse(280,70,20,20);
 fill(190,234,80);//yellow light
 for(int x=260;x<305;x+=5){
  ellipse(x,233,4,4); 
 }
 fill(80,234,220);//blue light
 for(int x=258;x<307;x+=5){
  ellipse(x,239,4,4); 
 }
 fill(234,80,99);//red light
 for(int x=260;x<305;x+=5){
  ellipse(x,245,4,4); 
 }
 
 fill(190,234,80);
 for(int x=267;x<296;x+=5){
  ellipse(x,123,1,1); 
 }
 for(int x=265;x<299;x+=5){
  ellipse(x,127,1,1); 
 }
 for(int x=264;x<300;x+=4){
  ellipse(x,130,1,1); 
 }
  for(int x=264;x<300;x+=4){
  ellipse(x,134,1,1); 
 }
  for(int x=267;x<296;x+=5){
  ellipse(x,137,1,1); 
 }
 
  strokeWeight(10);
 stroke(40,44,54);
 strokeCap(SQUARE);
 line(280,255,270,310);
 noStroke();
 
 //building 2
 fill(103,108,142);
 quad(470,235,500,230,500,310,470,310);
fill(123,128,160);
 quad(500,230,535,235,535,310,500,310);  
 for(int y=245;y<360;y+=10){
   fill(7,11,39);
   rect(471,y,3,6);
 }
 for(int y=244;y<360;y+=10){
   fill(7,11,39);
   rect(477,y,3,6);
 }
 for(int y=243;y<360;y+=10){
   fill(7,11,39);
   rect(483,y,3,6);
 }
 for(int y=242;y<310;y+=10){
   fill(7,11,39);
   rect(489,y,3,6);
 }
 for(int y=241;y<310;y+=10){
   fill(7,11,39);
   rect(495,y,3,6);
 }
 
 for(int y=242;y<310;y+=10){
   fill(7,11,39);
   rect(505,y,3,6);
 }
 for(int y=243;y<310;y+=10){
   fill(7,11,39);
   rect(511,y,3,6);
 }
 for(int y=244;y<310;y+=10){
   fill(7,11,39);
   rect(517,y,3,6);
 }
 for(int y=245;y<310;y+=10){
   fill(7,11,39);
   rect(523,y,3,6);
 }
 for(int y=246;y<310;y+=10){
   fill(7,11,39);
   rect(529,y,3,6);
 }
  
  //water
  fill(14,13,77);
  rect(0,310,900,400);
  
   //grass
   for(int x=0;x<900;x+=20){
   grass(x,310,10,10,3,28,5,255);
      grass(x+10,305,8,8,6,41,8,255);
       grass(x+5,300,5,4,14,62,17,255);
   }
}

void cloud(int x,int y,int w,int h,int red,int green,int blue,int a){
 fill(red,green,blue,a);
 ellipse(x,y,w,h);
}

void grass(int x,int y,int w,int h,int red,int green,int blue,int a){
 fill(red,green,blue,a);
 ellipse(x,y,w,h);
 ellipse(x+5,y+5,w,h);
 ellipse(x-5,y-3,w,h);
 ellipse(x+3,y-5,w,h);
 ellipse(x-3,y+5,w,h);
}




