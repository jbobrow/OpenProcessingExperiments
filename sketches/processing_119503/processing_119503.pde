
int s=0;
int l=0;
int z=0;
int b1=0;
int b2=0;
float x=100;
PFont f;
PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
PImage fig1;
PImage fig2;
PImage fig3;
PImage fig4;
//
PImage img10;
PImage img20;
PImage img30;
PImage img40;
PImage img50;
PImage img60;
PImage img70;
PImage img80;
PImage img90;
PImage drug;
void setup(){
size (800,500);
f= createFont("Geneva",16,true);
img1= loadImage("W0.png");
img2= loadImage("WR1.png");
img3= loadImage("WR2.png");
img4= loadImage("WR3.png");
img5= loadImage("WR4.png");
img6= loadImage("WR5.png");
img7= loadImage("WR6.png");
img8= loadImage("WR7.png");
img9= loadImage("WR8.png");
//
img10= loadImage("WL0.png");
img20= loadImage("WL1.png");
img30= loadImage("WL2.png");
img40= loadImage("WL3.png");
img50= loadImage("WL4.png");
img60= loadImage("WL5.png");
img70= loadImage("WL6.png");
img80= loadImage("WL7.png");
img90= loadImage("WL8.png");
//
fig1= loadImage("fig1.png");
fig2= loadImage("fig2.png");
fig3= loadImage("fig3.png");
fig4= loadImage("fig4.png");
drug= loadImage("drug.png");
}
void draw() {
  background(255-z/100);
  strokeWeight(4);
  stroke(0);
  line(0,400,800,400);
  line(0,100,800,100);
  if (s>8) {
    s=1;
  }if (s<-9) {
    s=-1;
  }
  if(z<0) {
    z=0;
  }
  if (l>7) {
    s=s+1;
    l=0;
  } 
  if (l<-7) {
    s=s-1;
    l=0;
  }
  if (x>width/2-50) {
    x=width/2-50;
    z=z+1;
  }else if (x<100) {
    if (z>0){
    x=100;
    z=z-1;
    }
  }
  if(x<0) {
    x=0;
  }
  
  if (mouseX>width/2+100) {
    l=l+1;
    x=x+1;
  }else if (mouseX<width/2-100) {
    l=l-1;
    x=x-1;
  }else if ((mouseX>width/2-100) && (mouseX<width/2+100)){
   if (s>0){
  s=0;
  l=0;
  }if (s<0) {
    s=-1;
    l=0;
  }
  }
  if (s==0) {
    img=img1;
  }
  if (s==1) {
    img=img2;
  }
  if (s==2) {
    img=img3;
  }
  if (s==3) {
    img=img4;
  }
  if (s==4) {
    img=img5;
  }
  if (s==5) {
    img=img6;
  }
  if (s==6) {
    img=img7;
  }
  if (s==7) {
    img=img8;
  }
  if (s==8) {
    img=img9;
  }
  //
  if (s==-1) {
    img=img10;
  }
  if (s==-2) {
    img=img20;
  }
  if (s==-3) {
    img=img30;
  }
  if (s==-4) {
    img=img40;
  }
  if (s==-5) {
    img=img50;
  }
  if (s==-6) {
    img=img60;
  }
  if (s==-7) {
    img=img70;
  }
  if (s==-8) {
    img=img80;
  }
  if (s==-9) {
    img=img90;
  }
  image(fig1,2070-z,200,60,200);
  image(fig2,1370-z,200,90,200);
  image(fig3,3470-z,200,90,200);
  image(img,x,275);
  image(drug,2370-z,185);
  for (int i = 0; i < 2400; i = i+30) {
  line(i-z, 100, i-z, 400);
}
for (int i = 3100; i < 11900; i = i+30) {
  line(i-z, 100, i-z, 400);
}
for (int i = 0; i<11900; i = i+50) {
  fill(100-z/100,10,10);
  rect(i-z,400,50,25);
}
  for (int i = -20; i<11900; i = i+50) {
  rect(i-z,425,50,25);
}
for (int i = 0; i<11900; i = i+50) {
  rect(i-z,450,50,25);
}
for (int i = -20; i<11900; i = i+50) {
  rect(i-z,475,50,25);
}
//
for (int i = 0; i<11900; i = i+50) {
  rect(i-z,0,50,25);
}
  for (int i = -20; i<11900; i = i+50) {
  rect(i-z,25,50,25);
}
for (int i = 0; i<11900; i = i+50) {
  rect(i-z,50,50,25);
}
for (int i = -20; i<11900; i = i+50) {
  rect(i-z,75,50,25);
}
for (int i = 770; i<970; i = i+50) {
  for (int j= 100; j<400; j= j+25) {
  rect(i-z,j,50,25);
  }
}
for (int i = 770+700; i<970+700; i = i+50) {
  for (int j= 100; j<400; j= j+25) {
  rect(i-z,j,50,25);
  }
}
for (int i = 770+1400; i<970+1400; i = i+50) {
  for (int j= 100; j<400; j= j+25) {
  rect(i-z,j,50,25);
  }
}
for (int i = 770+2100; i<970+2100; i = i+50) {
  for (int j= 100; j<400; j= j+25) {
  rect(i-z,j,50,25);
  }
}
for (int i = 770+2800; i<970+2800; i = i+50) {
  for (int j= 100; j<400; j= j+25) {
  rect(i-z,j,50,25);
  }
}
for (int i = 770+3500; i<970+3500; i = i+50) {
  for (int j= 100; j<400; j= j+25) {
  rect(i-z,j,50,25);
  }
}
for (int i = 770+4200; i<970+4200; i = i+50) {
  for (int j= 100; j<400; j= j+25) {
  rect(i-z,j,50,25);
  }
}
for (int i = 770+4900; i<970+4900; i = i+50) {
  for (int j= 100; j<400; j= j+25) {
  rect(i-z,j,50,25);
  }
}
textFont(f,12);
    fill(255);
    textAlign(CENTER);
    text("1925",2375-z,415);
    text("1971",2625-z,415);
    text("2012",2875-z,415);
      fill(0);
    textFont(f,18);
    text("The U.S. State and",2460-z,150);
    text("Federal Prison Pop.",2460-z,170);
    text("Has Increased",2440-z,190);
    text("Over 800% in",2440-z,210);
    text("40 Years.",2440-z,230);
    if (z>2200) {
    fill(0);
    textFont(f,24);
    text("War On Drugs",2625-z,200);
    text("Launched",2625-z,230);
    triangle(2625-z,350,2615-z,335,2635-z,335);
    line(2625-z,335,2625-z,235);
    }
  if ((mouseX>1370-z)&&(mouseX<1460-z)) {
strokeWeight(2);
line(1400-z,325,1300-z,250);
line(1400-z,325,1350-z,250);
fill(213,220,237);
ellipse(1300-z,180,285,190);
noStroke();
triangle(1300-z,250,1350-z,250,1400-z,325); 
textFont(f,11);
    fill(0);
    textAlign(CENTER);
    text("There are many",1300-z,105);
    text("things that threaten the safety",1300-z,120);
    text("of homeless people on a daily basis.",1300-z,135);
    text(" Without a place to rest or keep clean,",1300-z,150);
    text("it’s difficult to meet basic expectations for",1300-z,165);
    text(" holding a job, and there aren’t many jobs to begin",1300-z,180);
    text("with. Homeless people are forced to sleep, use",1300-z,195);
    text("the bathroom, and store possessions in public,",1300-z,210);
    text("making them vulnerable to police. More and",1300-z,225);
    text(" more, our society uses police, prisons,",1300-z,240);
    text("and courts to criminalize",1300-z,255);
    text("the homeless.",1300-z,270);
}
if (b1>4) {
  b1=4;
}
println(z);
if (z<1300) {
if (b1>=1) {
  fill(226,213,237);
     strokeWeight(3);
     rect(1480-z,110,180,380,7);
     textFont(f,12);
    fill(0);
    textAlign(CENTER);
    text("-Housing costs are way too",1570-z,135);
    text("high and minimum wage",1570-z,150);
    text("income does not cover fair",1570-z,165);
    text("market rent in any city or",1570-z,180);
    text("county in the U.S.",1570-z,195);
}if (b1>=2) {
  text("-One study found that out of ",1570-z,225);
  text("57 cities surveyed, not a",1570-z,240);
  text("single one had enough shelter",1570-z,255);
  text("beds for the homeless.",1570-z,270);
}if (b1>=3) {
  text("-Not having a mailing address",1570-z,300);
  text("makes it hard to register to",1570-z,315);
  text("vote, receive government",1570-z,330);
  text("benefits, or apply for a job.",1570-z,345);
}if (b1>=4) {
  text("-In one year, 43,000 people",1570-z,375);
  text("were cited for breaking",1570-z,390);
  text("“quality of life” laws in",1570-z,405);
  text("San Francisco. People who",1570-z,420);
  text("are cited usually have to",1570-z,435);
  text("pay a fine, and if they",1570-z,450);
  text("can’t, are put in jail.",1570-z,465);
}
}
  if ((mouseX>2070-z)&&(mouseX<2130-z)) {
strokeWeight(2);
line(2070-z,250,2000-z,150);
line(2070-z,250,1900-z,150);
fill(242,231,215);
ellipse(1950-z,150,285,190);
noStroke();
triangle(1900-z,150,2000-z,150,2070-z,250);
textFont(f,11);
    fill(0);
    textAlign(CENTER);
    text("Queer people face",1950-z,75);
    text("higher surveillance and",1950-z,90);
    text("multiple forms of policing based on",1950-z,105);
    text("their actions and appearances. The police",1950-z,120);
    text("and prisons are incredibly sexist institutions",1950-z,135);
    text("that criminalize gender and sexual identities that",1950-z,150);
    text("deviate from the norm. The prison-industrial",1950-z,165);
    text("complex targets queer youth, queers of color,",1950-z,180);
    text("queer sex workers, transgendered people,",1950-z,195);
    text("and low-income queers.",1950-z,210);
  }
  if (b2>5) {
    b2=5;
  }
  if (z<2000) {
if (b2>=1) {
  fill(215,242,233);
     strokeWeight(3);
     rect(2180-z,110,180,380,7);
     textFont(f,12);
    fill(0);
    textAlign(CENTER);
   text("-Many queer youth are denied",2270-z,130);
    text("a home because of their",2270-z,145);
    text("sexuality and are put in",2270-z,160);
    text("foster care or forced",2270-z,175);
    text("onto the streets.",2270-z,190);
}if (b2>=2) {
  text("-100% of queer youth in group",2270-z,215);
  text("homes have experienced",2270-z,230);
  text("heterosexist verbal abuse in",2270-z,245);
  text("their foster care. 70% have",2270-z,260);
  text("experienced violence there.",2270-z,275);
}if (b2>=3) {
  text("-35%-50% of homeless youth",2270-z,300);
  text("are queer.",2270-z,315);
}if (b2>=4) {
  text("-49% of attacks on",2270-z,340);
  text("transgendered people in SF",2270-z,355);
  text("are committed by police.",2270-z,370);
}if (b2>=5) {
  text("-Queer/trans prisoners are",2270-z,395);
  text("forced into living conditions",2270-z,410);
  text("segregated “male” and",2270-z,425);
  text("“female,”and are often",2270-z,440);
  text(" housed in solitary",2270-z,455);
  text("confinement againsttheir own",2270-z,470);
  text("will and notions of safety.",2270-z,485);
}
 }
 if ((mouseX>3470-z)&&(mouseX<3560-z)) {
strokeWeight(2);
line(3475-z,250,3400-z,200);
line(3475-z,250,3450-z,200);
fill(213,220,237);
ellipse(3330-z,150,305,210);
noStroke();
fill(213,220,237);
triangle(3400-z,200,3450-z,200,3475-z,250); 
textFont(f,11);
    fill(0);
    textAlign(CENTER);
    text("While we are",3330-z,75);
    text("told that prisons will keep us",3330-z,90);
    text("safe from domestic and sexual violence,",3330-z,105);
    text("prisons are actually a source of extreme",3330-z,120);
    text("violence for women, and particularly women",3330-z,135);
    text(" of color. Women face harsh prison sentences for",3330-z,150);
    text("defending themselves against abuse or simply",3330-z,165);
    text("trying to survive and support their families.",3330-z,180);
    text("Globalization of economic markets,",3330-z,195);
    text("deindustrialization, the dismantling",3330-z,210);
    text("of social services, all contribute to",3330-z,225);
    text("women’s imprisonment.",3330-z,240);
}
}
 void mouseClicked() {
   if ((mouseX>1370-z)&&(mouseX<1460-z)) {
     b1=b1+1;
   }if ((mouseX>2070-z)&&(mouseX<2130-z)) {
     b2=b2+1;
   }
 }


