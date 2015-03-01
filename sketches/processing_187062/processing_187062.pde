
//float x = 50;
void setup(){
  size(600,400);
}
 
void draw (){
  
  for(int x = 15; x < 600; x += 30){
    for(int y = 0; y < 370; y += 30){
       
       fill(x*1.5,y*1.1,x*1.1);
       triangle(x, y, x-15, y+30, x+15, y+30);
       ellipse(x, y, 40, 20);
    }
  
  }

}

