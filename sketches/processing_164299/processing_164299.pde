

//Dibuix animat - Kukuxumusu. La versió original conté una imatge de fons amb el logo de la marca i dues mosques penjant d'un fil.
size (1400,1000);
background(#B82A25);

//Marc-decoració dels marges
for (int i=0;i<15;i++)
{
  float a=random (0, height);
  float b=random (0, height);
  float c=random (0, height);
  float d=random (0, height);
  
  noStroke();
  
  fill(255);
  ellipse(10, a, 5, 5);
  ellipse(1360, a, 5, 5);
  
  fill(#FFCF31);
  ellipse(10, b, 5, 5);
  ellipse(1360, b, 5, 5);

  fill(39,93,167);
  ellipse(10, c, 5, 5);
  ellipse(1360, c, 5, 5);
  
  fill(0);
  ellipse(10, d, 5, 5);
  ellipse(1360, d, 5, 5);
} 

//VACA
  //cara de la vaca  
  
      noStroke();
      fill (39,93,167);
      beginShape();
        vertex(880,460);
        vertex(900,750);
        vertex(575,750);
        vertex(600,620);
        vertex(574,750);
        vertex(540,535);
        vertex(585,405);
      endShape(CLOSE);
  
  //cos de la vaca
      rect (575,750,325,250); 
  
  strokeWeight (14);
  stroke (0);
  
      bezier (495,450,380,470,430,630,540,535); //orella esquerra
      bezier (905,380,1035,340,1035,520,885,460); //orella dreta 
      bezier (879,460,980,600,1000,700,899,750); //galta dreta
      bezier (900,750,800,800,620,840,575,750); //galta esuqerra
      bezier (575,750,540,700,535,650,540,535);
      bezier (575,750,550,700,565,640,601,620); //somriure
      
    noFill();
  
  noStroke();
    fill (#FFCF31);
      beginShape(); //interior dels ullals
        vertex(525,375);
        vertex(500,435);
        vertex(450,350);
      endShape(CLOSE);
  
      beginShape(); 
        vertex(900,380);
        vertex(860,315);
        vertex(920,300);
      endShape(CLOSE);
  
  strokeWeight (14);
  stroke (0);  
  
    fill(#FFCF31);  // ullal esquerra
      bezier (500,200,370,180,350,410,500,435);
    fill (#B82A25);
      bezier (525,375,450,350,450,250,500,200);
    noFill();
  
    fill(#FFCF31);  // ullal dret
      bezier (900,380,1050,280,970,50,800,120);
    fill (#B82A25);
      bezier (860,315,920,250,920,150,800,120);
    noFill();
      
      line (620,700,655,745); //nas esquerre
      line (875,640,860,700); //nas dret
  
    fill(255);
      ellipse (600,450,200,200); //ull esquerre vaca
      ellipse (800,400,200,200); // ull dret vaca
  
    noFill();
    
  //cos de la vaca
  strokeWeight(14);
  stroke(0);
  
      line (575,750,575,1000); 
      line (900,750,900,1000);
      
      bezier (900,750,990,800,1100,750,1130,670); // braç dret
      bezier (575,750,500,820,400,830,320,800); //braç esquerre
      
    fill (39,93,167);
    
      ellipse (1140,650,45,45); //ma dreta
      ellipse (295,795,45,45);
      
//ESTRELLA DE FONS 
  stroke(#FFAD31);
      line (610,120,620,180);
      line (680,130,660,179);
      line (670,210,725,210);
      line (663,245,700,280);
      line (630,250,623,310);
      line (608,240,550,265);
      line (550,180,600,208);
      
float c=random (1, 5);
println(c);
if (c<3)
{
    fill(39,93,167);
    ellipse (585,405,30,30); //iris esquerre vaca
    ellipse (789,355,30,30); //iris dret vaca
    noFill();
    println("Tinc miopia i necessito portar ulleres, pero sóc pobre i no en tinc ni per menjar");}
    
    else{
      if(c==3) 
      {
    fill(0);
    ellipse (585,405,50,50); //iris esquerre vaca
    ellipse (789,355,50,50); //iris dret vaca
    noFill();
    println("DIOS TE BENDIGA. HOY TE SALVAS DE MI MALDICIÓN");
      }
      else {
        fill(#B82A25);
    ellipse (585,405,50,50); //iris esquerre vaca
    ellipse (789,355,50,50); //iris dret vaca
    noFill();
    println("Tinc molta gana, em menjaré totes les mosques que trobi");
      }
    }

