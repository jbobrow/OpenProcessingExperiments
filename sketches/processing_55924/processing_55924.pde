
//declaring and initailize object array
Tweet[] tweet = new Tweet[50];

PImage bg;

void setup() {
  size(1024, 768);
  frameRate(30);
  smooth();
  bg = loadImage("heatmap.jpg");
  
  
  String[] dataOutput = new String[tweet.length];
  
  //create randomized values for our array of circles
  for (int i = 0; i < tweet.length; i++) {
    
    float x = random(width); 
    float y = random(height);
    float r = random(100);
    color c = color(80, 247, 184);
    
    dataOutput[i] = x + "," + y + "," + r + "," + c;
    
    
    //Circle(float x_, float y_, float r_, color c_) 
    tweet[i] = new Tweet(x, y, r, c);
    
  }
  
  saveStrings("data/data.txt", dataOutput);
  println("data has been saved to textfile");
  
}

void draw() {
  
  background(bg); 
  
  //display circles 
  for (int i = 0; i < tweet.length; i++) {
   
   tweet[i].display(); 
  }
  
}

