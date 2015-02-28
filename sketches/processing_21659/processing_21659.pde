
PImage img;
  
void setup() {
  size(450, 345);
  img = loadImage("stars.jpg");
}
  
  
void draw() {

    image(img, 0, 0);
    loadPixels();
  
    for(int x=0;x<(width*height);x+=1){
      color b=pixels[x];
      if(b<=color(mouseX)){
          color a=color(noise(x/width,0,x/width-x/width),mouseY,mouseY);
          pixels[x]=a;
        }else{
          color a=color(noise(x*width),255,(x/width)*255);
          pixels[x]=a;
        }
      
    }
    
    updatePixels();
    strokeWeight(3);
    stroke(255);
    line(0,15,450,15);
    line(15,0,15,345);
    
    ellipse(mouseX,15,5,5);
    ellipse(15,mouseY,5,5);
   
  
}


