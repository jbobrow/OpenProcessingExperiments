
boolean vector = false;
float speed = 0.0;
float easing = 0.005;
float angle;
boolean color_switch = false;
boolean shake_hand = false;
float x = 100;
float foot_easing = .005;
float foot_y = 270;
boolean right_step = true;

float bombX=-100;
boolean bomb_shake = true;
float bombX2=330;
float ex_scale;
float shellX = -77;
float shellY = 90;
float shellY_change = -1.0;
float cloudX=-600;
float cloudX2=600;
boolean lightning = false;
float lightningX;
float lightningY;

////rain floats
float rain_random = 0;
float dropX = random(20,460);
float dropY=-20;
float dropX2= random(20,460);
float dropY2=-20;
float dropX3= random(20,460);
float dropY3=-20;
float dropX4= random(20,460);
float dropY4=-20;
float dropX5= random(20,460);
float dropY5=-20;
float dropX6= random(20,460);
float dropY6=-20;
float dropX7= random(20,460);
float dropY7=-20;
float dropX8= random(20,460);
float dropY8=-20;
float dropX9= random(20,460);
float dropY9=-20;
float dropX10= random(20,460);
float dropY10=-20;
float dropX11= random(20,460);
float dropY11=-20;
float dropX12= random(20,460);
float dropY12=-20;
float dropX13= random(20,460);
float dropY13=-20;
float dropX14= random(20,460);
float dropY14=-20;
float dropX15= random(20,460);
float dropY15=-20;

float umbY = 120;







PImage mach;
PImage Ih;
PImage Ib;
PImage Ilf;
PImage Irf;
PImage Ile;
PImage Ire;
PImage ILl;
PImage IRl;
PImage Ibl;
PImage Iback;
PImage brkn;
PImage shell;

////clouds////
PShape c1;
PShape c2;
PShape c3;
PShape c4;
PShape c5;
PShape c6;
PShape c7;
PShape c8;
PShape c9;
PShape c10;

///umbrella
PShape u1;
PShape u2;
PShape u3;
PShape u4;
PShape u5;
PShape u6;
PShape u7;
PShape u8;
PShape u9;
PShape u10;
PShape u11;
PShape u12;
PShape u13;

PShape m;
PShape Le;
PShape Re;
PShape Lp;
PShape Rp;
PShape bomb;
PShape ex;
PShape bolt;
PShape Is;
PShape rain;
PShape spark;







void setup(){
  size(480, 320); 
  smooth(); 






  m=loadShape("mouth.svg");
  Le=loadShape("Leye.svg");
  Re=loadShape("Reye.svg");
  Lp=loadShape("Lpupil.svg");
  Rp=loadShape("Rpupil.svg");
  Is=loadShape("Ismile.svg");
  bomb=loadShape("bomb.svg");
  ex=loadShape("mike.svg");
  bolt=loadShape("light.svg");

  /////clouds
  c1=loadShape("1.svg");
  c2=loadShape("2.svg");
  c3=loadShape("3.svg");
  c4=loadShape("4.svg");
  c5=loadShape("5.svg");
  c6=loadShape("6.svg");
  c7=loadShape("7.svg");
  c8=loadShape("8.svg");
  c9=loadShape("9.svg");
  c10=loadShape("10.svg");

  /////umbrella


  u1=loadShape("umbrella.svg");
  u2=loadShape("umbrella2.svg");
  u3=loadShape("umbrella3.svg");
  u4=loadShape("umbrella4.svg");
  u5=loadShape("umbrella5.svg");
  u6=loadShape("umbrella6.svg");
  u7=loadShape("umbrella7.svg");
  u8=loadShape("umbrella8.svg");
  u9=loadShape("umbrella9.svg");
  u10=loadShape("umbrella10.svg");
  u11=loadShape("umbrella11.svg");
  u12=loadShape("umbrella12.svg");
  u13=loadShape("umbrella13.svg");






  rain=loadShape("rain drop.svg");
  spark=loadShape("spark.svg");
  Ib=loadImage("egg.png");
  Ih=loadImage("hair.png");
  Ilf=loadImage("Lfoot.png");
  Irf=loadImage("Rfoot.png");
  Ile=loadImage("Leye.png");
  Ire=loadImage("Reye.png");
  ILl=loadImage("ILlid.png");
  IRl=loadImage("Rlid.png");
  Ibl=loadImage("blink.png");
  Iback=loadImage("back.png");
  brkn=loadImage("body2.png");
  shell=loadImage("shell.png");
  mach=loadImage("machine.png");



}

