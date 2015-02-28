
//this is the first practice in class,which is an example work of Mondrian.
//Chang,Kuo-Ping from department of ID 

void setup(){
   size(600,600);
   background(225);
}

void draw(){
noStroke();
fill(200,0,0);
rect(0,0,278.5,225);  


fill(255,255,0);
rect(0,375,64.3,225); 

fill(0,0,225);
rect(278.5,375,192.8,200); 

stroke(0);
strokeWeight(12);
line(0,225,600,225);     //horizontal
line(0,375,600,375);   //horizontal
line(281,570,468,570);  //horizontal

strokeWeight(8);
line(278.5,0,278.5,600);  //vertical
line(64.3,375,64.3,600);   //vertical
line(471.3,375,471.3,600);   //vertical


}


