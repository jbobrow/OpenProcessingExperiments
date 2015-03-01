
Snake code;

void setup (){
  code = new Snake();
  code.Snake(50, 100, color(30,40,40), false, 100, "Mike");
}

void draw () {
  code.die();
  
 }

class Snake {
  //declare the types of variables that 
  //apply to snakes
  int SnakeScales;
  int SnakeLength;
  color SnakeColor;
  boolean isPoisonous;
  float percentageOfVenom ;
  String name;
  
 Snake(){
   SnakeScales = 1100; //default height is 108 unites
   SnakeLength = 100;
   SnakeColor = color(35,63,99);
   isPoisonous = false;
   percentageOfVenom = 80.4;
   name = "Killa";
   
 }
 void Snake (int aSnakeScales, int aSnakeLength, color aSnakeColor, boolean aIsPoisonous, float apercentageOfVenom, String aName){
SnakeScales= aSnakeScales;
SnakeLength= aSnakeLength;
SnakeColor= aSnakeColor;
isPoisonous = aIsPoisonous;
percentageOfVenom =apercentageOfVenom;
name=aName;
 } 
 
 void attack () {

   println("a snake named " + name + "is attacking");
 }
 void die () {
   println (name + "lethal bite" +
           percentageOfVenom + "made the victim die");
 }          
 
 
}
