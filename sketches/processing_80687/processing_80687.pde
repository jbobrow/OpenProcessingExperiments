

void setup()
  {
    size(800,500);
    smooth();
    noStroke();
  }

void draw()
  {
  
    beginShape();         // vertex() siempre comienza con beginShape() y termina con endShape()
      fill(#66CCFF);      //formato Hexadecimal para el color;
      vertex(0,0);
      vertex(800,0);
      vertex(800,200);
      vertex(0,200);
    endShape();
  
    beginShape();
      fill(#99CCFF);
      vertex(0,200);
      vertex(800,200);
      vertex(800,230);
      vertex(0,230);
    endShape();
  
    beginShape();
      fill(#88DDFF);
      vertex(0,230);
      vertex(800,230);
      vertex(800,260);
      vertex(0,260);
    endShape();
  
    fill(#008000);
    bezier(0,230,100,50,150,100,300,230);
    bezier(250,230,180,150,300,150,480,280);
    
    fill(#492525);
    bezier(400,260,700,50,500,50,800,260);
    
    beginShape();
      fill(#114F15);
      vertex(0,230);
      vertex(355,230);
      vertex(400,260);
      vertex(0,260);
    endShape();
  
    
    bezier (300,300,450,100,450,100, 600,300);
    
    fill(#463802);
    bezier(0,200,-200,200,150,50,300,300);
    
    beginShape();
      fill(#115F15);
      vertex(0,260);
      vertex(800,260);
      vertex(800,290);
      vertex(0,290);
    endShape();
    
    bezier(0,230,-50,100,450,300,250,300);
   
   
    beginShape();
      fill(#DCBB28);
      vertex(0,290);
      vertex(800,290);
      vertex(800,320);
      vertex(0,320);
    endShape();
     
     fill(255);
     bezier(0,317,300,298,450,298,800,317);
    
     fill(#0C2589);
     bezier(0,320,300,300,450,300,800,320);
  
    beginShape();
      fill(#0C2589);
      vertex(0,320);
      vertex(800,320);
      vertex(800,500);
      vertex(0,500);
    endShape();         
  
    fill(#AF8F0E);
    bezier(400,450,800,300,550,300,800,430);
   
    fill(#957A0E);
    bezier(400,450,800,310,550,310,800,430);
  
   beginShape();
      fill(#793A0D);
      vertex(750,440);
      vertex(800,400);
      vertex(800,450);
      vertex(750,450);
    endShape();
    
    beginShape();
      vertex(0,350);
      vertex(400,500);
      vertex(400,500);
      vertex(0,500);
    endShape();
    
    beginShape();
      vertex(500,500);
      vertex(800,350);
      vertex(800,350);
      vertex(800,500);
    endShape();
    
    bezier(0,351,150,350,150,310,400,501);
    bezier(501,501,250,410,650,410,800,350);
    
    fill(#957A0E);
    bezier(300,500,400,410,400,410,600,500);
  }


