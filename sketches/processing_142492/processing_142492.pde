
String[] fontList = PFont.list();

String time = "010";
int t;
int interval = 10;
PImage img ;

void setup()
{
  
  
  img= loadImage("images1.jpg");
  size(600, 600);
  


  background(255);
 
}

void draw()
{
  background(255);
  //Title//
  fill(50);

      text("KILL THE UGLY TYPE", 10,30);
fill(50);


   text(time, width/2, height/2);
    t = interval-int(millis()/1000);
    time = nf(t , 3);
    
    
    if(t <= 0){
    background (255);  
    println("GAME OVER");
   
    String s = "GAME OVER";
      fill(50);
      text(s, 10, 10, 70, 80);
     
      image(img, 40, 300);
      img.resize(0, 350);


  }


   
}


