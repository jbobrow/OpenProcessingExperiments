
  PFont f;   
void setup() {
  size(400,400);
  f = createFont("Arial",16,true); 
}

void draw() {
  background(255);
  textFont(f,16);                 
  fill(random(250));                        
  text("I DON'T KNOW WHY I'M DOING THIS",10,100);  
  
  textFont(f,16);                
  fill(random(250));                       
  text("I DON'T KNOW WHY I'M DOING THIS",20,200);  
 
 textFont(f,16);                
  fill(random(250));                       
  text("I DON'T KNOW WHY I'M DOING THIS",30,300);  
  
  textFont(f,16);                 
  fill(random(250));                        
  text("I DON'T KNOW WHY I'M DOING THIS",40,400);  
  
  textFont(f,16);                
  fill(random(250));                       
  text("I DON'T KNOW WHY I'M DOING THIS",8,35);    
}

