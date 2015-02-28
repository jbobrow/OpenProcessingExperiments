
//dana gloria
//data visualization 2.0 
// 12 October 2011

void setup (){
  size(800,800);
  
   PImage b;
  b= loadImage ("SF9.jpg");
  size(800,800);
   
  
}

void draw (){
  background(200);
  smooth ();
  
   PImage b;
  b= loadImage ("SF9.jpg");
  tint(0,200,230,200);
  image(b,0,0);

  
  PFont font; 
  font = loadFont("Dissoun.vlw"); 
   textFont(font,40); 
   fill(216,84,7);
    text("San Francisco Neighborhoods",25,65);
    
    
  font = loadFont("Airline.vlw"); 
   textFont(font,90); 
   fill(185,13,7);
    text("ChinaTown",60, 150);
    
    font = loadFont("Brushed.vlw"); 
   textFont(font,85); 
   fill(240,221,12);
    text("Sunset",40, 235);
    
    font = loadFont("FlowersCube.vlw"); 
   textFont(font,80); 
   fill(240,12,122);
    text("Castro",255, 345);
    
    font = loadFont("Rat.vlw"); 
   textFont(font,75); 
   fill(152,81,5);
    text("Mission",450, 225);
    
    font = loadFont("Lamenta.vlw"); 
   textFont(font,70); 
   fill(165,7,245);
    text("Haight",20, 340);
    
    font = loadFont("Echo.vlw"); 
   textFont(font,65); 
   fill(7,245,144);
    text("Marina",465, 420);
    
    font = loadFont("Story.vlw"); 
   textFont(font,60); 
   fill(255);
    text("Noe Valley",70, 425);
    
    font = loadFont("Bullet.vlw"); 
   textFont(font,55); 
   fill(0);
    text("Tenderloin",345, 540);
    
    font = loadFont("Noir.vlw"); 
   textFont(font,50); 
   fill(137,18,28);
    text("North Beach",40, 510);
    
    font = loadFont("Jazz.vlw"); 
   textFont(font,45); 
   fill(7,16,113);
    text("FILMORE",110, 600);
    
    font = loadFont("Penshurst.vlw"); 
   textFont(font,40); 
   fill(33,227,9);
    text("Potrero Hill",420, 600);
    
    font = loadFont("Roman.vlw"); 
   textFont(font,35); 
   fill(157,48,29);
    text("SOMA",290, 660);
    
    font = loadFont("Synchro.vlw"); 
   textFont(font,30); 
   fill(20,147,4);
    text("FINANCIAL",450, 700);
    

}
 
     
   


    
 



