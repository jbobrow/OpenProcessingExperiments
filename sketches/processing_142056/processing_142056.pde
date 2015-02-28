
size(1000, 700);

background(100,200,255);

noStroke();

//nuvols
fill(255);
ellipse(500,40,400,50);
ellipse(900,100,300,60);
ellipse(600,300,500,60);

//MARIO
  //gorra
fill(255,3,3);
rect(150,30,150,30);

rect(120, 60, 270, 30);

  //cara
fill(233,162,74);
rect(90,90,330,150);

  //cabell
fill(97,35,14);
rect(90,90,120,120);

  //cara2
fill(233,162,74);
rect(120,120,30,60);
rect(180,120,30,30);
rect(150,180,60,30);

  //bigoti
fill(97,35,14);
rect(300,150,30,30);
rect(270,180,120,30);

  //ull
fill(0);
rect(270,90,30,60);

  //blanc tapa cara
fill(100,200,255);
rect(90,90,30,30);
rect(90,210,60,30);
rect(330,90,90,30);
rect(390,120,30,30);
rect(390,180,30,30);
rect(360,210,60,30);

  //jersei vermell
fill(255,3,3);
rect(120,240,180,30);
rect(90,270,300,30);
rect(60,300,360,30);
rect(60,330,360,30);

  //pants blaus
fill(14,68,128);
rect(150,330,180,60);
rect(120,390,240,60);
rect(180,240,30,90);
rect(270,270,30,60);
rect(210,300,60,30);
fill(100,200,255);
rect(210,420,60,30);

   //botons grocs
fill(250,253,24);
rect(180,330,30,30);
rect(270,330,30,30);

  //sabates
fill(97,35,14);
rect(60,450,360,60);
fill(100,200,255);
rect(60,450,30,30);
rect(390,450,30,30);
rect(180,450,120,60);

  //mans
fill(233,162,74);
rect(60,330,60,90);
rect(120,360,30,30);
rect(330,360,30,30);
rect(360,330,60,90);




stroke(0);

//canonada verda
strokeWeight(2);
fill(0,215,100);
rect(600,200,250,50);
rect(620,250,210,260);

//base
strokeWeight(5);
fill(150);
rect(0,510,200,100);
rect(0+200,510,200,100);
rect(0+400,510,200,100);
rect(0+600,510,200,100);
rect(0+800,510,200,100);

rect(-100,610,200,100);
rect(-100+200,610,200,100);
rect(-100+400,610,200,100);
rect(-100+600,610,200,100);
rect(-100+800,610,200,100);
rect(-100+1000,610,200,100);

//moneda estrella
noStroke();
fill(180,180,0);
ellipse(725,100,160,160);
fill(220,220,0);
ellipse(725,100,155,155);
fill(200,200,0);
ellipse(725,100,145,145);
fill(250,250,0);
ellipse(725,100,140,140);

//estrella
stroke(180,180,0);
fill(220,220,0);

//el codi següent que dibuixa l'estrella ha estat extret d'un fórum,
//no l'he creat jo, però l'he hagut d'entendre per modificar-lo.

float xpos; 
float ypos;
int sz;

smooth();
  xpos =725;
  ypos = 93;
  sz = width/8;

  beginShape();
  vertex(xpos,ypos-sz/2);
  vertex(xpos+sz/6,ypos-sz/6);
  vertex(xpos+sz/2,ypos-sz/11);
  vertex(xpos +sz/4,ypos+sz/8);
  vertex(xpos+sz/3,ypos+sz/2);
  vertex(xpos,ypos+sz/3);
  vertex(xpos-sz/3,ypos+sz/2);
  vertex(xpos-sz/4,ypos+sz/6);
  vertex(xpos-sz/2,ypos-sz/9);
  vertex(xpos-sz/6,ypos-sz/6);
  endShape(CLOSE);
  
  
  
 print("MARC ALONSO - 20N GEDI - GRUP1 - INFORMÀTICA");


