
PImage img;
int w, h;
int num=1;
void setup(){
  img = loadImage("http://i133.photobucket.com/albums/q59/jfulkerson0032/11/tv-set-fuzzy-yeeessso.gif");
  w = img.width * 2;
  h = img.height * 2;
  size((int)w*2,(int)h*2);
  background(0);
  colorMode(HSB,360,100,100);
  
}

void draw(){
  for(float y=0; y<height; y+=(h/num)){
      for(float x=0; x<width; x+=(w/num)){
        image(img,x,y,(w/num),(h/num));
        tint(random(0,360),65,255);
        
      }
  }
  

}

void mousePressed(){
  if(num<1) return;
  num++;
  background(0);
}int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
