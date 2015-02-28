
//arm image source is: http://www.turbosquid.com/FullPreview/Index.cfm/ID/523806 //

//coding by Cecilia Chen// 


PImage cleanfloor;  
PImage smallpoo; 
PImage squid; 
PImage bigpoo;
PImage lamb; 
PImage blackpoo; 
PImage pig; 
PImage money; 
PImage vacuum; 

void setup() { 
  size(400, 400); 
  cleanfloor = loadImage ("08.png"); 
  smallpoo = loadImage ("smallpoo.png"); 
  squid = loadImage ("squid.png"); 
  bigpoo = loadImage ("bigpoo.png"); 
  lamb = loadImage ("lamb.png"); 
  blackpoo = loadImage ("blackpoo.png"); 
  pig = loadImage ("pig.png"); 
  money = loadImage ("money.png"); 
  vacuum = loadImage ("vacuum.png"); 
   image(cleanfloor, 0, 0); 
  cursor (vacuum);
}   
void draw() {   
  

  

}

void keyPressed () { 
  if (key == 'm') { 
    image(money, mouseX, mouseY);
  } 
  if (key == 's') { 
    image(squid, mouseX, mouseY); 
  }
  if (key == 'b') { 
    image(bigpoo, mouseX, mouseY);  
  }
  if (key == 'l') { 
    image(lamb, mouseX, mouseY); 
  } 
  if (key == 'p') { 
    image(blackpoo, mouseX, mouseY); 
  }
  if (key == 'o') { 
    image(pig, mouseX, mouseY); 
  }
  if (key == 'a') { 
    image(smallpoo, mouseX, mouseY); 
  } 
  if (key == BACKSPACE) { 
    image(cleanfloor, 0, 0);   
  }}


