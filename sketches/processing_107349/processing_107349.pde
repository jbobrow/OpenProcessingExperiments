
void setup(){
size(800,250);
background(3,57,126);

 // Lua
    fill(255);
    ellipse(60,60,50,50);
    
    // Tornando MEIA LUA
    noStroke();
    fill(3,57,126);
    ellipse(70,50,50,50);
    

}

void draw(){
  
  
  // Janelas
  
  fill(213,255,77,10);
rect(120,200,560,20);  

  // Borda

fill(255);
rect(95,200,615,5);    

  // Cubo
  
 int a;
 for (a=120; a<680; a=a+5) 
  line(a,205,a,220);
  
  
  int x;
  int y;
  
frameRate (15);



  fill(random(0,250),mouseX/4,mouseY);
for (y=100; y<mouseY-50; y=y+20)
for (x=100; x<mouseX-100; x=x+20)


rect (x,y,20,20);


    // Chão
    
    fill(150);
    rect(0,220,800,300);

    // Estrelas
    

   
    stroke(255);
    point(random(0,800),random(0,220));
    
    
   

}
