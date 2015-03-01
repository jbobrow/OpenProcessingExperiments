
PImage webImg;
int batZero=0;
int timeZero=8;
int step=1;
void setup(){
  size(800,500);

  
println(hour(), ":", minute());  
String url = "http://i.imgur.com/tYnk7BG.png";
webImg = loadImage(url, "png");
}

float a=hour();

void draw(){

body();
if(hour()>20||hour()<8){

  if(second()<50){
batfly();}
else
{bite();
}
}
else{
  daytime()

}
}

void body(){
  ellipse(250,250,50-(3*hour()*minute()),50);}
  
  
void batfly() {
  background(0, 0, 0);
  image(webImg, batZero, 50);
  batZero+=step;
  if (batZero > 800) {
    step = -1;
  }
  
   if (batZero < 0) {
    step = 1;
  }
}

void bite(){}


void daytime(){
  

