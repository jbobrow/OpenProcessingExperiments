


void setup() {
  size(600,600,P3D);//set up the size of the image and 3D ball
  background(0);//colour the background
}



void draw() {

    background(0);//set background color to black
    noFill();//no fill



    stroke(mouseX*0.5,120,mouseY*0.5,200);//the color of the first ellipse
    strokeWeight(2);//set the stroke weight to 2

    ellipse(300,300,500,150);//draw the first circle
    stroke(mouseX*0.5,mouseY*0.5,120,200);//the color of the second ellipse
    strokeWeight(4);//set the stroke weight to 4
    ellipse(300,300,200,300);//draw the second circle
    stroke(mouseY*0.5,mouseX*0.5,120,200);//the color of the third ellipse
    strokeWeight(5);//set the stroke weight to 5
    ellipse(300,300,150,400); //draw the third circle




  stroke(255);//set the stroke color of the sphere to white.
  fill(random(100,255),random(0,255),random(100,0));

  lights();//set a default light
  translate(300,300,0);//move the sphere to the center of the canvas
  rotateY(mouseX*0.01);//rotate the sphere based on mouse movement
  rotateX(mouseY*0.01);//rotate the sphere based on mouse movement
  sphere(50);//draw the sphere


  stroke(255);//set the stroke color of the sphere to white.
  fill(random(100,255),random(0,255),random(100,200));
  lights();//set a default light
  translate(300,300,0);//move the sphere to the center of the canvas
  rotateY(mouseX*0.01);//rotate the sphere based on mouse movement
  rotateX(mouseY*0.01);//rotate the sphere based on mouse movement
  sphere(50);//draw the sphere
}


void keyPressed() {


  if (key == 's') {//if the last key pressed was s
    save("ball" + millis() + ".jpg");//save as a jpg file
  }
}


