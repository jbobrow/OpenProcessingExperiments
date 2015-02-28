
void setup(){
  
size(800,700);
background(40,150,100); 
smooth();

noStroke();
colorMode(HSB,width);
for (float a=1; a<800; a*=1.2){
  fill(random(300,500),700,random(180,255));
  ellipse(random(0,width),random(200,height),random(10,height/4),random(10,height/4));
}


colorMode(HSB,width);
for (float a=1; a<800; a*=1.2){
  fill(random(200,400),400,random(300,800));
  ellipse(random(0,width),random(300,height),random(10,height/4),random(10,height/4));
}


colorMode(HSB,width);
for (float a=1; a<800; a+=20){
  /*fill(random(150,450),255,random(180,255));*/
  strokeWeight(random(.5,13));
  stroke(350,random(500,800),random(200,255));
  line(a,height,a,random(200,height*.75));
}

colorMode(HSB,width);
for (float a=1; a<800; a+=40){
  /*fill(random(150,450),255,random(180,255));*/
  strokeWeight(random(.5,10));
  stroke(350,random(500,800),random(200,400));
  line(a,height,a,random(00,height*.75));
}

colorMode(RGB,255);
//leg_back
fill(170,00,0);
noStroke();
quad(170,225,220,235,188,250,178,245);
//foot_back
fill(20,10,10);
beginShape();
   vertex(180,245);
   bezierVertex(160,247,150,245,140,260);
   bezierVertex(150,250,175,250,170,250);
   bezierVertex(160,252,155,260,150,265);
   bezierVertex(160,260,165,255,180,252);
   bezierVertex(190,255,210,265,210,275);
   bezierVertex(210,260,200,255,190,250);
   bezierVertex(190,250,185,245,180,245);
endShape();

//leg_front
fill(205,20,0);
noStroke();
quad(180,230,230,240,198,255,188,250);
//foot_front
fill(35,25,25);
beginShape();
   vertex(190,250);
   bezierVertex(170,252,160,250,150,265);
   bezierVertex(160,255,185,255,180,255);
   bezierVertex(170,257,165,265,160,270);
   bezierVertex(170,265,175,260,190,257);
   bezierVertex(200,260,220,270,220,280);
   bezierVertex(220,265,210,260,200,255);
   bezierVertex(200,255,195,250,190,250);
endShape();
   

  

//body
fill(210,25,5);
noStroke();
beginShape();
   vertex(75,75);
   bezierVertex(60,65,70,40,100,50);
   bezierVertex(130,60,135,75,140,80);
   bezierVertex(145,85,170,105,180,110);
   bezierVertex(190,115,270,160,230,250);
   bezierVertex(190,250,120,200,110,170);
   bezierVertex(100,165,95,160,95,145);
   bezierVertex(90,140,55,105,90,80);
 endShape();

//eye
fill(255);
beginShape();
  vertex(95,70);
  bezierVertex(105,70,100,58,110,60);
  bezierVertex(120,62,132,73,105,105);
endShape();
fill(0);
ellipse(112,67,4,4);

//beak_top
 fill(255,240,220);
 noStroke();
 beginShape();
   vertex(90,115);
   bezierVertex(80,105,70,80,75,65);
   bezierVertex(90,50,102,78,100,80);
   bezierVertex(95,90,85,105,90,115);
 endShape();

//beak_bottom
fill(20,5,10);
noStroke();
beginShape();
  vertex(90,100);
  bezierVertex(95,90,95,90,100,80);
  bezierVertex(110,85,110,100,110,100);
  bezierVertex(105,110,95,115,90,100);
endShape();


  
  
/*
//body__ORIGINAL PLACEMENT
fill(210,25,5);
noStroke();
beginShape();
   vertex(75,55);
   bezierVertex(60,45,70,20,100,30);
   bezierVertex(130,40,135,55,140,60);
   bezierVertex(145,65,170,85,180,90);
   bezierVertex(190,95,270,140,230,230);
   bezierVertex(190,230,120,180,110,150);
   bezierVertex(100,145,95,140,95,125);
   bezierVertex(90,120,55,85,90,60);
 endShape();

//beak_top
 fill(255,240,220);
 noStroke();
 beginShape();
   vertex(90,95);
   bezierVertex(80,85,70,60,75,45);
   bezierVertex(90,30,102,58,100,60);
   bezierVertex(95,70,85,85,90,95);
 endShape();

//beak_bottom
fill(20,5,10);
noStroke();
beginShape();
  vertex(90,80);
  bezierVertex(95,70,95,70,100,60);
  bezierVertex(110,65,110,80,110,80);
  bezierVertex(105,90,95,95,90,80);
endShape();

//eye
ellipse(112,47,4,4);
*/




//wing:
 fill(150,0,0,50);
 noStroke();
 beginShape();
   curveVertex(320,330);
   curveVertex(320,330);
   curveVertex(230,150);
   curveVertex(135,115); 
   curveVertex(160,200);
   curveVertex(320,330);
   curveVertex(320,330);
 endShape(); 
 
  
 //feathers_blue
 noStroke();
 fill(30,30,255);
 beginShape();
   curveVertex(265,260);
   curveVertex(265,260);
   curveVertex(320,320);
   curveVertex(310,325);
   curveVertex(265,260);
   curveVertex(265,260);
 endShape();
 fill(50,80,255);
 beginShape();
   curveVertex(255,235);
   curveVertex(255,235);
   curveVertex(310,295);
   curveVertex(300,300);
   curveVertex(255,235);
   curveVertex(255,235);
 endShape();
 //long feather:
 fill(30,30,200);
 beginShape();
   curveVertex(245,245);
   curveVertex(245,245);
   curveVertex(300,305);
   curveVertex(290,310);
   curveVertex(245,245);
   curveVertex(245,245);
 endShape();
 fill(0,0,150);
 beginShape();
   curveVertex(240,225);
   curveVertex(240,225);
   curveVertex(295,285);
   curveVertex(285,290);
   curveVertex(240,225);
   curveVertex(240,225);
 endShape();
 fill(0,0,100);
 beginShape();
   curveVertex(225,230);
   curveVertex(225,230);
   curveVertex(280,290);
   curveVertex(270,295);
   curveVertex(225,230);
   curveVertex(225,230);
 endShape();
 fill(0,0,255);
 beginShape();
   curveVertex(210,225);
   curveVertex(210,225);
   curveVertex(265,285);
   curveVertex(255,290);
   curveVertex(210,225);
   curveVertex(210,225);
 endShape();
 fill(50,150,200);
 beginShape();
   curveVertex(180,200);
   curveVertex(180,200);
   curveVertex(235,260);
   curveVertex(225,265);
   curveVertex(180,200);
   curveVertex(180,200);
 endShape();
 fill(0,70,200);
 beginShape();
   curveVertex(150,170);
   curveVertex(150,170);
   curveVertex(205,230);
   curveVertex(195,235);
   curveVertex(150,170);
   curveVertex(150,170);
 endShape();
 fill(0,50,100);
 beginShape();
   curveVertex(240,203);
   curveVertex(240,203);
   curveVertex(295,263);
   curveVertex(285,268);
   curveVertex(240,203);
   curveVertex(240,203);
 endShape();
 fill(0,150,255);//medium upper middle-center
 beginShape();
   curveVertex(237,222);
   curveVertex(237,222);
   curveVertex(277,262);
   curveVertex(262,272);
   curveVertex(237,222);
   curveVertex(237,222);
 endShape();
 fill(0,0,255);//medium upper middle-right
 beginShape();
   curveVertex(245,210);
   curveVertex(245,210);
   curveVertex(285,250);
   curveVertex(270,260);
   curveVertex(245,210);
   curveVertex(245,210);
 endShape();
 fill(0,0,200);//medium upper middle-left
 beginShape();
   curveVertex(215,215);
   curveVertex(215,215);
   curveVertex(255,255);
   curveVertex(240,265);
   curveVertex(215,215);
   curveVertex(215,215);
 endShape(); 
 fill(10,50,200);//medium upper middle-left
 beginShape();
   curveVertex(195,200);
   curveVertex(195,200);
   curveVertex(235,240);
   curveVertex(220,250);
   curveVertex(195,200);
   curveVertex(195,200);
 endShape(); 
 fill(10,10,255);//small upper left
 beginShape();
   curveVertex(160,185);
   curveVertex(160,185);
   curveVertex(185,215);
   curveVertex(175,220);
   curveVertex(160,185);
   curveVertex(160,185);
 endShape();
 fill(10,10,150);//small upper left
 beginShape();
   curveVertex(145,170);
   curveVertex(145,170);
   curveVertex(170,200);
   curveVertex(160,205);
   curveVertex(145,170);
   curveVertex(145,170);
 endShape();
 fill(10,10,150);//small upper right
 beginShape();
   curveVertex(265,210);
   curveVertex(265,210);
   curveVertex(290,240);
   curveVertex(280,245);
   curveVertex(265,210);
   curveVertex(265,210);
 endShape();
 
 //feathers_yellow
  fill(235,215,80);
 beginShape();
   curveVertex(210,195);
   curveVertex(210,195);
   curveVertex(250,235);
   curveVertex(235,245);
   curveVertex(210,195);
   curveVertex(210,195);
 endShape(); 
  fill(255,245,30);
 beginShape();
   curveVertex(230,195);
   curveVertex(230,195);
   curveVertex(270,235);
   curveVertex(255,245);
   curveVertex(230,195);
   curveVertex(230,195);
 endShape(); 
 fill(255,160,30);//medium lower left
 beginShape();
   curveVertex(185,185);
   curveVertex(185,185);
   curveVertex(225,225);
   curveVertex(210,235);
   curveVertex(185,185);
   curveVertex(185,185);
 endShape(); 
 fill(240,180,60);//small lower right
 beginShape();
   curveVertex(255,205);
   curveVertex(255,205);
   curveVertex(280,235);
   curveVertex(270,240);
   curveVertex(255,205);
   curveVertex(255,205);
 endShape();
 fill(255,255,90);//small middle left
 beginShape();
   curveVertex(200,185);
   curveVertex(200,185);
   curveVertex(225,215);
   curveVertex(215,220);
   curveVertex(200,185);
   curveVertex(200,185);
 endShape();
 fill(255,200,30);//medium middle left
 beginShape();
   curveVertex(170,175);
   curveVertex(170,175);
   curveVertex(210,215);
   curveVertex(195,225);
   curveVertex(170,175);
   curveVertex(170,175);
 endShape(); 
 fill(255,160,30);//medium middle center
 beginShape();
   curveVertex(210,175);
   curveVertex(210,175);
   curveVertex(250,215);
   curveVertex(235,225);
   curveVertex(210,175);
   curveVertex(210,175);
 endShape(); 
 fill(255,230,170);//medium middle right
 beginShape();
   curveVertex(230,180);
   curveVertex(230,180);
   curveVertex(270,220);
   curveVertex(255,230);
   curveVertex(230,180);
   curveVertex(230,180);
 endShape(); 
 fill(255,190,10);//medium middle far right
 beginShape();
   curveVertex(230,165);
   curveVertex(230,165);
   curveVertex(270,205);
   curveVertex(255,215);
   curveVertex(230,165);
   curveVertex(230,165);
 endShape(); 
 fill(255,240,50);//small upper left
 beginShape();
   curveVertex(155,165);
   curveVertex(155,165);
   curveVertex(180,195);
   curveVertex(170,200);
   curveVertex(155,165);
   curveVertex(155,165);
 endShape();
  fill(255,150,00);//small upper left
 beginShape();
   curveVertex(145,155);
   curveVertex(145,155);
   curveVertex(170,185);
   curveVertex(160,190);
   curveVertex(145,155);
   curveVertex(145,155);
 endShape();
 
 //feathers_red
 noStroke();
 fill(255,30,30);//medium lower left
 beginShape();
   curveVertex(170,160);
   curveVertex(170,160);
   curveVertex(210,200);
   curveVertex(195,210);
   curveVertex(170,160);
   curveVertex(170,160);
 endShape();
 fill(230,50,30);//medium lower center-left
 beginShape();
   curveVertex(190,160);
   curveVertex(190,160);
   curveVertex(230,200);
   curveVertex(215,210);
   curveVertex(190,160);
   curveVertex(190,160);
 endShape();
 fill(255,100,50);//medium lower center-right
 beginShape();
   curveVertex(200,150);
   curveVertex(200,150);
   curveVertex(240,190);
   curveVertex(225,200);
   curveVertex(200,150);
   curveVertex(200,150);
 endShape();
 fill(255,50,50);//medium lower right
 beginShape();
   curveVertex(215,135);
   curveVertex(215,135);
   curveVertex(255,175);
   curveVertex(235,185);
   curveVertex(215,135);
   curveVertex(215,135);
 endShape();
 fill(255,50,10);//medium middle left
 beginShape();
   curveVertex(150,140);
   curveVertex(150,140);
   curveVertex(190,180);
   curveVertex(175,190);
   curveVertex(150,140);
   curveVertex(150,140);
 endShape();
 fill(255,70,40);//medium middle center
 beginShape();
   curveVertex(150,110);
   curveVertex(150,110);
   curveVertex(190,150);
   curveVertex(175,160);
   curveVertex(150,110);
   curveVertex(150,110);
 endShape();
 fill(255,90,20);//medium middle center-left
 beginShape();
   curveVertex(170,145);
   curveVertex(170,145);
   curveVertex(210,185);
   curveVertex(195,195);
   curveVertex(170,145);
   curveVertex(170,145);
 endShape();
 fill(200,10,30);//small middle center
 beginShape();
   curveVertex(200,155);
   curveVertex(200,155);
   curveVertex(225,185);
   curveVertex(215,190);
   curveVertex(200,155);
   curveVertex(200,155);
 endShape();
 fill(230,20,20);//medium middle center-right
 beginShape();
   curveVertex(190,125);
   curveVertex(190,125);
   curveVertex(230,165);
   curveVertex(215,175);
   curveVertex(190,125);
   curveVertex(190,125);
 endShape();
 fill(200,10,30);//small middle right
 beginShape();
   curveVertex(200,125);
   curveVertex(200,125);
   curveVertex(225,155);
   curveVertex(215,160);
   curveVertex(200,125);
   curveVertex(200,125);
 endShape(); 
 fill(255,0,0);//medium middle center
 beginShape();
   curveVertex(170,120);
   curveVertex(170,120);
   curveVertex(210,160);
   curveVertex(195,170);
   curveVertex(170,120);
   curveVertex(170,120);
 endShape();
 //small feather:
  fill(255,10,00);
 beginShape();
   curveVertex(135,130);
   curveVertex(135,130);
   curveVertex(160,160);
   curveVertex(150,165);
   curveVertex(135,130);
   curveVertex(135,130);
 endShape();
 fill(255,50,30);//small upper left
 beginShape();
   curveVertex(130,140);
   curveVertex(130,140);
   curveVertex(155,170);
   curveVertex(145,175);
   curveVertex(130,140);
   curveVertex(130,140);
 endShape();
 fill(200,20,10);//medium upper center
 beginShape();
   curveVertex(130,100);
   curveVertex(130,100);
   curveVertex(170,140);
   curveVertex(155,150);
   curveVertex(130,100);
   curveVertex(130,100);
 endShape();


colorMode(RGB,255);
scale(.9);
body(450,50);
face(450,50);
wing(450,50);
wing2(525,50);
wing3(650,50);


scale(1.5);
body(550,200);
face(550,200);
wing(550,200);
wing2(665,265);
wing3(855,380);


scale(1.1);
body(750,300);
face(750,300);
wing(750,300);
wing2(950,410);
wing3(1300,600);

scale(2.9);
body(800,50);
face(800,50);
wing(800,50);
wing2(1030,55);
wing3(1430,60);

scale(3.0);
body(1000,40);
face(1000,40);
wing(1000,40);
wing2(1315,40);
wing3(1860,35);



}











