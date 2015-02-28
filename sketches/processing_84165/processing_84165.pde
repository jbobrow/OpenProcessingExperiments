
void setup() {
  size(500, 500);
  background(255);
  smooth();
  //troisieme rang horizontal
  translate(250,250);
  dessinerNoel();
  translate(-50,0);
  scale(0.5);
  rotate(radians(180));
  dessinerNoel();
  translate(-50,0);
  scale(0.5);
  rotate(radians(180));
  dessinerNoel();
  
  translate(150,0);
  scale(0.5);
  rotate(radians(180));
  dessinerNoel();
  
  translate(50,0);
  scale(0.5);
  rotate(radians(180));
  dessinerNoel();
  
  //premier rang vertical
  translate(0,50);
  scale(0.5);
  rotate(radians(180));
  dessinerNoel();
  
  translate(0,50);
  scale(0.5);
  rotate(radians(180));
  dessinerNoel();
  
  translate(0,-150);
  scale(0.5);
  rotate(radians(180));
  dessinerNoel();
  
   translate(0,-50);
  scale(0.5);
  rotate(radians(180));
  dessinerNoel();
// deuxieme rang vertical
//5
  translate(-50,0);
  scale(0.5);
  rotate(radians(180));
  dessinerNoel();
  //4
  translate(0,50);
  scale(0.5);
  rotate(radians(180));
  dessinerNoel();
  //2
  translate(0,100);
  scale(0.5);
  rotate(radians(180));
  dessinerNoel();
  //1
  translate(0,50);
  scale(0.5);
  rotate(radians(180));
  dessinerNoel();
  //trosieme rang vertical
   //1
  translate(-50,0);
  scale(0.5);
  rotate(radians(180));
  dessinerNoel();
   //2
  translate(0,-50);
  scale(0.5);
  rotate(radians(180));
  dessinerNoel();
   //4
  translate(0,-100);
  scale(0.5);
  rotate(radians(180));
  dessinerNoel();
   //5
  translate(0,-50);
  scale(0.5);
  rotate(radians(180));
  dessinerNoel();
  //quatrieme rang vertical
   //5
  translate(-50,0);
  scale(0.5);
  rotate(radians(180));
  dessinerNoel();
   //4
  translate(0,50);
  scale(0.5);
  rotate(radians(180));
  dessinerNoel();
  //2
  translate(0,100);
  scale(0.5);
  rotate(radians(180));
  dessinerNoel();
  //1
  translate(0,50);
  scale(0.5);
  rotate(radians(180));
  dessinerNoel();
   //cinquieme rang vertical
   //1
  translate(-50,0);
  scale(0.5);
  rotate(radians(180));
  dessinerNoel();
     //2
  translate(0,-50);
  scale(0.5);
  rotate(radians(180));
  dessinerNoel();
     //4
  translate(0,-100);
  scale(0.5);
  rotate(radians(180));
  dessinerNoel();
    //5
  translate(0,-50);
  scale(0.5);
  rotate(radians(180));
  dessinerNoel();
}
 

void dessinerNoel() { 
      
      noStroke();
      fill(50,100,40,200);
      for (int i=0;i<360;i=i+30){
       rotate(radians(45)); 
       arc(0,10,50,50,0,PI/2);}
  
      fill(180,45,40.20);
      for (int i=0;i<360;i=i+30){
       rotate(radians(30)); 
       triangle(0,45,5,40,-5,35);}
      
     fill(210,200,80,150);
     triangle(0,10,-10,-10,10,-10);
     scale(2);
     triangle(0,0,-10,-20,10,-20);
      
     }
 
    
      
      

  
    
 








