
void setup()

{  

size(400,600);

  background(0,0,0);  

smooth(); 

 frameRate(4);
}

void draw()

{  

fill(0,0,0,95); 

 rect(0,0,width,height);
  //noStroke();  

stroke(255,255,255);

  strokeWeight(5);  

//fill(255,0,0);
  //ellipse(mouseX,mouse Y,mouseX,mouseY);

  point(random(width),random(height)); 

 point(random(width),random(height));

  point(random(width),random(height));  

fill(random(255),random(255),random(255)); 

 textAlign(CENTER); 

 textSize(20);  
text("Happy Birthday Grandma Vera And I Will Always Love You Forever Grandma",random(width),random(height));

}
