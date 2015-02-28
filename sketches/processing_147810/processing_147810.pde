
PImage img;
color c ;

void setup() {
  size(400,300);
 img = loadImage("dog2.jpg");
}

void draw(){
  //tint(c);
  //get color from the specific pixel)
  //c = get (mouseX, mouseY);
  image(img,0,0, width, height);
  
  //for (init; )
  // increment by one
  //i = i +1;
  // i + = 1;
 
 for(int i = 0; i < mouseY; i++ ){
 c = img.get (mouseX, i);
 stroke(c);
 line(width, i, mouseX, i); 
 // fill(c);
  //rect(0,0,40,40);
 }

}


