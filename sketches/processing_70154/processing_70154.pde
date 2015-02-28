
int myWidth;
String myWord;


void setup(){
  noStroke();
  background(0,0,0);
  size(500, 300);
  myWidth= 80;
  myWord= "city";
  myWord= "scape";
  
  
}

void draw(){

//moon  
fill(255,255,255); 
ellipse(myWidth, 100, 50, 50);

if (keyPressed){
    if (key == 'e')
    ellipse(myWidth, 100, 100, 100);
 }

else{
  ellipse(myWidth, 100, 50, 50);
 }
 
fill(255,255,255); 
ellipse(myWidth, 100, 50, 50);
  
  
//stars
if (keyPressed){
    if (key == 'd')
    fill(50,0,150);
    myWord= "city";
}

else{
  fill(150,150,0);
  
  }
  
  ellipse(150,150,10,10);
  ellipse(50,50,10,10);
  ellipse(250,100,10,10);
  ellipse(400,40,10,10);
  ellipse(330,120,10,10);
  ellipse(450,180,10,10);
  
//building 1
  fill(100,100,100);
  rect(200,200,50,350);
  rect(150, 220, 150, 100);
  
//building 2
  fill(60,60,60);
  rect(30, 230, 90, 70);
  rect(50, 200, 50, 50);
  
//building 3
  fill(80,80,80);
  rect(350, 250, 110, 70);
  rect(370, 220, 70, 50);  
  
//spire  
  rect(220, 100, 5, 100);
  fill(255,0,0);
  rect(220, 100, 5, 5);
  

//window color change
if (mousePressed){
    fill(0,0,0);
    myWord= "scape";
}

else{
  fill(150,150,0);
  
  }
  
//windows bldg 1
  rect(160, 240, 30, 50);
  rect(210, 240, 30, 50);
  rect(260, 240, 30, 50);
  
//windows bldg 2
  rect(50, 240, 10, 30);
  rect(70, 240, 10, 30);
  rect(90, 240, 10, 30);
  
//windows bldg 3
  rect(380, 260, 20, 40);
  rect(410, 260, 20, 40);


  
}
