
  /* @pjs preload="Active_University_Splash_06_01.jpg,Active_University_Splash_06_00.jpg,Active_University_Splash_06_02.jpg,Active_University_Splash_06_03.jpg"; */


PImage home, signin, profile, getfit;
boolean hm, si, pf, gf;
boolean mouseHome, mouseDorm, mouseFit, mouseLogin;
int w,h;

void setup()
{
  home = loadImage("Active_University_Splash_06_01.jpg");
  signin = loadImage("Active_University_Splash_06_00.jpg");
  profile = loadImage("Active_University_Splash_06_02.jpg");
  getfit = loadImage("Active_University_Splash_06_03.jpg");
  size(637,825);
  w = 2550/4;
  h = 3300/4;
  

  
  home.resize(w,h);
  signin.resize(w,h);
  profile.resize(w,h);
  getfit.resize(w,h);
  
  si = true;
  hm = false;
  pf = false;
  gf = false;  
  mouseHome = false;
  mouseDorm = false;
  mouseFit = false;
  mouseLogin = false;
  

}

void draw()
{
  if (si == true)
  {
    background(signin);
    
    if(mouseX > 220 && mouseX < 455 && mouseY > 190 && mouseY < 335)
    {
       mouseLogin = true;
    }
    
    if (mousePressed && mouseLogin)
    {
      hm = true;
      si = false;
      mouseLogin = false;
    }
    
    
  }
  
  //dorm
  if (hm == true)
  {
    background(home);
    
//    rect(width-70,60,width,70);
    
    if(mouseX > width-90 && mouseX < width && mouseY > 65 && mouseY < 120)
    {
       mouseDorm = true;
    }
    
    if (mousePressed && mouseDorm)
    {
      pf = true;
      hm = false;
      mouseDorm = false;
    }
    
//    rect(100,60,170,65);
    
    if(mouseX > 100 && mouseX < 190 && mouseY > 60 && mouseY < 80)
    {
       mouseFit = true;
       mouseHome = false;
    }
    
    if (mousePressed && mouseFit)
    {
      gf = true;
      hm = false;
      mouseFit = false;
    }
    
    
    
    
    
  }
  if (pf == true)
  {
    background(profile);
    
//    rect(0,0,75,60);
    
//    if(mouseX > 0 && mouseX < 75 && mouseY > 0 && mouseY < 60)
//    {
//       mouseHome = true;
//    }
//    
//    if (mousePressed && mouseHome)
//    {
//      hm = true;
//      pf = false;
//      mouseHome = false;
//    }
    
    
    
    
  }
  if (gf == true)
  {
    background(getfit);
    if(mouseX > width-90 && mouseX < width && mouseY > 65 && mouseY < 120)
    {
       mouseDorm = true;
    }
    
    if (mousePressed && mouseDorm)
    {
      pf = true;
      gf = false;
      mouseDorm = false;
    }
  }
  
  //always home
    if(mouseX > 0 && mouseX < 75 && mouseY > 0 && mouseY < 60)
  {
     mouseHome = true;
     mouseDorm = false;
     mouseFit = false;
  }
  
  if (mousePressed && mouseHome && !si)
  {
    hm = true;
    pf = false;
    gf = false;
    si = false;
    mouseHome = false;
  }
  
  //always logout
  if(mouseX > width-80 && mouseX < width && mouseY > 0 && mouseY < 65)
  {
     mouseLogin = true;
     mouseDorm = false;
     mouseFit = false;
     mouseHome = false;
  }
  
  if (mousePressed && mouseLogin && !si)
  {
    si = true;
    pf = false;
    gf = false;
    hm = false;
    mouseLogin = false;
  }
}






