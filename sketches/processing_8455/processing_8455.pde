
int [] waardenX = new int[50]; 
int [] waardenY = new int[50]; 
 

void setup() 
{ size (500,500); 
  smooth(); 
   
  for(int i=0;i<20;i++) 
  { waardenX[i] = 120*int(random(0,4));  
    waardenY[i] = 120*int(random(0,4)); 
  } 
} 
  
 
void draw () 
{ background(0); 
   strokeWeight(3); 
     
  for(int i=0;i<20;i++) 
  { Vierkantjes(waardenX[i], waardenY[i]); 
  } 
} 
 
 
void Vierkantjes(int x, int y) 
 {  
   // de 4 grotere vierkantjes in het midden 
     // veranderen van kleur dmv het bewegen van de muis
    stroke(150); 
    fill(mouseX,0,mouseY); 
    rect (x+40,y+45,30,30); 
    
    fill(mouseX,mouseY,mouseX,mouseY); 
    rect (x+70,y+75,30,30);
    
    //wit
    fill(250); 
    rect (x+40,y+75,30,30);
    
    fill(250); 
    rect (x+70,y+45,30,30);
    
   
    // omlijsting van vierkantjes
      //horizontale vierkantjes boven
    stroke(60); 
    fill(255,mouseX,mouseY); 
    rect (x+20,y+25,20,20); 
     
    fill(250); 
    rect (x+40,y+25,20,20); 
     
    fill(mouseY,180,mouseX); 
    rect (x+60,y+25,20,20); 
     
    fill(250); 
    rect (x+80,y+25,20,20); 
     
    fill(mouseX,mouseY,109); 
    rect (x+100,y+25,20,20); 
    
    //verticale vierkantjes links
    fill(250); 
    rect (x+20,y+45,20,20); 
    
    fill(mouseY,20,mouseX); 
    rect (x+20,y+65,20,20); 
    
    fill(250); 
    rect (x+20,y+85,20,20); 
     
    fill(mouseX,mouseY,240); 
    rect (x+20,y+105,20,20); 
    
    //horizontale vierkantjes onder
    fill(250); 
    rect (x+40,y+105,20,20); 
    
    fill(200,100,mouseX); 
    rect (x+60,y+105,20,20);
    
    fill(250); 
    rect (x+80,y+105,20,20);
    
    fill(135,mouseX,mouseY); 
    rect (x+100,y+105,20,20);
    
    //verticale vierkantjes boven
    fill(250); 
    rect (x+100,y+85,20,20);
    
    fill(mouseX,mouseY-22,mouseY,mouseX+33); 
    rect (x+100,y+65,20,20);
    
    fill(250); 
    rect (x+100,y+45,20,20);
    
  } 
  



