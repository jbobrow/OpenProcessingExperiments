
int time1= 2000;
PImage ad;
PImage vertical;
PImage dada;
PImage head;
PImage canada;
PImage english;
PImage ahem;

void setup() {
  size(600, 300);
  imageMode(CENTER);
  ad= loadImage("ad.jpg");
  dada = loadImage("dada.png");
  vertical= loadImage("vertical.png");
  head = loadImage("head.png");
 canada= loadImage ("canada.png");
 english = loadImage("english.png");
 ahem = loadImage ("ahem.png");
 frameRate(1);
}
  
  
  void draw(){
    
     int timer = millis();
  println(timer);
    
    
    int currentTime = millis();
    if(currentTime<time1)
    {
   image(ad, 300,150); 
    }
   
   if (currentTime>time1)
   {
   image(dada, 300, 200);
   }
   
   if (currentTime>time1+1000)
   {
   
   image(vertical, 500,10);
   }
   
   
   if (currentTime>time1+2000)
   {
   image(head, 400,98);
   }
   
   if (currentTime>time1+3000)
   {
   
   image(canada, 300,150);
   }
   
   
   if (currentTime>time1+4000)
   {
   
   image(english, 300, 400);
   }
   
   if (currentTime>time1+5000)
   {
     image(ahem,100,50);
   }
   
   if (currentTime>time1+6000)
    {
    float x = random(width);
    float y = random(height);
    float z= random(width/3);
    float a = random(height/3);
    
     image(ad,x,y);
    image(dada,a,y);
    image(head,x,y);
    image(canada,z,y);
     image(ahem, x,y);
    image(english,z,a);
   
    
    
    image(vertical,x,y);
  }
  }

