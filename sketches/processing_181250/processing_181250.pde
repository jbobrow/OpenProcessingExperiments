
float house = 200; //Number to determine house scale

float cloud1 = random(0,20); 
float cloud1s = random(30,50);
float cloud2 = random(50,100);
float cloud2s = random(50,100);
float cloud3 = random(200,300);
float cloud3s = random(0,100);
float cloud4 = random(500,600);
float cloud4s = random(50,70);

float birdX = 300;
float birdY = 300;
float birdSPX =2;
float birdSPY =2;

void setup(){
 size(600,600);
 textFont(createFont("SansSerif",18));
}

void draw(){
  
  //Ways to test house scaling in real time:
  
//  house = mouseY;

//  if(keyPressed&&key=='q'){house=200;}
//  if(keyPressed&&key=='w'){house=100;}
  
  background(0,255,255);
  
  float houseX = width-house*1.5; //300
  float houseY = height-house;    //400
  
  fill(255,233,92);
  noStroke(); triangle(houseX+house,houseY+house*.5,houseX+house*1.4,houseY+house*.5,houseX+house*1.2,houseY+house*.4);//Garage
  rect(houseX+house,houseY+house*.5,house*.4,house*.25);
  stroke(0);
  line(houseX+house,houseY+house*.5,houseX+house*1.2,houseY+house*.4); //Outline of Garage
  line(houseX+house*1.4,houseY+house*.5,houseX+house*1.2,houseY+house*.4);
  line(houseX+house*1.4,houseY+house*.5,houseX+house*1.4,houseY+house*.75);
  line(houseX+house*1.35,houseY+house*.55,houseX+house*1.35,houseY+house*.75);
  line(houseX+house*1.05,houseY+house*.55,houseX+house*1.05,houseY+house*.75);
  line(houseX+house*1.05,houseY+house*.55,houseX+house*1.35,houseY+house*.55);
  line(houseX+house*1.05,houseY+house*.58,houseX+house*1.35,houseY+house*.58);
  line(houseX+house*1.05,houseY+house*.61,houseX+house*1.35,houseY+house*.61);
  line(houseX+house*1.05,houseY+house*.64,houseX+house*1.35,houseY+house*.64);
  line(houseX+house*1.05,houseY+house*.67,houseX+house*1.35,houseY+house*.67);
  line(houseX+house*1.05,houseY+house*.7,houseX+house*1.35,houseY+house*.7);
  line(houseX+house*1.05,houseY+house*.73,houseX+house*1.35,houseY+house*.73);
  line(houseX+house,houseY+house*.75,houseX+house*1.4,houseY+house*.75);
  
  rect(houseX,houseY,house,house*.75);//House (300,400,200,150)
  triangle(houseX,houseY+house*.35,houseX-house*.25,houseY+house*.45,houseX,houseY+house*.45);//Porch top
  rect(houseX-house*.25,houseY+house*.45,house*.01,house*.25);//Left porch column
  rect(houseX-house*.25,houseY+house*.70,house*.25,house*.05);//Porch base
  rect(houseX-house*.24,houseY+house*.625,house*.24,house*.01);//Porch railing
  
  line(houseX,houseY+house*.05,houseX+house,houseY+house*.05); //House lines
  line(houseX,houseY+house*.1,houseX+house,houseY+house*.1);
  line(houseX,houseY+house*.15,houseX+house,houseY+house*.15);
  line(houseX,houseY+house*.2,houseX+house,houseY+house*.2);
  line(houseX,houseY+house*.25,houseX+house,houseY+house*.25);
  line(houseX,houseY+house*.3,houseX+house,houseY+house*.3);
  line(houseX,houseY+house*.35,houseX+house,houseY+house*.35);
  line(houseX,houseY+house*.4,houseX+house,houseY+house*.4);
  line(houseX,houseY+house*.45,houseX+house,houseY+house*.45);
  line(houseX,houseY+house*.5,houseX+house,houseY+house*.5);
  line(houseX,houseY+house*.55,houseX+house,houseY+house*.55);
  line(houseX,houseY+house*.6,houseX+house,houseY+house*.6);
  line(houseX,houseY+house*.65,houseX+house,houseY+house*.65);
  line(houseX,houseY+house*.7,houseX+house,houseY+house*.7);
  
  fill(147,36,151);
  rect(houseX+house*.75,houseY+house*.45,house*.125,house*.25);//Front door (450,490,25,50)
  fill(255,244,171);
  rect(houseX+house*.75,houseY+house*.7,house*.175,house*.025);//First step (450,540,35,5)
  rect(houseX+house*.75,houseY+house*.725,house*.2,house*.025);//Second step (450,545,40,5)
  fill(109,136,198);
  rect(houseX+house*.5,houseY+house*.5,house*.1,house*.125);//Window Low right (400,500,20,25) 
  rect(houseX+house*.25,houseY+house*.5,house*.1,house*.125);//Window Low left (350,500,20,25)
  rect(houseX+house*.25,houseY+house*.2,house*.1,house*.125);//Window Top left (350,440,20,25)
  rect(houseX+house*.75,houseY+house*.2,house*.1,house*.125);//Window Top right (450,440,20,25)
  fill(100);
  quad(houseX-house*.025,houseY+house*.05,houseX+house*1.025,houseY+house*.05,houseX+house,houseY-house*.15,houseX,houseY-house*.15);//Roof (295,410,505,410,500,370,300,370)
  
  fill(0,255,0);
  rect(0,houseY+house*.75,width,height);
  
  noStroke();
  fill(255,255,255,240);
  ellipse(cloud1,45,45,45);
  ellipse(cloud1+12,30,45,45);
  ellipse(cloud1+25,45,45,45);
  ellipse(cloud1+36,30,45,45);
  ellipse(cloud1+49,45,45,45);
  cloud1=cloud1+random(.1,.5);
  
  ellipse(cloud2,80,45,45);
  ellipse(cloud2+12,65,45,45);
  ellipse(cloud2+25,80,45,45);
  ellipse(cloud2+36,65,45,45);
  ellipse(cloud2+49,80,45,45);
  cloud2=cloud2+random(.1,.5);
  
  ellipse(cloud3,150,45,45);
  ellipse(cloud3+12,135,45,45);
  ellipse(cloud3+25,150,45,45);
  ellipse(cloud3+36,135,45,45);
  ellipse(cloud3+49,150,45,45);
  cloud3=cloud3+random(.1,.5);
  
  ellipse(cloud4,215,45,45);
  ellipse(cloud4+12,200,45,45);
  ellipse(cloud4+25,215,45,45);
  ellipse(cloud4+36,200,45,45);
  ellipse(cloud4+49,215,45,45);
  cloud4=cloud4+random(.1,.5);
  
  if(cloud1>width+50){cloud1=-50;}if(cloud2>width+50){cloud2=-50;}if(cloud3>width+50){cloud3=-50;}if(cloud4>width+50){cloud4=-50;}
  
  fill(50);
  ellipse(birdX,birdY,15,15);
  birdX=birdX+birdSPX;
  birdY=birdY+birdSPY;
  birdSPX=birdSPX+random(-.05,.05);
  if(birdSPX>2){birdSPX=2;}
  if(birdSPX<-2){birdSPX=-2;}
  birdSPY=birdSPY+random(-.05,.05);
  if(birdSPY>2){birdSPY=2;}
  if(birdSPY<-2){birdSPY=-2;}
  if(birdY>houseY-35){birdSPY=birdSPY-.1;}
  if(birdY<20){birdSPY=birdSPY+.1;}
  if(birdX>width-20){birdSPX=birdSPX-.1;}
  if(birdX<20){birdSPX=birdSPX+.1;}
  
  fill(0);
  stroke(0);
  text(""+mouseX+",",mouseX+10,mouseY+25);
  text(""+mouseY+"",mouseX+10,mouseY+45);
}
