

void setup (){
  size (600,600);
  background (10,63,122);
}

void draw (){
 //la base de la cara
  fill (224,195,158);
  rect (100,100,400,400);
  stroke (224,195,158);
  fill (224,195,158);
  ellipse (100,300,35,400);
  ellipse (500,300,35,400);
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
   ellipse (180,250,30,30);
   ellipse (380,250,30,30);
   fill(255,255,255);
   stroke(255,255,255);
   ellipse (180,250,10,10);
   ellipse (380,250,10,10);
   
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
    rect (145,250,110,50);
    rect (345,250,110,50);
    stroke(0,0,0);
    line (255,275,285,260);
    line (345,275,315,260);
    line (315,260,285,260);
    line (145,275,80,186);
    line (455,275,520,186);
    
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


