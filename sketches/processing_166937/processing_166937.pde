
int[] xCoord = new int[50];
int[] yCoord = new int[50];
float[] speed = new float[50];
char[] letter = {
  'й', 'ф', 'л', 'ж', 'ц', 'к', 'э', 'б', 'ю','л','щ','у','ч'
};

void setup(){
  size(600,400);
  background(0);
  for (int i = 0; i < xCoord.length; i++) {
    xCoord[i] = i*width/50;
    yCoord[i] = (int)random(-height, 0);
    speed[i] = random(2,7);
  }
}

void draw() {
  frameRate(30);
  fill(0,10);
  rect(0,0, width, height);
  for (int i = 0; i < xCoord.length; i++) {
    fill(10, 255, 10);
    int j = (int)random(0,letter.length-1);
    text(letter[j], xCoord[i], yCoord[i]);
    yCoord[i] += speed[i];
    if(yCoord[i] > height){
      yCoord[i] = 0;
    }
  }
}


