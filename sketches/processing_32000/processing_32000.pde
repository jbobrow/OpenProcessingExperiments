


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
  
  line(a, 0, c, 10);
  line(a, 0, c, 110);
  line(a, 0, c, 210);
  line(a, 0, c, 310);
  line(a, 0, c, 410);
  line(a, 0, c, 510);
  
  line(10, c, 0, a);
  line(110, c, 0, a);
  line(210, c, 0, a);
  line(310, c, 0, a);
  line(410, c, 0, a);
  line(510, c, 0, a);
  
  
  line(100, c, 0, a);
  line(200, c, 0, a);
  line(300, c, 0, a);
  line(400, c, 0, a);
  line(500, c, 0, a);
  line(600, c, 0, a);
  
  a = b + 5;
  b = a + 20;
  a = a + 0;
  

}





