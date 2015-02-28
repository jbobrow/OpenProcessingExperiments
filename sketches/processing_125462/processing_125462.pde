
//Sam Friedlander
//HW 10
//11 - 25 - 13 copywrite

float [] sales = {
  //5.wii
  100300000,
 //4. playstation
  102490000,
  //3. gameboy
  118690000,
  //2. nintendo ds
  153960000, 
  // 1. playstation 2 
  155000000
 };
 
color [] barcolor =
{
 //5.wii
 color (0,255,255),
  //4. playstation
 color (200,0,0),
 //3. gameboy+gameboycolor
 color (46,49,149),
 //2. nintendo ds
 color (150),
 // 1. playstation 2 
 color (67,93,150)
 
};
  
int [] bars = new int [5];
float [] y = new float [5];
float [] poop = new float [5];
String [] text = 
{
  "#5 WII" ,
  "#4 PLAYSTATION" ,
  "#3 GAMEBOY" ,
  "#2 NINTENDO DS" ,
  "#1 PLAYSTATION 2"
};
String [] text2 = 
{
  "100,300,000 sales" ,
  "102,490,000 sales" ,
  "118,690,000 sales" ,
  "153,960,000 sales" ,
  "155,000,000 sales"
};
  
  
  
  void setup()
  
  {
    size (1000,400);
    background (55);
    noStroke();
    
    
    for (int i=0; i<5; i++)
    {
      bars [i] = (width/6) * (i+1);
      y [i] = sales[i]/1000000;
    }
    
   
    
  }
  
  void draw()
  {
    databar();
    label();
  }
  
  void databar()
  
  {
      for(int i=0; i<bars.length; i++)
      {
      
          if (mouseX > bars[i]-(width/6) && mouseX < bars[i])
              {
                fill(barcolor[i]);
                poop[i]= map(mouseX,bars[i]-(width/6),bars[i],0, y[i]);
                rect((bars[i]-10),300,20,-poop[i]); 
              }
      
      }
 }
 
 void label()
 {
  fill(255);
  textSize(12);
  text("TOP SELLING VIDEO GAME CONSOLES OF ALL TIME", (width/2) -125, 50);
  text("move mouse from left to right", (width/2) -75, height - 20);
   for (int i=0; i<bars.length; i++)
   {
      if (mouseX > bars[i]-(width/20) && mouseX < bars[i])
              {
        text(text[i],bars[i]-50,100);
        text(text2[i],bars[i]-50,125);
              }
   }
 
 }
  


