
 String[] wages; //declare txt data
 PImage myMap; //declare image
    float oldTime=0;
    float oldSalary=0;
void setup(){
  size(700,600);
  background(0);
  smooth();
  
    //MAP IMAGE
  myMap= loadImage("california map.png");
  image(myMap,0,0);
  
  
  wages=loadStrings("data.txt");
  for(int i = 0 ; i < wages.length; i++){
    String[]pieces = split (wages[i],",");
    float time = parseFloat(pieces[0]);
    float salary = parseFloat(pieces[1]);
    stroke(0);
    //line (map(oldTime,2000,2011,10,590),map(time,2000,2011,10,590),map(oldSalary,46489,80675,40,690), map(salary,46489,80675,40,690));
    
    oldTime = parseFloat(pieces[0]);
    oldSalary = parseFloat(pieces[1]);
if (i <= 11) {
  fill(46,92,216);
}
if (i>11 && i<=22) {
  fill(29,124,51);
}
if (i>22) {
  fill(124,29,35);
}
ellipse((-1*map(time,2000,2011,10,590))+height, map(salary,46489,80675,40,690), 5, 5);
 
 

  }

}
void draw(){
  fill(46,92,216);
  textSize(18);
  text("Alameda County",500,70);
  
  fill(29,124,51);
  text("San Mateo",500,250);
  
  fill(124,29,35);
  text("San Francisco",500,270);
 
 fill(0);
 textSize(20);
 text("Employment Wages from 2001 - 2011", 20,75);
 
  
  //line(150,25,mouseX,mouseY);
}
//Make act for data when mouse is over specific location

 // if(mouseX>300&&mouseX<500&&mouseY>550&&mouseY<650){
//  arc(400,600,200,200,0,radians(360*.625));
//  }
 // arc(400,600,100,100,0,radians(360*.625)); 