void body (int a, int b){
 fill(210,25,5);
 noStroke();
 scale(1.0);
 beginShape();
   vertex(75+a,75+b);
   bezierVertex(60+a,65+b,70+a,40+b,100+a,50+b);
   bezierVertex(130+a,60+b,135+a,75+b,140+a,80+b);
   bezierVertex(145+a,85+b,170+a,105+b,180+a,110+b);
   bezierVertex(190+a,115+b,270+a,160+b,230+a,250+b);
   bezierVertex(190+a,250+b,120+a,200+b,110+a,170+b);
   bezierVertex(100+a,165+b,95+a,160+b,95+a,145+b);
   bezierVertex(90+a,140+b,55+a,105+b,90+a,80+b);
  endShape(); 
}




void face (int a, int b){
 //eye
fill(255);
beginShape();
  vertex(95+a,70+b);
  bezierVertex(105+a,70+b,100+a,58+b,110+a,60+b);
  bezierVertex(120+a,62+b,132+a,73+b,105+a,105+b);
endShape();
fill(0);
ellipse(112+a,67+b,4,4);

//beak_top
 fill(255,240,220);
 noStroke();
 beginShape();
   vertex(90+a,115+b);
   bezierVertex(80+a,105+b,70+a,80+b,75+a,65+b);
   bezierVertex(90+a,50+b,102+a,78+b,100+a,80+b);
   bezierVertex(95+a,90+b,85+a,105+b,90+a,115+b);
 endShape();

//beak_bottom
fill(20,5,10);
noStroke();
beginShape();
  vertex(90+a,100+b);
  bezierVertex(95+a,90+b,95+a,90+b,100+a,80+b);
  bezierVertex(110+a,85+b,110+a,100+b,110+a,100+b);
  bezierVertex(105+a,110+b,95+a,115+b,90+a,100+b);
endShape();
}


