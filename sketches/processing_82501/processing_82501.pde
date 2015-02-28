


// Variables globales et declarations globales: 
  PImage rubanHaut,rubanMilieu,rubanBas,imageATrouver,image01,image02,image03,image04,image05,image06,buffer;
  boolean [] tabHaut = {false,false,false};
  boolean [] tabMilieu = {false,false,false};
  boolean [] tabBas = {false,false,false};
  boolean [] tabImagesPrises = {false,false,false,false,false,false,false};
  int rand;
  

void setup()
{
  
  size(600,600);
  smooth();
  imageMode(CORNER);
  rubanHaut = loadImage("ruban.jpg");
  rubanMilieu = loadImage("ruban2.jpg");
  rubanBas = loadImage("ruban3.jpg");
  buffer = loadImage("buff.jpg");
  initRuban();
}

void draw()
{
  
image(rubanHaut, 0, 200);
image(rubanMilieu, 0 , 200);
image(rubanBas, 0, 400); 
}



void initRuban()
{
 
  rand = (int)random(7);
  imageATrouver = loadImage("chateau00"+(rand+1)+".jpg");
  tabImagesPrises[rand] = true;
  

  rand = (int)random(7);
  while (tabImagesPrises[rand])
  {
    rand = (int)random(7);
  }
  tabImagesPrises[rand] = true;
  image01 = loadImage("chateau00"+(rand+1)+".jpg");
  
  
  rand = (int)random(7);
  while (tabImagesPrises[rand])
  {
    rand = (int)random(7);
  }
  tabImagesPrises[rand] = true;
  image02 = loadImage("chateau00"+(rand+1)+".jpg");
  
   //image(image02,1200,0);
    
  rand = (int)random(7);
  while (tabImagesPrises[rand])
  {
    rand = (int)random(7);
  }
  tabImagesPrises[rand] = true;
  image03 = loadImage("chateau00"+(rand+1)+".jpg");
  
  rand = (int)random(7);
  while (tabImagesPrises[rand])
  {
    rand = (int)random(7);
  }
  tabImagesPrises[rand] = true;
  image04 = loadImage("chateau00"+(rand+1)+".jpg");
  
  
  rand = (int)random(7);
  while (tabImagesPrises[rand])
  {
    rand = (int)random(7);
  }
  tabImagesPrises[rand] = true;
  image05 = loadImage("chateau00"+(rand+1)+".jpg");
  
  
  rand = (int)random(7);
  while (tabImagesPrises[rand])
  {
    rand = (int)random(7);
  }
  tabImagesPrises[rand] = true;
  image06 = loadImage("chateau00"+(rand+1)+".jpg");
  
   // image(image06,0,0);
 
  
  // IMAGES INITIALISéS==========================================================================
  
  
  rand = (int)random(3);
  rubanHaut.copy(imageATrouver, 0, 0, imageATrouver.width, imageATrouver.height/3, imageATrouver.width*rand, 0, imageATrouver.width, imageATrouver.height/3);
  tabHaut[rand]=true;

  rand = (int)random(3);
  while (tabHaut[rand])
  {
    rand = (int)random(3);
  }
  rubanMilieu.copy(imageATrouver, 0, imageATrouver.height/3, imageATrouver.width, imageATrouver.height/3, imageATrouver.width*rand, 0, imageATrouver.width, imageATrouver.height/3);
  tabMilieu[rand]=true;
  
  rand = (int)random(3);
  while (tabHaut[rand]&&tabMilieu[rand])
  {
    rand = (int)random(3);
  }
  rubanBas.copy(imageATrouver, 0, 400, imageATrouver.width, imageATrouver.height/3, imageATrouver.width*rand, 0, imageATrouver.width, imageATrouver.height/3);
  tabBas[rand]=true;
  
  // IMAGE A TROUVER CACHéE ==============================================================================
  
  

  
  
  rand = (int)random(3);
  while (tabHaut[rand])
  {
    rand = (int)random(3);
  }
  tabHaut[rand] = true;
  rubanHaut.copy(image01, 0, 0, imageATrouver.width, imageATrouver.height/3, imageATrouver.width*rand, 0, imageATrouver.width, imageATrouver.height/3);
  
  rand = (int)random(3);
  while (tabHaut[rand])
  {
    rand = (int)random(3);
  }
  tabHaut[rand] = true;
  rubanHaut.copy(image02, 0, 0, imageATrouver.width, imageATrouver.height/3, imageATrouver.width*rand, 0, imageATrouver.width, imageATrouver.height/3);
  image(rubanHaut, 0, 0);
  
  rand = (int)random(3);
  while (tabMilieu[rand])
  {
    rand = (int)random(3);
  }
  tabMilieu[rand] = true;
  rubanMilieu.copy(image03, 0, imageATrouver.height/3, imageATrouver.width, imageATrouver.height/3, imageATrouver.width*rand, 0, imageATrouver.width, imageATrouver.height/3);
  
  
  rand = (int)random(3);
  while (tabMilieu[rand])
  {
    rand = (int)random(3);
  }
  tabMilieu[rand] = true;  
  rubanMilieu.copy(image04, 0, imageATrouver.height/3, imageATrouver.width, imageATrouver.height/3, imageATrouver.width*rand, 0, imageATrouver.width, imageATrouver.height/3);

  
  rand = (int)random(3);
  while (tabBas[rand])
  {
    rand = (int)random(3);
  }
  tabBas[rand] = true;
  rubanBas.copy(image05, 0, 2*imageATrouver.height/3, imageATrouver.width, imageATrouver.height/3, imageATrouver.width*rand, 0, imageATrouver.width, imageATrouver.height/3);
  
  
  rand = (int)random(3);
  while (tabBas[rand])
  {
    rand = (int)random(3);
  }
  tabBas[rand] = true;
  rubanBas.copy(image06, 0, 2*imageATrouver.height/3, imageATrouver.width, imageATrouver.height/3, imageATrouver.width*rand, 0, imageATrouver.width, imageATrouver.height/3);





}
 
 
 
 
 
 //GESTION DE LA SOURIS ==================================================================================================================================================
