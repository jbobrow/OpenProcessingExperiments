
/*
Konkuk University
SOS iDesign

Name: Lee Ye Lyn
ID: leeyeaa

*/

int value = 0;

void setup(){
size (600, 600);
 //noLoop();
smooth();
colorMode (RGB);
//background(0);

}

void draw(){

println(mouseX + " : " + mouseY);//image (img, 0, 0); 
  
  
fill(51,51,51);  
noStroke();  

triangle(71,62,83,296,219,162);
triangle(529,62,517,296,381,162);



ellipse(300,300,450,400);

fill(255,134,121);
 bezier(245,342,263,427,346,427,355,342);
if(mousePressed){
    fill(255,134,121);
    bezier(232,363,266,469,350,475,369,365);    
}
    

fill(88);
ellipse(250,350,100,90);
ellipse(350,350,100,90);

fill(255,199,193);
quad(278,312,300,300,322,312,300,343);



fill(255,255,255);
arc(180, 230,150,150, 0, PI);
arc(420, 230,150,150, 0, PI);

fill(0);
bezier(180,229,168,244,167,282,180,299);
bezier(180,229,188,235,185,283,180,299);    

bezier(420,229,410,238,411,282,420,299);    
bezier(420,229,424,240,426,280,420,299);   




 if(mousePressed){
bezier(180,229,149,239,155,285,180,299);
bezier(180,229,210,241,204,289,180,299);    

bezier(420,229,380,240,386,289,420,299);    
bezier(420,229,450,237,451,286,420,299); 

fill(random(255),155,200);
bezier(180,229,168,244,167,282,180,299);
bezier(180,229,188,235,185,283,180,299);    
bezier(420,229,410,238,411,282,420,299);    
bezier(420,229,424,240,426,280,420,299); 

triangle(71,62,83,296,219,162);
triangle(529,62,517,296,381,162);



 translate(mouseX, mouseY);
fill(random(255),155,255,127);
  stroke(255);
  strokeWeight(2);
  ellipse(0,0,50,50);


 }
    
  

}

void keyPressed(){
  
}

