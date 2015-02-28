

int a = 0;
int b = 5;
int c = 500;

void setup (){
 size (500, 500);
 
 background (255);

}  
  
void draw (){  
  line(a, 0 , c, 100);
  line(a, 0 , c, 200);
  line(a, 0 , c, 300);
  line(a, 0 , c, 400);
  line(a, 0 , c, 500);
  line(a, 0 , c, 600);
  
  line(100, c, 0, a);
  line(200, c, 0, a);
  line(300, c, 0, a);
  line(400, c, 0, a);
  line(500, c, 0, a);
  line(600, c, 0, a);
  
  fill(150);
   
  line(150, c, 0, a);
  line(250, c, 0, a);
  line(350, c, 0, a);
  line(450, c, 0, a);
  line(550, c, 0, a);
  line(650, c, 0, a);
  
  line(a, 0 , c, 150);
  line(a, 0 , c, 250);
  line(a, 0 , c, 350);
  line(a, 0 , c, 450);
  line(a, 0 , c, 550);
  line(a, 0 , c, 650);
  
  
  
  
  
  a = b + 5;
  b = a + 20;
  a = a + 0;
  

}




