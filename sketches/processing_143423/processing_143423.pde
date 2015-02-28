
float posicio=1;


void setup(){
size(1000, 700);
 print("MARC ALONSO - 20N GEDI - GRUP1 - INFORMÀTICA");

}

void draw(){
  
  background(100-mouseX/5,200-mouseX/5,255-mouseX/5);
  noStroke();

  //nuvols
  
  posicio=posicio+1;
fill(255-mouseY/5);
ellipse(-500+posicio+300,40,400,50);
ellipse(-900+posicio+300,100,300,60);
ellipse(-600+posicio+300,300,500,60);
  
 
  float A=mouseX-250;
  float B=mouseY-150;


//MARIO
  //gorra
fill(255,3,3);
rect(150+A,30+B,150,30);
rect(120+A, 60+B, 270, 30);

  //cara
fill(233,162,74);
beginShape();
vertex(120+A,90+B);
vertex(120+A,180+B);
vertex(150+A,180+B);
vertex(150+A,240+B);
vertex(360+A,240+B);
vertex(360+A,180+B);
vertex(420+A,180+B);
vertex(420+A,150+B);
vertex(390+A,150+B);
vertex(390+A,120+B);
vertex(330+A,120+B);
vertex(330+A,90+B);
vertex(120+A,90+B);
endShape();

  //cabell
fill(97,35,14);
rect(90+A,120+B,30,90);
rect(120+A,180+B,30,30);
rect(120+A,90+B,90,30);
rect(150+A,120+B,30,30);
rect(150+A,150+B,60,30);

  //bigoti
fill(97,35,14);
rect(300+A,150+B,30,30);
rect(270+A,180+B,120,30);

  //ull
fill(0);
rect(270+A,90+B,30,60);

 //jersei vermell
fill(255,3,3);
rect(120+A,240+B,180,30);
rect(90+A,270+B,300,30);
rect(60+A,300+B,360,30);
rect(60+A,330+B,360,30);

  //pants blaus
fill(14,68,128);
rect(150+A,330+B,180,60);
rect(210+A,300+B,60,30);
rect(120+A,390+B,240,30);
rect(180+A,240+B,30,90);
rect(270+A,270+B,30,60);
rect(120+A,420+B,90,30);
rect(270+A,420+B,90,30);

   //botons grocs
fill(250,253,24);
rect(180+A,330+B,30,30);
rect(270+A,330+B,30,30);

  //sabates
fill(97,35,14);
rect(90+A,450+B,90,60);
rect(60+A,480+B,30,30);
rect(300+A,450+B,90,60);
rect(390+A,480+B,30,30);

  //mans
fill(233,162,74);
rect(60+A,330+B,60,90);
rect(120+A,360+B,30,30);
rect(330+A,360+B,30,30);
rect(360+A,330+B,60,90);


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
  
 
noCursor();
}




