
PImage[] img = new PImage[119]; //Array that will contain 120 images

void setup() {
  size(480,360);
  String number;
  for (int i = 0 ; i < img.length ; i++) { //Iteration to load all the images at once
    number = nfs((119-i),3);
    img[i] = loadImage("tomatoes"+trim(number)+".jpg");
  }

}



void draw() {
 int pos;
 pos = (int)map(mouseX,0,width,0,119); //The mouseX determines which image will be used
 image(img[pos],0,0);
}

//photos belong to Youtube user therealbeale http://youtu.be/Ze8NV7cvW8k


