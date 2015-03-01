
int timer;
int x;
int y;
int y2;
void setup()
{
  timer=0;
  
  size(1000, 1000);
  
  arial=createFont("Arial,24");

  textFont(arial);
x=880;

y=680;
y2=720;
}

void draw(){
  background(0);
  fill(255);
timer++;
textSize(50);
  text("I'm always Busy", 150 ,400);

if(timer>=30){
  background(0);
  textSize(100);
    text("Busy", 400, 400);
    
}
if(timer>=60){
  background(0);
  textSize(150);
    text("Busy", 400, 450);
}
if(timer>=90){
  background(0);
textSize(200);
    text("Busy", 400, 500);
}
if(timer>=120){
  background(0);
textSize(250);
    text("Busy", 400, 550);
}
if(timer >= 180){
background(0);
  noFill();
  textSize(50);
  text("Find", 100, 100);

}
if(timer >= 190){
noFill();
  textSize(50);
  text("me", 150, 130);

}
if(timer >= 200){
textSize(50);
noFill();
  text("something", 100, 160);

}
if(timer >= 210){
textSize(80);
  fill(random(30,255),random(30,255),random(30,255));
  text("NEW", 150, 220);

}
if(timer >= 220){
textSize(50);
  fill(255);
  text("to", 100, 260);

}

if(timer >= 225){
textSize(50);
  fill(255);
  text("do", 150, 260);

}
if(timer >= 270){
background(0);
  textSize(100);
  fill(255);
  text("But it's ", 300, 700);

}
if(timer >= 300){
textSize(200);
x++;
  fill(random(255),0,0);
  text("exhausting", 10, x);
}
if(timer>= 420){
background(0);
}
if(timer >= 520){
background(0);
textSize(100);
fill(255);
textAlign(CENTER);
text("PRESSURE", 500, 600);
}
if(timer >= 535){

textSize(200);
fill(255);
textAlign(CENTER);
text("FORCING", 500, 750);
}
if(timer >= 570){

textSize(330);
fill(255);
textAlign(CENTER);
text("DOWN", 500, 1000);
}

if(timer >= 600){
  background(0);
  textSize(25);
text("Carry the", 900, 540); 
}
if(timer >= 615){
//  background(0);
  textSize(75);
text("weight", 850, 600); 
}
if(timer >= 630){
//  background(0);
  textSize(25);
text("of the", 920, 625); 
}
if(timer >= 645){
//  background(0);
  textSize(75);
  fill(0,0,random(255));
text("wOrld", 855, 680); 
}
if(timer >= 660){
//background(0);
textSize(75);
fill(0,0,random(255));
text("wOrld", 855, 680);
textSize(50);
fill(255);
text("Atop my shoulders", 750, 720);
}
if (timer >= 720){
background(0);
textSize(75);
fill(0,0,random(255));
text("wOrld", 855, y);
textSize(50);
fill(255);
text("shoulders", 855, y2);
y++;
y2++;
}
if(timer >=780){
background(0);
textSize(50);
text("Die", 500,500);

}
if(timer >=800){
//background(0);
textSize(50);
text("S", 500,600);

}
if(timer >=860){
//background(0);
textSize(50);
text("L", 525,625);

}

if(timer >=920){
//background(0);
textSize(50);
text("O", 550,650);

}

if(timer >=980){
//background(0);
textSize(50);
text("W", 575,675);
}

if(timer >=1040){
//background(0);
textSize(50);
text("L", 600,700);
}

if(timer >=1100){
//background(0);
textSize(50);
text("Y", 625,725);
}
if(timer >=1130){
//background(0);
textSize(15);
text("inside", 500,550);
}
if(timer >=1200){
background(0);
textSize(100);
text("Only", 100,900);
}
if(timer >=1230){
//background(0);
textSize(100);
text("to please", 200,800);
}

if(timer >=1260){
//background(0);
textSize(150);
textAlign(LEFT);
text("EVERYONE", 0,700);
}

if(timer >=1320){
background(0);
textSize(300);
//textAlign(LEFT);
text("SELF", 100,300);
}

if(timer >=1330){
//background(0);
textSize(150);
textAlign(LEFT);
text("DECIMATION", 50,800);
}
if(timer >= 1400){
  background(random(255));
textSize(300);
//textAlign(LEFT);
fill(random(255));
text("SELF", 100,300);
textSize(150);
textAlign(LEFT);
fill(random(255));
text("DECIMATION", 50,800);
}
if(timer >= 1660){
background(0);
fill(255);
textSize(10);
textAlign(LEFT);
text("Written in Haiku", 500, 500);
textSize(10);
textAlign(LEFT);
text("What a glorius method", 500, 510);
textSize(10);
textAlign(LEFT);
text("Of story telling", 500, 520);

}
}


