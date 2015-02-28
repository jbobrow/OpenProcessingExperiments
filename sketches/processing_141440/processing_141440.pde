
PImage img;
float ran = 0;
void setup() {
  background(255);
  size(800, 400);
  
  String url = "http://www.bozeman-magpie.com/article_images/embedded/images/normal_buffalo%20herd%2024x36%20240dpi.jpg";
  img = loadImage(url, "jpg");
}

void draw() {
 int mapVal;
  for (int i = 0; i < 400; i += 50) {
    mapVal = int(map(random(ran), 0, 1, 0, height));
    
    
    
    copy(img, 0,mapVal,900,50,0,i,width,50); 
  }
  tint(255, random(0,126));
  image(img, -100, -150, 900, 563);
  ran += 0.01;
}
