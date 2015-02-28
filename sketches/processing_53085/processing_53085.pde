
PImage diecoco;
PImage dieleon;
PImage diecarna;
PImage diegla;
PImage diecata;
PImage dieparaca;
PImage dieparis;
PImage dierepre;
PImage diefiesta;
PImage dieplaya;
PImage dievolcan;
PImage dieamazo;
PImage diedesi;
PImage diemachu;
PImage diebuzo;
PImage dieguerra;
PImage diecoli;
PImage dieafrica;
PImage diestone;
PImage portada;
 
void setup()
{
  size(1000, 600);
   diecoco = loadImage("diegococodrilo.jpg");
  dieleon = loadImage("diegoconeleo.jpg");
  diecarna = loadImage("diegocrnaval.jpg");
 diegla = loadImage("diegoenglaciar.jpg");
  diecata = loadImage("diegoenlascataratas.jpg");
 dieparaca = loadImage("diegoenparacaidasz.jpg");
  dieparis = loadImage("diegoenparis.jpg");
  dierepre = loadImage("diegoenrepresion.jpg");
  diefiesta = loadImage("diegofiesta.jpg");
  dieplaya = loadImage("diegoplaya.jpg");
  dievolcan = loadImage("diegovolcan.jpg");
  dieamazo = loadImage("dieguitoamazonas.jpg");
  diedesi = loadImage("dieguitodesierto.jpg");
  diemachu = loadImage("dieguitomachupichu.jpg");
  diebuzo = loadImage("dieguitobuzo.jpg");
  diecoli = loadImage("dieguitocoliseo.jpg");
  dieafrica = loadImage("dieguitoenafrica.jpg");
  dieguerra = loadImage("dieguitoenlaguerra.png");
  diestone = loadImage("dieguitoenstone.jpg");
  portada= loadImage("portada.jpg");
  
  
 
  smooth();
  imageMode(CENTER);
  noStroke();
  noFill();
}
 
void draw()
{
  if (mouseX <= 60)
  {background(0);
    image (dieleon, width/2, height/2,1000,600);
    
   
  }
  else if ((mouseX > 60) && (mouseX <=120))
  {background(0);
    image (diecarna, width/2, height/2,1000,600);
    
  }
  else if ((mouseX > 120) && (mouseX <=180))
  {background(0);
     image (diegla, width/2, height/2,1000,600);
   
}
  else if ((mouseX > 180) && (mouseX <=240))
  {background(0);
     image (diecata, width/2, height/2,1000,600);
    
}
  else if ((mouseX > 240) && (mouseX <=300))
  {background(0);
     image (dieparaca, width/2, height/2,1000,600);
   
}
  else if ((mouseX > 300) && (mouseX <=360))
  {background(0);
    image (dieparis, width/2, height/2,1000,600);
   
}
  else if ((mouseX > 360) && (mouseX <=420))
  {background(0);
    image (dierepre, width/2, height/2,1000,600);
    
}
  else if ((mouseX > 420) && (mouseX <=480))
  {background(0);
     image (diefiesta, width/2, height/2,1000,600);
    
}
  else if((mouseX >480)&&(mouseX <=540))
  {background(0);
     image (dieplaya, width/2, height/2,1000,600);
    
}
else if ((mouseX > 540) && (mouseX <=600))
  {background(0);
     image (dievolcan, width/2, height/2,1000,600);
    
}
else if ((mouseX >600) && (mouseX <=640))
  {background(0);
     image (dieamazo, width/2, height/2,1000,600);
    
}
else if ((mouseX >640) && (mouseX <=700))
  {background(0);
    image (diedesi, width/2, height/2,1000,600);
    
}
else if ((mouseX > 700) && (mouseX <=760))
  {background(0);
    image (diemachu, width/2, height/2,1000,600);
    
}
else if ((mouseX >760) && (mouseX <=820))
  {background(0);
   image (diebuzo, width/2, height/2,1000,600);
    
}
else if ((mouseX > 820) && (mouseX <=880))
  {background(0);
   image (dieguerra, width/2, height/2,1000,600);
   
  }
    else if ((mouseX >880) && (mouseX <=920))
  {background(0);
    image (diecoli, width/2, height/2,1000,600);
    
}
 else if ((mouseX >920) && (mouseX <=960))
  {background(0);
    image (dieafrica, width/2, height/2,1000,600);
    
}
else if ((mouseX >960) && (mouseX <=980))
  {background(0);
    image (diestone, width/2, height/2,1000,600);
    
}
else if ((mouseX >980) && (mouseX <=1000))
  {background(0);
    image (diecoco, width/2, height/2,1000,600);

}
if (mousePressed){
  background(0);
  image(portada,width/2,height/2);}
  
}


