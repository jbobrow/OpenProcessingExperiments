
void setup(){
  
  smooth();

  size(400,400);  
  background(0);
 
}


void draw(){
  
 stroke(255);

for(int i=0; i < width; i =i + 58){
 for(int j=0; j< height; j = j +58) { 
  //oben
 line(i+20,j+5,i+25,j+10);
 line(i+25,j+10,i+30,j+5);
 
 //links
 line(i+5,j+20,i+10,j+25);
 line(i+10,j+25,i+5,j+30);
 
 //rechts
 line(i+45,j+20,i+40,j+25);
 line(i+40,j+25,i+45,j+30);
 
 //unten
 
 line(i+20,j+45,i+25,j+40);
 line(i+25,j+40,i+30,j+45);
 
 line(i+0,j+25,i+50,j+25);
 line(i+25,j+0,i+25,j+50);
 line(i+10,j+10,i+40,j+40);
 line(i+10,j+40,i+40,j+10);
 
 noFill();
 strokeWeight(1.5);
  rect(i+15,j+15,20,20);
 
 ellipse(i+0,j+0,2,2);
 
}
}}
