
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  frameRate(15);
  float x =0;
  float y =0;

}
float x =0;
float y =0;

void draw() {  //draw function loops 
  
  if(mousePressed == true) { //add some interaction
    //ellipse(mouseX, mouseY, 20, 20);
    stroke(0,random(255),200)
    strokeWeight(0);
    
   if(y==0)          //if x should be increasing, increase x
        x++;
   else
       x=x-1;        //otherwise, decrease x
        
   if(x>=20)         // once x hits 50, set y to 1 so that x will start to decrease
        y=1;
   if(x<=0)
       y=0;
    line(mouseX-random(25)+random(25),mouseY-random(25)+random(25),pmouseX,pmouseY);
    strokeWeight(random(x-5,x+5));
    stroke(0)
    line(mouseX,mouseY,pmouseX,pmouseY);
    



  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
    
  }
}

void keyPressed(){
   if(key=='s'){
      saveImage();
 }
   if(key=='z'){
  background(255);
}
   if(key=='b'){
filter(BLUR);
}
}
void saveImage() {
  String fileName = timeStamp()+".tiff";
  PImage imageSave = get(0, 0, width, height);
  imageSave.save(fileName);
}

