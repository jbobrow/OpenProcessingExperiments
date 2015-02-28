
PImage stand1;
PImage stand2;
PImage walk1;
PImage walk2;
PImage walk3;
PImage walk1a;
PImage walk2a;
PImage walk3a;
PImage jumpin;
PImage fallin;
int bacon;
int panel;
int keybo;
int x;
int y;
int face;
int ground;
void setup()
{
size(497,387);
panel = 0;
keybo = 1;
face = 0;
ground = 0;
x = 0;
y = 0;
bacon = 0;
stand1 = loadImage("http://25.media.tumblr.com/83a24f61f1ebd2119307ffd4efb6da12/tumblr_mi6qh9J0ch1qhfoc0o1_250.png");
stand2 = loadImage("http://25.media.tumblr.com/450e1c6696fdaf80805e7f2076bd81de/tumblr_mi6qh9J0ch1qhfoc0o2_250.png");
walk1 = loadImage("http://25.media.tumblr.com/61e5c7db3653c440b20e6165d715f3ca/tumblr_mi6qh9J0ch1qhfoc0o3_250.png");
walk2 = loadImage("http://24.media.tumblr.com/ea56a06957662c2c8e78382ba61314d7/tumblr_mi6qh9J0ch1qhfoc0o4_250.png");
walk3 = loadImage("http://25.media.tumblr.com/20770c7edce811bbe9007b0a2ed60ccc/tumblr_mi6qh9J0ch1qhfoc0o5_250.png");
walk1a = loadImage("http://24.media.tumblr.com/b99d550e2a1ac952ec33992f69043fb8/tumblr_mi748jKF381qhfoc0o1_250.png");
walk2a = loadImage("http://25.media.tumblr.com/c5c98ad7cd73bbd73983602c650beba3/tumblr_mi748jKF381qhfoc0o2_250.png");
walk3a = loadImage("http://25.media.tumblr.com/91ce853cbee379f81c6c804043a30da3/tumblr_mi748jKF381qhfoc0o3_250.png");
jumpin = loadImage("http://25.media.tumblr.com/02e4b463e10bf8e14c114a6051c69922/tumblr_mi6qh9J0ch1qhfoc0o7_r1_250.png");
fallin = loadImage("http://24.media.tumblr.com/60f7345e5190bff2f9f228790b7ca413/tumblr_mi6qh9J0ch1qhfoc0o6_r2_250.png");
}
 
void draw()
{
background(255);
fill(0);
panel ++;



  if(keybo == 1 && y == 0)
  {
  if(panel < 30)
  {
   image(stand1, 0+x,213);
   }
   else
   {
   image(stand2, 0+x,213);
   }
   if(panel > 60){panel = 0}
  }
  
  
   if(keyPressed && key == 'a')
   {
     x = x - 5;
     if(x<0)
     {x = 0;}
     if(y ==0)
     {
     if(panel < 15)
     {
   image(walk2a, 0+x,213);
  
     }
     else
     {
     if(panel < 30)
     {
       image(walk1a, 0+x,213);
     }
     else
     {
     if(panel < 45)
     {
     image(walk3a, 0+x,213);
     }
     else
     { if(panel < 60)
     {
       image(walk1a, 0+x,213);
     }
     if(panel>59)
     {
        panel = 1;
     }
     }
     
   }
   }
  
   keybo = 0;
   }
   }
   
  
   if(keyPressed && key == 'd')
   {
     x = x + 5;
     if(x>400)
     {x = 400;}
     if(y ==0)
     {
     if(panel < 15)
     {
   image(walk2, 0+x,213);
  
     }
     else
     {
     if(panel < 30)
     {
       image(walk1, 0+x,213);
     }
     else
     {
     if(panel < 45)
     {
     image(walk3, 0+x,213);
     }
     else
     { if(panel < 60)
     {
       image(walk1, 0+x,213);
     }
     if(panel>59)
     {
        panel = 1;
     }
     }
     
   }
   }
  
   keybo = 0;
   }
   }
   
   if(key == 'm')
   { bacon = 1;}
   
    if(keyPressed && key == ' ' && keybo == 1 )
   {
    if(y == 0 || bacon == 1)
     ground = 1;
    
   }
   if(ground == 33)
     { 
      y = y-8;
      if(y < 0)
      {
      y = 0;
      ground = 0;
      }
      image(fallin, 0+x,213-y);
     }
     
   if(ground == 31|| ground == 32)
     { 
     y = y-7;
     ground ++;
      image(fallin, 0+x,213-y);
     }
   if(ground == 29|| ground == 30)
     { 
     y = y-6;
     ground ++;
      image(fallin, 0+x,213-y);
     }
   if(ground == 27|| ground == 28)
     { 
     y = y-5;
     ground ++;
      image(fallin, 0+x,213-y);
     }
   if(ground == 25|| ground == 26)
     { 
     y = y-4;
     ground ++;
      image(fallin, 0+x,213-y);
     }
    if(ground == 23|| ground == 24)
     { 
     y = y-3;
     ground ++;
      image(fallin, 0+x,213-y);
     }
    if(ground == 21|| ground == 22)
     { 
     y = y-2;
     ground ++;
      image(fallin, 0+x,213-y);
     }
     if(ground == 19|| ground == 20)
     { 
     y = y-1;
     ground ++;
      image(fallin, 0+x,213-y);
     }
      if(ground == 17|| ground == 18)
     {
     ground ++;
      image(jumpin, 0+x,213-y);
     }
     if(ground == 15|| ground == 16)
     {
     y = y+1;
     ground ++;
      image(jumpin, 0+x,213-y);
     }
     if(ground == 13|| ground == 14)
     {
     y = y+2;
     ground ++;
      image(jumpin, 0+x,213-y);
     }
      if(ground == 11|| ground == 12)
     {
     y = y+3;
     ground ++;
      image(jumpin, 0+x,213-y);
     }
     if(ground == 9|| ground == 10)
     {
     y = y + 4;
     ground ++;
      image(jumpin, 0+x,213-y);
     }
       if(ground == 7|| ground == 8)
     {
       y = y + 5;
     ground ++;
      image(jumpin, 0+x,213-y);
     }
       if(ground == 5|| ground == 6)
     {
     y = y + 6;
     ground ++;
      image(jumpin, 0+x,213-y);
     }
      if(ground == 3|| ground == 4)
     {    y = y + 7;    ground ++;    image(jumpin, 0+x,213-y);}
     if(ground ==1 || ground == 2)
     {     y = y +8;    ground ++;    image(jumpin, 0+x,213-y);}
   }
void keyReleased()
{
keybo = 1;
}
