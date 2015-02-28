
size (300, 300);
background (255);



for (int x=50; x<width-45; x+=20) {//sets x spacing
  for (int y=50; y<=height-50; y+=20) {//sets y spacing
    for (float z=random(10,200);z<=height;z+=20) {//this commands the color 
    //choice within the entire composition.

      stroke(0);
      strokeWeight(1);
      fill(z, y, x,80);
      ellipseMode(CENTER);
      ellipse(x, y, 20, 20);
    }
  }
}
//line (15,0,15,100); //checking the placement of first circle


