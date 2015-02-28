


int c;
 int l;
 
void setup() {
  size(1000, 350); 
  background(178,216,255);
  stroke(255);
  noFill();
  

}

void draw() {
  background(178,216,255);
  
   for (int c=1; c<300; c+=1){

stroke(c/2,100,140);
line(0,c,1000,c);} // Degradê: Céu
 
 
 
   stroke(255);
  point(random(0,1010),random(0,300));
  point(random(0,1010),random(0,300));
  point(random(0,1010),random(0,300));
  point(random(0,1010),random(0,300));
  point(random(0,1010),random(0,300));
  point(random(0,1010),random(0,300));
  point(random(0,1010),random(0,300));
  point(random(0,1010),random(0,300));
  point(random(0,1010),random(0,300));
  point(random(0,1010),random(0,300));
  point(random(0,1010),random(0,300)); // Estrelinhas

 
 
 
 
 fill(240);
 ellipse(150,100,30,30); // Lua

 
 
 
  stroke(255);
  for (int i = 0; i < 710; i += 25) {
  if(i<mouseX/3)
    fill(map(i+500,900,100,0,255));   
   else
    fill(45,102,149,200);   

    arc(500, 300, 700-i, 350-(mouseY+1)/2,PI,2*PI); // Edifício 
  
   
   
  } 

  {
noStroke();

  fill(30,120,163);
   rect(-10,300,1010,550); // Lago
   
     for (int l=1; l<1050; l+=1){
   stroke(50,l*5,l*5,50);
  line(0,300+l,1050,300+l);} // Degradê: Lago
  
  
  noStroke();
  
  
    fill(150,150);
     
   quad(445,300,525,300,1050,350,830,350); // Passarela


  stroke(200) ;
   line(525,300,1050,350);
   line(-10,300,1010,300); // Contorno: Passarela
   
  
     for (int l=1; l<1050; l+=1){
   stroke(50,l*5,l*5,50);
  line(0,300+l,1050,300+l);} // Degradê: Lago sobre  passarela
  
  
  }

}
