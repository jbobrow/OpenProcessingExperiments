
Pimage cosby;
Pimage cosby2;
void setup() {  //setup function called initially, only once
  size(750, 750);
  background(0,0,0);  //set background white
cosby = loadImage("http://s2.postimg.org/hpl7jbp7d/received_713357532031439.jpg");
cosby2 = loadImage("http://s15.postimg.org/3lq7q5b6z/received_10201372690414670.jpg");
}

void draw() {  //draw function loops 
  image(cosby,0,0);

 if (mousePressed == true) {

    image(cosby2,0,0);

  } else {

    fill(255);

  }
} 
