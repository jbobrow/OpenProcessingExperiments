
float huePrincipal = random(235); 
float huePrincipal2 = random(100);
float huePrincipal3 = random(50);
float posX = 250; 
float posY = 250; 
 
void setup(){ 
  size(500,500); 
  colorMode(HSB); 
  smooth(); 
   
  background(255); 
} 
 
void draw(){ 
  translate(width/2,height/2);   
  stroke(huePrincipal+random(30), 800+random(100), 190+random(50), 10); 
  strokeWeight(10 + random(10)); 
    
  line(0,0,posX-random(500),posY-random(500)); 
  stroke(huePrincipal2+random(30), 800+random(100), 190+random(50), 10); 
  line(0,0,-posX+random(500),-posY+random(500));
  
  stroke(huePrincipal3+random(40), 800+random(80), 190+random(40), 10); 
  fill(huePrincipal3+random(40), 800, 190, 10); 
  ellipse(0,0,random(200),random(100));
  
  //save("luces.png");
}

