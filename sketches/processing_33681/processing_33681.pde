
int numOfGroceries = 6;
String [] groceries = new String[numOfGroceries];
//groceries = ["beer", "chips", "salsa", "avocado", "lime"];
boolean lemonLime = false;

void setup(){
  //grocery list:
  //1. beer
  //2. chips ...
   groceries[0] = "beer";
   groceries[1] = "chips";
   groceries[2] = "salsa";
   groceries[3] = "avocado";
   groceries[4] = "lime";
   groceries[5] = "advil";
  
}

void draw(){
  //range - start; range - end; increment
  for(int groNum = 0; groNum < numOfGroceries; groNum++){
    println(groNum+1 + ". " +  groceries[groNum]);
    //groceries[1] = chips
  }
  
  if(lemonLime == true){
    //do something
    groceries[4] = "lemon";
  }else{
    //do something else
    groceries[4] = "lime";
  }
}

void keyPressed(){
  if( key == 'l' || key =='L'){
    lemonLime = !lemonLime;
  }df

}

                
                
