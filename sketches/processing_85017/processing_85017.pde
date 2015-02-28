
import netscape.javascript.*;

String[] name = { //list of the 10 cities and towns in lreland from largest to smallest
"DUBLIN:",
"BELFAST:",
"DERRY :",
"CORK:",
"BALLYMENA:",
"GALWAY:",
"STRABANE:",
"DUNDALK:",
"LIMAVADY:",
"MONAGHAN:",
};
  
int[] population = { // population from largest to smallest 
1273069 ,
281000 ,
120000 ,
119230,
63451 ,
57106 ,
39614 ,
37816,
32000 ,
5000 ,
};
  
  
void setup(){
   
  frameRate(5); // speed in which the rectangles flash on and off
  background(#98ce7d); // colour of background
  size(487,500);

 
}
  
void draw(){
  


  text("POPULATION OF 10 TOWNS AND CITES IN IRELAND", 90, 30); // title of graph
  
  
  
  int x=0; //set x to 0
  int p = 30; //set p to 30
  

 
   for(int i=0;i<10;i++){ // when i is 0 and lesss than 10 add 1 to i 
     p += 35;               // sets space between text downwards
     
     if(mouseX>x && mouseX<=x+50){ // when mouseX is greater than 0 and less than or equal to 50
        
       
        text(name[i]+" " + population[i] + " population", 220, p); //displays the population and town or city at 220 on x  and 65 y
        
  
   
       fill  (random(255));// colour of which the rects flash on and off black/grey
   

     }
       
     
    float t = map(population[i], 4900,1300000,10,400); //in order for data to fit in screen i added more to the larger amount and a little less to the lower amount of population 

     rect(x,height-t,30,t);// order in which the rects grow from top to bottom
     
      x+=50; //space between each rect so as they dont overlap each other
      
      fill(255);// colour of text and rects white 
  }
  
}


