
PImage img1;
PImage img2;

void setup() {
  size(750, 558);
  img1 = loadImage("bus.jpg");
  img2 = loadImage("headphones.png");
}

void draw() {
  imageMode(CENTER); 
  image(img1, width/2, height/2);  

  //1st column
  noStroke();
  fill(46, 220, 240, 150);
  rect(0, 0, 150, 186, 7); 

  noStroke();
  fill(220, 46, 240, 150);
  rect(0, 186, 150, 186, 7); 

  noStroke();
  fill(20, 255, 150, 150);
  rect(0, 372, 150, 186, 7);   

  //2nd column
  noStroke();
  fill(20, 255, 150, 150);
  rect(150, 0, 150, 186, 7);

  noStroke();
  fill(210, 255, 0, 150);
  rect(150, 186, 150, 186, 7);  

  noStroke();
  fill(20, 255, 200, 150);
  rect(150, 372, 150, 186, 7);

  //3rd column
  noStroke();
  fill(100, 70, 5, 150);
  rect(300, 0, 150, 186, 7);

  noStroke();
  fill(0, 205, 255, 150);
  rect(300, 186, 150, 186, 7);  

  noStroke();
  fill(255, 165, 50, 150);
  rect(300, 372, 150, 186, 7); 

  //4th column
  noStroke();
  fill(220, 5, 150, 150);
  rect(450, 0, 150, 186, 7);

  noStroke();
  fill(80, 25, 250, 150);
  rect(450, 186, 150, 186, 7);  

  noStroke();
  fill(20, 255, 150, 150);
  rect(450, 372, 150, 186, 7);   

  //5th column
  noStroke();
  fill(20, 255, 150, 150);
  rect(600, 0, 150, 186, 7);

  noStroke();
  fill(20, 255, 0, 150);
  rect(600, 186, 150, 186, 7);  

  noStroke();
  fill(170, 55, 220, 150);
  rect(600, 372, 150, 186, 7);  


  imageMode(CENTER); 
  image(img2, 75, 100); 

  imageMode(CENTER); 
  image(img2, 75, 280);

  imageMode(CENTER);
  image(img2, 75, 460); 

  imageMode(CENTER);
  image(img2, 225, 100);     

  imageMode(CENTER); 
  image(img2, 225, 280); 

  imageMode(CENTER);
  image(img2, 225, 460); 

  imageMode(CENTER);
  image(img2, 375, 100);  

  imageMode(CENTER);
  image(img2, 375, 280);  

  imageMode(CENTER);
  image(img2, 375, 460);  

  imageMode(CENTER);
  image(img2, 525, 100); 

  imageMode(CENTER);
  image(img2, 525, 280); 

  imageMode(CENTER);
  image(img2, 525, 460);    

  imageMode(CENTER);
  image(img2, 675, 100);    

  imageMode(CENTER);
  image(img2, 675, 100);     

  imageMode(CENTER);
  image(img2, 675, 280); 

  imageMode(CENTER);
  image(img2, 675, 460); 
  fill(180, 0, 200, 100);

  String s = "the #iUNPLUG act";
  textSize(35);
  fill(255);
  text(s, 370, 335, 700, 180);  // Text wraps within text box
}



