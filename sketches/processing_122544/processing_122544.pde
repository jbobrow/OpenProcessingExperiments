

void setup() 
{ 
  size(600,600); 
  background(255); 
  strokeWeight(20); 
} 

void mousePressed() 
{ 
ON = true; 
} 

void mouseReleased() 
{ 
ON = false; 
} 

void keyPressed() 
{ 
  if(key =='r') cmode='r'; //color red
  if(key =='g') cmode='g'; //color green
  if(key =='b') cmode='b'; //color blue
  if(key =='e') cmode='e'; //eraser
  if(key =='c') background(255); //all clear ,white  
  
  if(key =='q') strokeWeight(5); //line hutosa 5
  if(key =='w') strokeWeight(10);//line hutosa 10
  if(key =='a') strokeWeight(20);//line hutosa 20
  
  if(key =='1') background(cmode,255,255,255);//haikei mizuiro
  if(key =='h') cmode='h';//usui green
}

boolean ON=false; //seigyo true false
char cmode = 'b'; 

void draw() 
{ 
  color c = color(255,255,255); 
 if(ON){ 
  switch(cmode){ 
   case 'r': 
    c = color(255,0,0,255); 
    break; 
        
   case 'g': 
    c = color(0,255,0,255); 
    break; 
        
   case 'b': 
    c = color(0,0,255,255); 
    break;    
 
   case 'e': 
    c = color(255,255,255,255); 
    break; 
    
    case 'h': 
    c =  color(100,172, 0, 98); 
    break;

    } 
    

    stroke(c); 
    line(pmouseX, pmouseY, mouseX, mouseY); //line=p
  } 
}


