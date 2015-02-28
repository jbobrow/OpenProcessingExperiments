
PImage pulledImage;
String url = "http://browse.deviantart.com/?order=5";

String webpage = "";
String [] webpageArray = loadStrings(url);
boolean done = false;
String[] m1;

void setup(){
  size(640,480);
  
  for(int i=0;i<webpageArray.length;i++){
   // println(webpageArray[i]);
    webpage += webpageArray[i];
  }
  
  webpage = webpage.replace("  "," ");
  webpage = webpage.replace("	","");
  
  m1 = match(webpage, "super_img=\"([^\"]*)\" super_w=");
  
  pulledImage = loadImage(m1[1]);
  
  //println(m1[1]);
 //  println(webpage);
  noLoop();
}


void draw() {
  background(255);
  fill(0);
  while(done == false){
    try
    {
      println(m1[1]);
      image(pulledImage, 0, 0);
      done = true;
    }catch (NullPointerException e){
      println("Error caught! Retrying to download & display image!");
       webpageArray = loadStrings(url);
       for(int i=0;i<webpageArray.length;i++){
          webpage += webpageArray[i];
       }
       webpage = webpage.replace("  "," ");
       webpage = webpage.replace("	","");
       m1 = match(webpage, "super_img=\"([^\"]*)\" super_w=");
       pulledImage = loadImage(m1[1]);       
    }     
  }
}