void draw(){

  float ml=millis();
  ///////keeping omar on screen///////


  if(mouseX < 100)
  {
    x = x + (100-x)*easing;
  }
  else if(mouseX > 380)
  {
    x = x + (380-x)*easing;
  }
  else{
    x = x + (mouseX-x)*easing;
  }

  background(200);





  /////////// Image sequence//////////////
  image(Iback,0,0); 

  /////shake hand
  if (mousePressed==true)
  {
    if ((mouseX >x+108) && (mouseX < x+135) && (mouseY>186) && (mouseY<200))
    {
      shake_hand = true;
    }

  }
  else{
    shake_hand = false;
  }     
  //Left Arm 
  fill(145,53,148); 
  stroke(202,136,58);
  strokeWeight(10);
  line(x-40,178,x-74,200);
  line(x-74,200,x-95,174); 


  strokeWeight(10);
  line(x+70,178,x+110,198);
  if(shake_hand)
  {
    angle = atan2(mouseY-198,mouseX-258);
    line(x+108,198,x+108+cos(angle)*24,198+sin(angle)*24);
  }
  else{
    line(x+108,198,x+132,200);
  }

  //////////Foot steps//////////

  if(right_step)
  {
    if(foot_y > 285)
    {
      right_step = false;
    }
    else{

      foot_y = foot_y + (abs(mouseX-x))*foot_easing;
    }
  }
  else{
    if(foot_y < 270)
    {
      right_step = true;
    }
    else{
      foot_y = foot_y - (abs(mouseX-x))*foot_easing;
    }
  }
  if(ml < 17999)
  {
    shellX = x-77;
  }
  if (ml<18000)
  {
    image(Ib, x-77 ,90);
    image(Ih,x-40,30);
    image(Ilf,x-58,555-foot_y);
    image(Irf,x+10,foot_y);
  }
  else
  {
    image(mach,x-77,90);
    pushMatrix();

/////////SPARKS//////////
    if(ml>27300 && ml<27550)
    {
    shape(spark,x+5,120);
    }
    if(ml>27500 && ml<27750)
    {
    shape(spark,x,90);
    }
    if(ml>27700 && ml<27900)
    {
    shape(spark,x+10,110);
    }
    if(ml>27775 && ml<28000)
    {
    shape(spark,x+20,125);
    }
    if(ml>28750 && ml<29000)
    {
    shape(spark,x+40,135);
    }
    if(ml>28250 && ml<29000)
    {
    shape(spark,x+30,115);
    }
    if(ml>28850 && ml<29200)
    {
    shape(spark,x+35,100);
    }
     if(ml>29100 && ml<29600)
    {
    shape(spark,x+20,125);
    }
     if(ml>29500 && ml<30000)
    {
    shape(spark,x+5,120);
    }
    if(ml>29950 && ml<30300)
    {
    shape(spark,x+35,100);
    }
    if(ml>30300 && ml<30700)
    {
    shape(spark,x,90);
    }
    if(ml>30370 && ml<30800)
    {
    shape(spark,x+10,110);
    }
    

    /////////umbrellla////////
    if(ml>28500 && ml <=31000)
    {
      umbY = umbY -.65;
      shape(u13,x-30,umbY);
    }
    if(ml > 30000 && ml <=30100)
    {
      shape(u13,x-30,umbY);
    }
    if(ml > 30100 && ml <=30200)
    {
      shape(u12,x-30,umbY);
    }
    if(ml > 30200 && ml <=30300)
    {
      shape(u11,x-30,umbY);
    }
    if(ml > 30300 && ml <=30400)
    {
      shape(u10,x-31,umbY);
    }
    if(ml > 30400 && ml <=30500)
    {
      shape(u9,x-31,umbY);
    }
    if(ml > 30500 && ml <=30600)
    {
      shape(u8,x-31,umbY);
    }
    if(ml > 30600 && ml <=30700)
    {
      shape(u7,x-31,umbY);
    }
    if(ml > 30700 && ml <=30800)
    {
      shape(u6,x-32,umbY);
    }
    if(ml > 30800 && ml <=30900)
    {
      shape(u5,x-35,umbY);
    }
    if(ml > 30900 && ml <=31000)
    {
      shape(u4,x-39,umbY);
    }
    if(ml > 31000 && ml <=31100)
    {
      shape(u3,x-48,umbY);
    }
    if(ml > 31100 && ml <=31200)
    {
      shape(u2,x-54,umbY);
    }
    if(ml > 31200)
    {
      shape(u1,x-60,umbY);
    }
    popMatrix();
    
    //////////AFTER EXPLOSION BODY//////////// 
    image(brkn,x-77,90);
    image(Ilf,x-58,555-foot_y);
    image(Irf,x+10,foot_y);
    
    
    

    if(shellY < 250)
    {

      shellX= shellX+1;
      shellY = shellY + shellY_change;
      shellY_change = shellY_change + 0.1;
    }

    image(shell,shellX,shellY);
    image(Ih,shellX+37,shellY-60);
  }

  if ((mouseX > x-35) && (mouseX < x+45) && (mouseY>65) && (mouseY<120)) {
    shape(Is,x-50,148);

  } 
  else {
    /////////////smile//////////////
    shape(m,x-25,232);
    shape(Le,x-37,150);
    shape(Re,x-9,148); 
    shape(Lp,x-26,172);
    shape(Rp,x-3,170); 
    image(ILl,x-45,148);
    image(IRl,x-10,138);

  }
  if (ml>18000)
  {
    image(shell,shellX,shellY);
    image(Ih,shellX+37,shellY-60);
  }

  if(mousePressed == true && !(shake_hand) && !((mouseX >258) && (mouseX < x+108) && (mouseY>x+36) && (mouseY<200)))  
  { 
    image(Ibl,x-41,140);
  }
  // BLUSHING
  noStroke();
  float target = dist(mouseX, mouseY, pmouseX, pmouseY);
  speed += (target - speed) * .5;
  fill(x+87,119,173,speed);
  ellipse(x-37,213,20,30);
  ellipse(x+30,213,20,30);

  /////////////rain//////////////

  if(ml > 27000)
  {
    dropY=dropY+1;
    if(dropY > 320)
    {
      dropX = random(20,460);
      dropY=-20;
    }
    shape(rain,dropX,dropY);

    dropY2=dropY2+1.25;
    if(dropY2==320)
    {
      dropX2=random(240,460);
      dropY2 = -100;
    }
    shape(rain,dropX2,dropY2);

    dropY3=dropY3+1.5;
    if(dropY3 > 320)
    {
      dropX3 = random(20,460);
      dropY3=-20;
    }
    shape(rain,dropX3,dropY3);

    dropY4=dropY4+1.5;
    if(dropY4 > 320)
    {
      dropX4 = random(20,460);
      dropY4=-20;
    }
    shape(rain,dropX4,dropY4);

    dropY5=dropY5+1.75;
    if(dropY5 > 320)
    {
      dropX5 = random(20,460);
      dropY5=-20;
    }
    shape(rain,dropX5,dropY5);

    dropY6=dropY6+2;
    if(dropY6 > 320)
    {
      dropX6 = random(20,460);
      dropY6=-20;
    }
    shape(rain,dropX6,dropY6);

    dropY7=dropY7+2.25;
    if(dropY7 > 320)
    {
      dropX7 = random(20,460);
      dropY7=-20;
    }
    shape(rain,dropX7,dropY7);

    dropY8=dropY8+2.5;
    if(dropY8 > 320)
    {
      dropX8 = random(20,460);
      dropY8=-20;
    }
    shape(rain,dropX8,dropY8);

    dropY9=dropY9+2.75;
    if(dropY9 > 320)
    {
      dropX9 = random(20,460);
      dropY9=-20;
    }
    shape(rain,dropX9,dropY9);

    dropY10=dropY10+3;
    if(dropY10 > 320)
    {
      dropX10 = random(20,460);
      dropY10=-20;
    }
    shape(rain,dropX10,dropY10);

    dropY11=dropY11+3.35;
    if(dropY11 > 320)
    {
      dropX11 = random(20,460);
      dropY11=-20;
    }
    shape(rain,dropX11,dropY11);

    dropY12=dropY12+3.5;
    if(dropY12 > 320)
    {
      dropX12 = random(20,460);
      dropY12=-20;
    }
    shape(rain,dropX12,dropY12);

    dropY13=dropY13+3.75;
    if(dropY13 > 320)
    {
      dropX13 = random(20,460);
      dropY13=-20;
    }
    shape(rain,dropX13,dropY13);

    dropY14=dropY14+4;
    if(dropY14 > 320)
    {
      dropX14 = random(20,460);
      dropY14=-20;
    }
    shape(rain,dropX14,dropY14);

    dropY15=dropY15+4.25;
    if(dropY15 > 320)
    {
      dropX15 = random(20,460);
      dropY15=-20;
    }
    shape(rain,dropX15,dropY15);

    ///////lightning////////   
    if(mousePressed)
    {
      fill(11,23,81,60);
      rect(0,0,480,320);
      lightning = true;
      lightningX = random(20,460);
      lightningY = -270;
    }
    if(lightning)
    {
      if(lightningY > 0)
      {
        lightning = false;
      }
      else{
        fill(11,23,81,60);
        rect(0,0,480,320);
        lightningY = lightningY + 30;
        shape(bolt,lightningX,lightningY);
      }
    }
  }

  /////////BOMB///////////////
  pushMatrix();
  if(ml>7000 && ml< 13000)
  {
    shape(bomb,bombX,250);
    bombX= bombX+1;
  }
  else if(ml>13000 && ml<=15000)
  {
    shape(bomb, bombX,250);
  }
  if(ml>15000 && ml<=17000)
  { 
    if(bomb_shake)
    {
      if(bombX > 262)
      {
        bomb_shake = false;
      }
      else{
        bombX = bombX + 2;
      }
    }
    else{
      if(bombX < 258)
      {
        bomb_shake = true;
      }
      else{
        bombX = bombX - 2;
      }
    }
    shape(bomb, bombX,250);
  }
  if(ml>17000 && ml <=18000)
  {
    ex_scale = (ml-17000)/1000;
    translate(90+208*(1-ex_scale),65+223*(1-ex_scale));
    scale(ex_scale);
    shape(ex,0,0);

  }

  popMatrix();
  pushMatrix();
  if(ml>18000 && ml <=19000)
  {
    ex_scale = (ml-18000)/1000;
    translate(90+208*(ex_scale),65+223*(ex_scale));
    scale(1-ex_scale);
    shape(ex,0,0);

  }
  popMatrix();

  ///////CLOUDS///////////
  if(ml>16000)
  {
    if(cloudX < 0)
    {
      cloudX = cloudX+ 1;  
      cloudX2 = cloudX2-1;
    }
    shape(c2,cloudX-20,-60);
    shape(c1,cloudX-50,-4);
    shape(c3,cloudX+110,-4);
    shape(c4,cloudX+120,-20);
    shape(c5,cloudX+190,-32);
    shape(c6,cloudX2+220,-37);
    shape(c7,cloudX2+280,-30);
    shape(c9,cloudX2+363,-13);
    shape(c8,cloudX2+378,-40);
    shape(c10,cloudX2+392,11);

  }






}


