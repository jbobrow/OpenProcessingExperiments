
void setup(){
 
 // set background
 size(600, 600);
 background(255);
 
 noStroke(); 
 fill(164, 199, 57);
 
 // head
 arc(290, 143, 180, 120, PI, TWO_PI);  
 
 // body
 rect(200, 150, 180, 150, 0, 0, 25, 25);

 // arms
 rect(158, 150, 35, 100, 15);            
 rect(387, 150, 35, 100, 15);          
 
 // legs
 rect(235, 300, 35, 65, 0, 0, 25, 25);
 rect(310, 300, 35, 65, 0, 0, 25, 25);
 
 // eyes
 fill(255, 255, 255);
 ellipse(250, 115, 15, 15);
 ellipse(330, 115, 15, 15);
 
 // antenna
 stroke(164, 199, 57);      // change stroke for line
 strokeWeight(8);
 line(270, 100, 250, 60); 
 line(310, 100, 330, 60); 
 
}


