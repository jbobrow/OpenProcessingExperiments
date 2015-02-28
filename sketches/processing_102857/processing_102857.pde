
int counter, countImg;
boolean click;

void setup() {  //setup function called initially, only once
  size(400, 400);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0; 
  countImg = 0;
  click = false;
  imageMode(CENTER);
  img_yes = loadImage("yes.png");
  img_no = loadImage("no.png");
  img_sun = loadImage("sun.png");
  img_star = loadImage("star.png");
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);

  if (click) { //add some interaction
    if (dist(mouseX, mouseY, width/2, height/2)<100){
         countImg++;
         switch (countImg%2) {
           case 0: if (mouseButton == LEFT) { image(img_no, mouseX, mouseY); } 
                   else if (mouseButton == RIGHT) {image(img_yes, mouseX, mouseY);}
                   break;
           case 1: if (mouseButton == LEFT) { image(img_sun, mouseX, mouseY); } 
                   else if (mouseButton == RIGHT) {image(img_star, mouseX, mouseY);}
                   break;
        }
    } else {
      ellipse(mouseX, mouseY, 20, 20); 
    }
    click = !click;
  } else {
    ellipse(width/2-50, height/2+50, 100*sin(counter), 100*sin(counter));
    ellipse(width/2+50, height/2-50, -100*sin(counter), -100*sin(counter));
    rect(width/2, height/2, 100*sin(counter), 100*sin(counter));
  }
}

void mouseClicked() {
  click = true;
}


