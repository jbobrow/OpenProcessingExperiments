
//Carolina Tamayo
//Introduction to Digital Media Fall 2012
//Section B
//9.13.12

int randomBlue = 0; 
boolean boolGrowing = false; 
int col=0;



void setup() {

  size(1200, 600);
 smooth(); 
 colorMode(HSB);
 rect(0,0, width,height); 

}




void draw() {
  
   fill(0,15);
    rect(0,0, width,height);

  if (boolGrowing) {  
    if (col == 100) {
      col++;
      
    }
    else {
      col = 0;
    }
  }
  
  
  smooth();     
  randomBlue = int(random(255)); 
  fill(127,80,randomBlue);  
  
translate(550,250);

    
noStroke();
   quad(mouseX, mouseY, 86, 20, 39, 13, 30, 16);

rotate(PI/3.0); 
noStroke();
  quad(mouseX, mouseY, 86, 20, 39, 13, 30, 16);
 
 rotate(PI/3.0); 
noStroke();
   quad(mouseX, mouseY, 86, 20, 39, 13, 30, 16);
   
 rotate(PI/3.0); 
noStroke();
 quad(mouseX, mouseY, 86, 20, 39, 13, 30, 16);
 
 rotate(PI/3.0); 
noStroke();
 quad(mouseX, mouseY, 86, 20, 39, 13, 30, 16);
 
 rotate(PI/3.0); 
noStroke();
    quad(mouseX, mouseY, 86, 20, 39, 13, 30, 16);
    

    
 
}

void mouseClicked() {
  boolGrowing=!boolGrowing; 
  
 
}



void mousePressed(){
col+=50;
col%=500;
println(col);
fill(randomBlue);
ellipse(10,10,400,400);

}


void keyPressed(){
if(key == 's'){
save("CarolinaTamayo.png");
}


}
