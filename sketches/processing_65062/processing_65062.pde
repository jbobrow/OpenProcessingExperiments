

class Bloc{
 
 Random rnd = new Random();
 int valMax = 575;
 int posX;
 int posY;
 int type;// 1 = normal, 2 = bonus,4 = enemy, 5 = life
  
 
 public Bloc(){
  posX = 0;
  posY = 0;
  
  type = 1 + rnd.nextInt(20);
  
 }

 public void reset(){
  posY = (rnd.nextInt(1600) + 25) * -1;
  posX = rnd.nextInt(valMax);
  
 } 
  
}


