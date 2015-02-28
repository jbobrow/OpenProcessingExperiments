
int speed;
int teller;
int kleur;

void setup()
{
  size(800, 800);
  smooth();
  speed = 6;
  teller = speed;
  
  
  }
  
void draw() { 
    
  background(255);
  smooth();
 strokeWeight(60);
 
  stroke(2);
   
    if( teller >= 300)
    teller = 0;
    
  
  fill(255);
  ellipse(70 + teller + mouseX, 70 + teller/2 + mouseY, 52 + teller, 52 + teller);

  
  
noStroke();
fill(0);
 rect(15 + mouseY, 15 + mouseY, 40, 255 + teller); 

  stroke(0);
  strokeWeight(40);
  line(35 + mouseX, 38+mouseX, 100+teller, 250+teller);


 
if(mousePressed)
  teller = teller + speed;
  
   
   
   } 
  

    
 




