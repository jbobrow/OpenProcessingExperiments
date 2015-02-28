
PImage img;
color c;


void setup(){
  size(400, 267);
  img = loadImage("dog1.jpg");
}

void draw(){
  
  
  //c = get(mouseX, mouseY);
  
  image(img, 0, 0, width, height);
  println(c);
  
  
  
  // i = i + i;
  // i += 1;
  // i++;
  for(int i = 0; i < height; i += 5){
    c= img.get(mouseX, i);
    
    stroke(c);
    strokeWeight(5);
    line(width, i, mouseX, i);
  }
  
  
  
  //fill(c);
  //rect(0, 0, 40, 40);

}


