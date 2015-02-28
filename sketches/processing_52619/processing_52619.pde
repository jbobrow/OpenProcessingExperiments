
//PS1: Question 6
//Kim Sipkens 

void setup()  {
  size(300, 300);
  
}

void draw()  {
  background(255);
  
  for (int i=0; i < width; i += 10)  {
    line(i, 0, i, height);
    

    for (int straight=0; straight < width; straight += 10) {
    line( straight, 0, 0, straight );
    line( straight, height, width, straight );
   
   strokeWeight(5);
fill(0);
int counter = 10;
while(counter < height) {
rect(width/5.9, counter, 200, 30);

counter = counter +50; 
}

smooth();
fill(255);
int counter3 = 25;
while(counter3 < height) {
  ellipse(width/2, counter3, 50, 50);
 
  counter3 = counter3 +50; //+5 is the spacing!!!!



  }
}

}

}