void wing(int a, int b){
  //wing:
 fill(0,0,200);
 strokeWeight(.2);
 stroke(1);
 beginShape();
   curveVertex(320+a,330+b);
   curveVertex(320+a,330+b);
   curveVertex(230+a,150+b);
   curveVertex(135+a,115+b); 
   curveVertex(160+a,200+b);
   curveVertex(320+a,330+b);
   curveVertex(320+a,330+b);
 endShape(); 
 
}


void wing2(int a, int b){
  //wing:
 fill(255,200,30);
 strokeWeight(.2);
 stroke(1);
 beginShape();
   scale(.7);
   curveVertex(510+a,400+b);
   curveVertex(510+a,400+b);
   curveVertex(420+a,220+b);
   curveVertex(325+a,185+b); 
   curveVertex(350+a,270+b);
   curveVertex(510+a,400+b);
   curveVertex(510+a,400+b);
 endShape(); 
 
}


void wing3(int a, int b){
  //wing:
 fill(200,0,0);
 strokeWeight(.2);
 stroke(1);
 beginShape();
   scale(.65);
   curveVertex(860+a,525+b);
   curveVertex(860+a,525+b);
   curveVertex(770+a,345+b);
   curveVertex(675+a,310+b); 
   curveVertex(700+a,395+b);
   curveVertex(860+a,525+b);
   curveVertex(860+a,525+b);
 endShape(); 
 
}

