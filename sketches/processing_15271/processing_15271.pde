
int fuck;
int putain;
float love;
float amour;

void setup(){
  size(800,450);
  background(255);
  fuck=7;
  putain=15;
}

void draw(){
  stroke(0,0,0,0);
  love=random(650);
  amour=random(400);
  ellipse(40,200,love,love);
  ellipse(60,300,amour,amour);
  ellipse(300,100,love,love);
  ellipse(420,160,love,love);
  ellipse(600,50,amour,love);
  ellipse(500,250,love,love);

  ellipse(600,300,love,love);
  
  
  while(fuck<450){
   stroke(random(255),random(255),0,random(255));
    line(0,fuck,800,fuck);
    fuck=fuck+7;
}
    fuck=0; 


  while(putain<800){
   stroke(random(255),random(255),random(255),15);
    line(putain,0,putain,450);
    putain=putain+15;
}
    putain=0; 
   
   
   
}
                
                
