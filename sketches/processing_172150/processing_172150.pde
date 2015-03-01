
PImage img;
//PImage photo;
float speed = 2.0;
float move;
 

 }
 void setup() { 
  size(400, 400);
  photo=loadImage("http://1.bp.blogspot.com/-5CO7x9vuYqM/UioQcaLoCYI/AAAAAAAACjg/osbeeGf6Tig/s1600/minion_icon_image_picfishblogspotcom+%252810%2529.png");
img=loadImage("http://asi-roads.com/media/img/road.png");
 
}
 
void draw() { 
background(0,255);
 //  background(img);
//draw function loops
  move=move+speed;
   
  image(img,0,0,400,400);
  image(photo,10,10,move,move,279,300);
  if (move > 400) {
  move=0;
}
 void setup() { 
  size(400, 400);
  photo=loadImage("http://png.bychuhe.com/wp-content/uploads/2014/07/banana-png-image-6-300x230.jpg");
img=loadImage("http://asi-roads.com/media/img/road.png");
 
}
 
void draw() { 
background(0,255);
 //  background(img);
//draw function loops
  move=move+speed;
   
  image(img,0,0,400,400);
  image(photo,10,10,move,move,279,300);
  if (move > 400) {
  move=0;
}
