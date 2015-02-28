
PImage img;
PImage wallet;
PImage kamra;
PImage keyy;
PImage iphone;
PImage cat;
PImage dog;




import simpleML.*;
HTMLRequest r;
String html = "";

boolean gotnew = false;

int fps = 10;

int dogs = 0;
int cats = 0;
int wallets = 0;
int kamras = 0;
int keys = 0;
int iphones = 0;


float startTime;

float x = 0;
int interval = 84600000;
//float jump = w/(fps*interval/1000);


void setup() {
  size(1200,926);
  // Make a new instance of a PImage by loading an image file
      img = loadImage("Chicago.jpg");
  image(img,0,0);
  
  imageMode(CENTER);
  frameRate(fps);
  
  r = new HTMLRequest(this,"http://chicago.craigslist.org/chc/laf/");
  r.makeRequest();
  
cat = loadImage("cat.gif");
dog = loadImage("dog.gif");
wallet = loadImage("wallet.gif");
kamra = loadImage("camera.gif");
keyy= loadImage("keys.gif");
iphone= loadImage("iphone.gif");
}

void draw() {
  
  float now = millis();
  
   if(now > startTime + interval) {
      r.makeRequest();
      startTime = now;
   }
 if (gotnew) {
   gotnew=false;
   
    cats = getMatchCount("cat", html);
    cats += getMatchCount("Cat", html);
    cats += getMatchCount("CAT", html);
    cats += getMatchCount("kitten", html);
    dogs = getMatchCount("dog", html);
    dogs += getMatchCount("Dog", html);
    dogs += getMatchCount("DOG", html);
    dogs += getMatchCount("puppy", html);
    wallets = getMatchCount("wallet", html);
    wallets += getMatchCount("Wallet", html);
    wallets += getMatchCount("WALLET", html);
    kamras = getMatchCount("camera", html);
    kamras += getMatchCount("Camera", html);
    kamras += getMatchCount("CAMERA", html);
    keys = getMatchCount("keys", html);
    keys += getMatchCount("Keys", html);
    keys += getMatchCount("KEYS", html);
    keys += getMatchCount("KEYS",html);
    iphones = getMatchCount("iPhone", html);
    iphones += getMatchCount("Iphone", html);
    iphones += getMatchCount("IPhone", html);
    iphones += getMatchCount("iphone", html);
    iphones += getMatchCount("IPHONE", html);
    iphones += getMatchCount("iPHONE", html);
    iphones += getMatchCount("iPhone", html);
    println("Cats: "+cats);
    println("Dogs: "+dogs);
    println("Wallets: "+wallets);
    println("Cameras: "+kamras);
    println("Keys: "+keys);
    println("iPhones: "+iphones);
    
    
            for(int i = 0; i < iphones; i++){
     image(iphone, random(width), random(height));
   }  
 
      for(int i = 0; i < cats; i++){
  image(cat,random(width), random(height));
   }
     for(int i = 0; i < wallets; i++){
     image(wallet, random(width), random(height));
   }  
     for(int i = 0; i < kamras; i++){
     image(kamra, random(width), random(height));
   }  
   for(int i = 0; i < dogs; i++){  
  image(dog,random(width), random(height));
 }
           for(int i = 0; i < keys; i++){
     image(keyy, random(width), random(height));
   }  
  
  
  // use getMatchCount() (copy from below) to count instances of
    // the first argument in the second (in our case, "Romney" or
    // "Obama" in the html we grabbed.  html is set in netEvent()

    
}
   }

void netEvent(HTMLRequest r) {
  html = r.readRawSource();
  gotnew = true;
}
 
// a simple function to find how many times string 'find'
// occurs in string 's'.  copy and use!
int getMatchCount(String find, String s) {
  int m = s.split(find).length;
  return m - 1;
}


