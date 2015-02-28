
int posx1=180; //variables per el moviment dels ulls
int posx2=380;
int posy1=250; //variables per el moviment de les ulleres
int posy2=225;
int posy3=235;
int posz1=400; //variables per el moviment del cotxe
int posz2=450;
int posz3=425;
int posz4=325;
int posz5=335;
int posz6=290;


void setup (){
  size (800,800);
  background (10,63,122);
}

void draw (){
 
  
  //cotxe
  fill (255,255,255);
  stroke (255,255,255);
  
  rect (640,posz1,140,50);
   if (posz1<=450&&posz1>=225)
     posz1=posz1-1;
  fill(#308446);
  stroke(#308446);
  triangle (640,posz1,630,posz2,640,posz2);
  triangle (780,posz1,790,posz2,780,posz2);
  rect (650,posz4,120,75);
  if (posz4<=325&&posz4>=150)
    posz4=posz4-1;
  fill (168,168,168);
  stroke (168,168,168);
  rect (660,posz5,100,55);
  if (posz5<=335&&posz5>=160)
    posz5=posz5-1;
  fill (#000080);
  stroke (#000080);
  if (keyPressed) {
    fill (255,0,0);
    stroke (255,0,0);
  }
  rect (670,posz6,30,35);
  if (posz6<=300&&posz6>=115)
    posz6=posz6-1;
  fill (255,0,0);
  stroke (255,0,0);
  if (keyPressed){
    fill (#000080);
    stroke (#000080);
  }
  rect (720,posz6,30,35);
      
  
  
  
  fill (#1E1E1E);
  stroke (#1E1E1E);
  rect (635,450,15,25);
  rect (770,450,15,25);  
  if (keyPressed) {
    fill (#FAD201);
  }else {
    fill(#9E9764);
  }
  ellipse (670,posz3,20,20);
  ellipse (750,posz3,20,20);
  if (posz3<=425&&posz3>=250)
    posz3=posz3-1;
  
  
  
  //fondo
  
  fill(#35682D);
  stroke (#35682D);
  rect (0,300,800,500);
  fill (#1E1E1E);
  stroke (#1E1E1E);
  rect (620,300,180,500);
  fill (255,255,255);
  stroke (255,255,255);
  rect (705,310,10,25);
  rect (705,345,10,25);
  rect (705,380,10,25);
  rect (705,415,10,25);
  rect (705,450,10,25);
  rect (705,485,10,25);
  rect (705,520,10,25);
  rect (705,555,10,25);
  rect (705,590,10,25);
  rect (705,625,10,25);
  rect (705,660,10,25);
  rect (705,695,10,25);
  rect (705,730,10,25);
  rect (705,765,10,25);
  rect (705,800,10,25);
  
 
 //la base de la cara
  fill (224,195,158);
  rect (100,100,400,400);
  stroke (224,195,158);
  fill (224,195,158);
  ellipse (100,300,35,400);
  ellipse (500,300,35,400);
  
  //samarreta
  fill(0);
  stroke (0);  
  rect (100,580,400,240);  
  fill (255,0,0);
  stroke(255,0,0);
  triangle (100,580,0,600,100,600);
  triangle (500,580,600,600,500,600);
  rect (0,600,100,200);
  rect (500,600,100,200);
 
  fill(224,195,158);
  stroke (224,195,158);
  ellipse (300,600,200,50);
  
  stroke (#4C280F);
  fill (#4C280F);
  triangle (100,500,250,500,250,580);
  triangle (500,500,350,500,350,580);
  ellipse (300,580,100,15);
  rect (250,500,100,80);
  
 //boina
  fill (0,0,0);
  stroke (0,0,0);
  ellipse (300,100,425,150);
  fill(255,0,0);
  stroke (255,0,0);
  rect (295,65,10,35);
  
 //orelles
  stroke (224,195,158);
  fill (224,195,158);
  ellipse (100,250,85,125);
  ellipse (500,250,85,125);
    
 //ulls
   fill (255,255,255);
   stroke (255,255,255);
   ellipse (200,250,100,60);
   ellipse (400,250,100,60);
   fill(#8B4513);
   stroke (#8B4513);
   ellipse (posx1,250,30,30);
   ellipse (posx2,250,30,30);
   fill(255,255,255);
   stroke(255,255,255);
   ellipse (posx1,250,10,10);
   ellipse (posx2,250,10,10);
   if (posx1>=180&&posx1<=230)
     posx1=posx1+1;
   if (posx2>=380&&posx2<=430)
     posx2=posx2+1;
   
   
 //nas
   stroke (0,0,0);
   line (275,225,260,375);
   line (325,225,340,375);
   fill (0,0,0);
   ellipse (280,375,15,10);
   ellipse (320,375,15,10);
   
  //ulleres
    stroke (#B5A80C );
    fill(#B5A80C );
    rect (145,posy2,110,50);
    rect (345,posy2,110,50);
    stroke(0,0,0);
    line (255,posy1,285,posy3);
    line (345,posy1,315,posy3);
    line (315,posy3,285,posy3);
    line (145,posy1,80,186);
    line (455,posy1,520,186);
    if (posy1>=250&&posy1<=275)
    posy1=posy1+1;
    if (posy2>=225&&posy2<=250)
    posy2=posy2+1;
    if (posy3>=235&&posy3<=260)
    posy3=posy3+1;
    
  //celles       
    line (200,190,250,210);
    line (200,189,250,209);
    line (400,190,350,210);
    line (400,189,350,209);
    line (270,190,285,220);
    line (330,190,315,220);   
    
    //boca
    stroke(#F4A460);
    fill (#F4A460);
    ellipse (300,475,200,25);
    triangle (200,475,250,455,300,462);
    triangle (400,475,350,455,300,462);
   
    //barba
    fill (#4C280F);
    stroke (#4C280F);
    ellipse (95,400,40,200);
    triangle ( 90,500,90,300,200,500);
    rect (250,400,100,40);
    triangle (250,400,250,440,100,440);
    ellipse ( 505,400,40,200);
    triangle (510,500,510,300,400,500);
    triangle (350,400,350,440,500,440);
    
}
    
void mousePressed (){
  
  if (posx1==180)
    posx1=posx1+1;
       
}
    
  
  
  
  
  



