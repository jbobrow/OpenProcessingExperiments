
PImage[] goku1 = new PImage[4]; PImage[] goku2 = new PImage[5]; PImage[] lose1 = new PImage[4]; PImage[] lose2 = new PImage[7];
int pcount; float time; float goal; PImage back1; PImage back2; PImage ground1; PImage ground2; int flag = 0;  int flag2 = 0; PImage intro;

void setup(){
  size (600,400);
  frameRate(10);
  goku1[0] = loadImage("p0.png"); goku1[1] = loadImage("p1.png"); goku1[2] = loadImage("p2.png"); goku1[3] = loadImage("p3.png");
  lose1[0] = loadImage("g0.png"); lose1[0] = loadImage("g1.png"); lose1[0] = loadImage("g2.png"); lose1[0] = loadImage("g3.png");
  back1 = loadImage("Canyon_back.png"); back2 = loadImage("tenchi_back.png"); ground1 = loadImage("Canyon_sky.png"); ground2 = loadImage("tenchi_ground.png"); intro = loadImage("DBZ.jpg");
}
  
  void draw()
  { 
        if (flag == 0)
      {
          Menu(); 
      }
      
    if (flag == 1)
    {
        Game1();
    }

    }
  void Menu()
  {
    image(intro,0,0);
    textSize(35);
    fill(random(255));
    text("DBZ Mini-Games",80,150);
    text("Power Up Game 1", 80, 250);
    text("Energy Battle 2", 80, 300);
    
  }
  void Game1()
  {  
    image(back1, 0,200);
    image(ground1, 0,80);
    image(ground1, 0,0);
    time = 10;
    pcount = 0;
    goal = 5;
    text("Press G To Power Up ", 200,150);
    textAlign(LEFT);
    text("Time " + time, 10,30);
    image(goku1[0],300,300);
    
    if (flag == 1)
    {
      
    image(back1, 0,200);
    image(ground1, 0,80);
    image(ground1, 0,0);
    image(goku1[0],300,300);
    textAlign(LEFT);
    text("Time " + time, 10,30);
       time += 0.0167;
       if (mousePressed && (mouseButton == LEFT))
    {
      pcount +=1;
    }
    if (pcount == goal)
    {
    {
        image(goku1[2],300,300);

      text("YOU WIN!!! Earth Is Safe",200,200);
    }
    
      if (time <=0)
      {
             for(int i=0;i<lose1.length;i++)
    {
      image(back1, 0,200);
      image(ground1, 0,80);
      image(ground1, 0,0);
      image(lose1[i],300,300);
    }
    text("YOU LOSE...Earth Is Doomed", 200, 200);
      }

   } 
 } 
  } 

void keyPressed()
{
  
  if(key == '1') 
  { flag +=1; }
  

    if (key == 'g')
    { pcount += 1 ;    }
    
}


