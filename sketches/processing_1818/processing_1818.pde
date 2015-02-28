
PImage img;
int h;

void setup(){
  smooth();
  //Load Image

  h = 0;
  img = loadImage("image01.jpg");
  //image(img, 0, 0);

  //setup
  size(100,100);

  fill(0,0,0);
  //rect(0,0,width,height);
  loadPixels(); // loads into pixels[]
  background(0,100,0);
}



void draw(){

  // image(img, 0, 0);
  //variables
 
  h = 0;



  for(int y = 0; y< height; y++){
    for(int x = 0; x<width; x++){

      int p;
      p =  x + y*width;
      
    //  println(color(img.pixels[p]));
      
    
   if(pixels[p]==img.pixels[p]){
      h++;
     //color a = img.get(x, y);
     //stroke(255);
     //point(x,y);

    }
    else if(pixels[p]!=img.pixels[p]){
      //stroke(random(255),random(255),random(255));
      //point(x,y);
      pixels[p] = color(random(255),random(255),random(255));
    }
   
  }
  }

  println(h + " OUT OF " + img.pixels.length + " PIXELS HIT!");
  float percent;
  percent = (h/img.pixels.length)*100;
  println(percent + "% ");
 updatePixels();
if (h==img.pixels.length){
rect(0,0,width,height);}
}