void mousePressed()
{
  
    if (mouseY<200)
    {
      if (mouseX<(width/2))
      {
        print("Haut Gauche");
        buffer.copy(rubanHaut, 0,0, rubanHaut.width/3,rubanHaut.height, 0,0, rubanHaut.width/3,rubanHaut.height);
        rubanHaut.copy(rubanHaut, 600,0, rubanHaut.width/3,rubanHaut.height, 0,0, rubanHaut.width/3,rubanHaut.height);
        rubanHaut.copy(rubanHaut, 1200,0, rubanHaut.width/3,rubanHaut.height, 600,0, rubanHaut.width/3,rubanHaut.height);
        rubanHaut.copy(buffer, 0,0, 600,200, 1200,0, 600,200);
      } 
      else
      {
        buffer.copy(rubanHaut, 1200,0, rubanHaut.width/3,rubanHaut.height, 0,0, rubanHaut.width/3,rubanHaut.height);
        rubanHaut.copy(rubanHaut, 600,0, rubanHaut.width/3,rubanHaut.height, 1200,0, rubanHaut.width/3,rubanHaut.height);
        rubanHaut.copy(rubanHaut, 0,0, rubanHaut.width/3,rubanHaut.height, 600,0, rubanHaut.width/3,rubanHaut.height);
        rubanHaut.copy(buffer, 0,0, 600,200, 0,0, 600,200);
      }
    }
    else if (mouseY>(200)&&mouseY<(400))
    {
      if (mouseX<(width/2))
      {
        buffer.copy(rubanMilieu, 0,0, rubanMilieu.width/3,rubanMilieu.height, 0,0, rubanMilieu.width/3,rubanMilieu.height);
        rubanMilieu.copy(rubanMilieu, 1200,0, rubanMilieu.width/3,rubanMilieu.height, 600,0, rubanMilieu.width/3,rubanMilieu.height);
        rubanMilieu.copy(rubanMilieu, 600,0, rubanMilieu.width/3,rubanMilieu.height, 0,0, rubanMilieu.width/3,rubanMilieu.height);
        rubanMilieu.copy(buffer, 0,0, rubanMilieu.width/3,rubanMilieu.height, 1200,0, rubanMilieu.width/3,rubanMilieu.height);
      } 
      else
      {
        buffer.copy(rubanMilieu, 1200,0, rubanMilieu.width/3,rubanMilieu.height, 0,0, rubanMilieu.width/3,rubanMilieu.height);
        rubanMilieu.copy(rubanMilieu, 600,0, rubanMilieu.width/3,rubanMilieu.height, 1200,0, rubanMilieu.width/3,rubanMilieu.height);
        rubanMilieu.copy(rubanMilieu, 0,0, rubanMilieu.width/3,rubanMilieu.height, 600,0, rubanMilieu.width/3,rubanMilieu.height);
        rubanMilieu.copy(buffer, 0,0, rubanMilieu.width/3,rubanMilieu.height, 0,0, rubanMilieu.width/3,rubanMilieu.height);
      }
    }
    else
    {
      if (mouseX<(width/2))
      {
        buffer.copy(rubanBas, 0,0, rubanBas.width/3,rubanBas.height, 0,0, rubanBas.width/3,rubanBas.height);
        rubanBas.copy(rubanBas, 1200,0, rubanBas.width/3,rubanBas.height, 600,0, rubanBas.width/3,rubanBas.height);
        rubanBas.copy(rubanBas, 600,0, rubanBas.width/3,rubanBas.height, 0,0, rubanBas.width/3,rubanBas.height);
        rubanBas.copy(buffer, 0,0, rubanBas.width/3,rubanBas.height, 1200,0, rubanBas.width/3,rubanBas.height);
        
        
      } 
      else
      {
        buffer.copy(rubanBas, 1200,0, rubanBas.width/3,rubanBas.height, 0,0, rubanBas.width/3,rubanBas.height);
        rubanBas.copy(rubanBas, 600,0, rubanBas.width/3,rubanBas.height, 1200,0, rubanBas.width/3,rubanBas.height);
        rubanBas.copy(rubanBas, 0,0, rubanBas.width/3,rubanBas.height, 600,0, rubanBas.width/3,rubanBas.height);
        rubanBas.copy(buffer, 0,0, rubanBas.width/3,rubanBas.height, 0,0, rubanBas.width/3,rubanBas.height);
      }
    }

  
}





