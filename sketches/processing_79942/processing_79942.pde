
 String[] wages; //declare txt data
 
 void setup(){
  size(500,600);
  background(0);
  smooth();

 }

void draw(){
//Alameda County
  fill(46,92,216);
  textSize(18);
  text("Alameda County",10,70);


  //San Mateo County
  fill(29,124,51);
  text("San Mateo",10,270);
  
  
  //San Francisco
  fill(124,29,35);
  text("San Francisco",10,420);
  
   
 fill(255);
 textSize(20);
 text("Employment Wages from 2001 - 2011", 20,25);
 
 
 
  wages=loadStrings("data.txt");
  for(int i = 0 ; i < wages.length; i++){
    String[]pieces = split (wages[i],",");
    float time = parseFloat(pieces[0]);
    float salary = parseFloat(pieces[1]);
    stroke(0);
    if (i<10)
    {
    rect (20,100+i*8,map(salary, 0, 80675, 0, 450) ,6); 
    }
      if (i>10 && i<20)
    {
    rect (20,200+i*8,map(salary, 0, 80675, 0, 450) ,6); 
    }
    if (i>20)
    {
    rect (20,280+i*8,map(salary, 0, 80675, 0, 450) ,6); 
    }
}
 
}


