
PFont f;
String message ="♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥";
float theta;
 
void setup() {
  size(500,500);
  
  frameRate(25);
}
 
void draw() {
  fill(255,255,255,1);
  rect(0,0,700,700);
  
  fill(255,random(255),random(42,255));

  textSize(30); 
  translate(width/2,height/2); 
  rotate(theta);              
  textAlign(CENTER);           
  text(message,0,0);           
  theta += 0.05;              
 
  fill(255,random(255),random(42,255),50);
   
  textSize(45);
  translate(30,50);
  rotate(theta);                         
  text(message,0,0);           
  theta += 0.005;               
   
  fill(255,random(255),random(42,255),50);
                  
  textSize(60);
  translate(60,100);
  rotate(theta);                    
  text(message,0,0);           
  theta += 0.0005;           
   
  fill(255,random(255),random(42,255),50);
 
  textSize(75); 
  translate(90,150);
  rotate(theta);                    
  text(message,0,0);           
  theta += 0.00005;             
   
    fill(255,random(255),random(42,255),50);
  
  textSize(90); 
  translate(90,150); 
  rotate(theta);                      
  text(message,0,0);           
  theta += 0.00005;               
}


