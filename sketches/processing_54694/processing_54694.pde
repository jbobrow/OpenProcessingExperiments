
PFont f;
String message = "On Happy Bar";
float theta;

void setup() {
  size(700,700);
  f = loadFont("Constantia-Bold-48.vlw");
  frameRate(25);
}

void draw() { 
  fill(255,255,255,10);
  rect(0,0,700,700);
 
  fill(250,250,250,50);
  textFont(f);
  textSize(30);  
  translate(width/2,height/2);  
  rotate(theta);               
  textAlign(CENTER);            
  text(message,0,0);            
  theta += 0.05;               

  fill(200,200,200,50);
  textFont(f);   
  textSize(45);
  translate(30,50);
  rotate(theta);                          
  text(message,0,0);            
  theta += 0.005;                
  
  fill(150,150,150,50);
  textFont(f);                  
  textSize(60);
  translate(60,100); 
  rotate(theta);                     
  text(message,0,0);            
  theta += 0.0005;            
  
  fill(100,100,100,50);
  textFont(f);  
  textSize(75);  
  translate(90,150); 
  rotate(theta);                     
  text(message,0,0);            
  theta += 0.00005;              
  
    fill(250,250,250,50);
  textFont(f);  
  textSize(90);  
  translate(90,150);  
  rotate(theta);                       
  text(message,0,0);            
  theta += 0.00005;                
}
