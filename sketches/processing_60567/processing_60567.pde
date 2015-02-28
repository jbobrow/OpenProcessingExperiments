
PImage rps;
String[]urlrps={"paper.jpg","rock.jpg","scissors.jpg"};
PImage dice;
String[]urldice={"1.JPG","2.JPG","3.JPG","4.JPG","5.JPG","6.JPG"};

void setup(){
  size(500,370);
  PImage index;
  index=loadImage("index.JPG");
  imageMode(CENTER);
  image(index, width/2,height/2);
}
void draw(){
  if(keyPressed){
    if(key=='1'){
       rps=loadImage(urlrps[int(random(3))]);
       imageMode(CENTER);
       image(rps, width/2,height/2);
       }}
   if(keyPressed){
      if(key=='2'){
      dice=loadImage(urldice[int(random(6))]);
       imageMode(CENTER);
       image(dice, width/2,height/2);
       }}
  if(keyPressed){
      if(key=='0'){
        PImage index;
        index=loadImage("index.JPG");
        imageMode(CENTER);
        image(index, width/2,height/2);
       }}
 }


