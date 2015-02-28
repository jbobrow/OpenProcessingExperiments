
//Sable E. Smith
// Text from wikipedia..
//images of black people pulled form the web
//source code creativty & computation class exercise


PImage testPhoto; //sets image varibale
float[] picValues = new float[720];  //sets up an array new float and [664] allocates memory to the array
float[] clickedValues = new float[300];  //sets up an array ""




int counter;
color currentColor; //color can hold 3 values clearly RGB

void setup() {
  background(0);
  size(800, 720);
  testPhoto = loadImage("blackcolor7in7.jpg", "jpg");

  //  In case you want to pull a file from a URL, here is an example
  //  String url = "http://your-image-url-here.jpg";
  //  testPhoto = loadImage(url, "jpg");

}

void draw() {
  background(0);
  image(testPhoto, 0, 0);
  loadPixels();
  currentColor = pixels[mouseX+mouseY*width]; //takes the color varible and fills it with pixels...
  fill(currentColor);
  rect(mouseX, mouseY, 100, 100);
  
  grabColors();

}


void grabColors() {
    //pull the pixel values from image and store them in separate array
  for (int i=0; i<662; i=i+3) {
    //pixels already has all of the image values stored
    color thisPixel = pixels[i+i*width];
    picValues[i] = red(thisPixel);
    picValues[i+1] = green(thisPixel);
    picValues[i+2] = blue(thisPixel);

  }
  
   PFont ArialBlack;
  ArialBlack = loadFont("Arial-Black-32.vlw");
 
  textFont(ArialBlack, 32);
  fill(200,0,100,80);
  text("The term black people is used in systems  ", 20, 30);
 
  textFont(ArialBlack, 20);
  text("of racial classification for humans of", 20,60 );
 
  textFont(ArialBlack, 25);
  text("a dark skinned phenotype, relative to other racial", 20, 90 );
 
   textFont(ArialBlack, 20);
  text("groups. Different societies apply different criteria regarding who ", 20, 120 ); 
 
   textFont(ArialBlack, 25);
  text(" is classified as 'black', and often social variables", 20, 150);
 
   textFont(ArialBlack, 20);
  text("such as class, socio-economic status also plays", 20, 180 );
 
   textFont(ArialBlack, 25);
  text("a role so that relatively dark skinned people ", 20, 210 );
 
   textFont(ArialBlack, 20);
  text("can be classified as white if they fulfill", 20, 240);
 
   textFont(ArialBlack, 25);
  text(" other social criteria of whiteness and relatively light", 20, 270);
 
   textFont(ArialBlack, 20);
  text(" skinned people can be classified as black if ", 20, 300);
  
   textFont(ArialBlack, 27.5);
  text("they fulfill the social criteria for blackness. As", 20,330 );
  
   textFont(ArialBlack, 20);
  text(" a biological phenotype being 'black' is often associated ", 20,360);
  
   textFont(ArialBlack, 25);
  text("with the very dark skin colors of some", 20, 390);
  
   textFont(ArialBlack, 26);
  text("people who are classified as 'black'. But, particularly", 20, 410);
  
   textFont(ArialBlack, 25);
  text("in the United States, the racial classification also", 20, 440 );
   
    textFont(ArialBlack, 30);
  text("refers to people with all possible kinds of ", 20, 470 );
  
   textFont(ArialBlack, 25);
  text("skin pigmentation from the darkest through to the", 20, 500);
  
   textFont(ArialBlack, 27);
  text("very lightest skin colors, including albinos, if they", 20, 530);
  
   textFont(ArialBlack, 25);
  text("are believed by others to have African ancestry", 20, 560 );
  
   textFont(ArialBlack, 20);
  text(" and exhibit cultural traits associated with being 'African-American'. ", 20, 590 );
  
   textFont(ArialBlack, 20);
  text("Therefore, the term 'black people' is not an", 20, 610 );
  
   textFont(ArialBlack, 28);
  text(" indicator of skin color but of racial classification.", 20, 640);

  
  println("Did you find the black yet?");

}

 
 

