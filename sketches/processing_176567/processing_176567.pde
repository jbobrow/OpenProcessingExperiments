
PImage soundWave ;
PImage rainbow ;
String[] name = {
"November 26:",
"November 27:",
"November 28:",
"November 29:",
"November 30:",
"December 1:",
"December 2:",
};
 
int[] population = {
167454  ,
210367  ,
401662  ,
520186  ,
607610  ,
655009  ,
727973  ,
};

 
void setup(){
  size(500,580);
  soundWave = loadImage("newsoundwave.jpg") ;
  rainbow = loadImage("rainbow.jpg") ;
  fill(#FFFFFF) ;
}
 
void draw(){
  background(#000000) ;
  image(soundWave, 0, 0) ;
  
  int x=0;
   for(int i=0;i<7;i++){
     
     if(mouseX>x+50 && mouseX<=x+120){
       fill(#FF6FAB);
     }else{
       fill(70);
     }
      
    float h = map(population[i], 160000,730000,0,400);
    rect(x+50,height-h,50,h);
     
    x+=60;
  }
 
}


