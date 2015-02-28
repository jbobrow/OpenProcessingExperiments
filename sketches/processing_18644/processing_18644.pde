
float counter=10;
float counterMax=10;

void setup(){
  size(250,250);
  background(0);
  smooth();
}

void draw(){
  
 //thick orange
  strokeWeight(5);
  stroke(200,30,0);
  point(230,random(250));
  
 //orange
  strokeWeight(2);
  stroke(160,40,0);
  point(210,random(250));
  
 //horizontal red
  strokeWeight(1.5);
  stroke(140,10,0);
  point(random(250),30);
 
 //green 
  strokeWeight(1);
  stroke(140,900,0);
  point(180,random(250));
  
  fill(0);
  stroke(40,70,95);
 
  strokeWeight(4);
  ellipse(random(250),230,30,30);
  
  strokeWeight(1);
  ellipse(random(250),130,15,15);
  ellipse(random(250),140,10,10);
  ellipse(random(250),150,5,5);
  
  ellipse(random(250),200,15,5);
  ellipse(random(250),79,10,5);
  ellipse(random(250),12,5,5);
  
  strokeWeight(2);
  rect(random(250),55,20,20);
 strokeWeight(0.5);
  rect(random(250),108,10,10);
  rect(random(250),143,5,5);
  rect(random(250),101,5,5);
 
  if(counter<counterMax){
        counter++ ;    
    }
  else{
    counter=1;
  }
}
    



