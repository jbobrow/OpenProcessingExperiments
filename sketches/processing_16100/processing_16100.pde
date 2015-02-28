
/*
Resample Painting
by James Patrick Gordon

*/

PImage img;
PImage output;
ArrayList colors;
int i=0;
int j = 0;

void setup(){
  img = loadImage("kitty.jpg");
  size(img.width, img.height);
  colors = new ArrayList();
  for(int x = 0; x < img.width;x++){
    for(int y = 0; y < img.height; y++){
      //println(colors.get(i));
      color currColor = img.pixels[i];
      colors.add(currColor);
      i++;
    }
  }
  println(i);
  output = createImage(width, height, ARGB);
  for(int z = 0; z < img.pixels.length; z++){
    j = (int)random(colors.size());
    output.loadPixels();
    output.pixels[z] = (Integer)colors.get(j);
    //colors.remove(j); //This line kills performance, only run this if you've got a powerful computer and some time to kill
   }
}

void draw(){
  //image(img,0,0); //draw the original image instead
  image(output,0,0); //draw the output
  
}

